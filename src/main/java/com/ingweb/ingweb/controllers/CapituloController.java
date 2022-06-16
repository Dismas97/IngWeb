package com.ingweb.ingweb.controllers;
import com.ingweb.ingweb.DAO.CapituloDAO;
import com.ingweb.ingweb.DAO.CapituloDAOImp;
import com.ingweb.ingweb.models.Capitulo;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@RestController
public class CapituloController {
    @Autowired
    private CapituloDAO dao = new CapituloDAOImp();
    @RequestMapping(value = "manga/{id}/{capid}")
    public Capitulo getCapitulo(@PathVariable("id") Long mangaid, @PathVariable("capid") Long capid){
        return dao.getCapitulo(mangaid,capid);
    }

    @RequestMapping(value = "manga/{id}/{capid}/descargar", produces = { "application/zip" }, method = RequestMethod.GET)
    public ResponseEntity<Resource> descargar(@PathVariable("id") Long mangaid, @PathVariable("capid") Long capid) throws Exception {
        Capitulo cap = dao.getCapitulo(mangaid,capid);

        String ruta = "src\\main\\resources\\static\\Imagenes\\"+cap.obtenerManga().getId()+"\\"+cap.getId();
        Path archivo = Paths.get(ruta+"-"+cap.obtenerManga().getNombre()+"-"+cap.getNum()+".zip");
        Path carpeta = Paths.get(ruta);
        File comprimido = new File(ruta+"-"+cap.obtenerManga().getNombre()+"-"+cap.getNum()+".zip");
        if (comprimido.exists()){
            return getDescarga(archivo, comprimido, cap);
        }
        else{
            zipFolder(carpeta,archivo);
            return getDescarga(archivo, comprimido, cap);
        }
    }

    @NotNull
    private ResponseEntity<Resource> getDescarga(Path archivo, File comprimido ,Capitulo cap) throws IOException {
        Path path = Paths.get(String.valueOf(archivo));
        Long tam = comprimido.length();
        ByteArrayResource resource = new ByteArrayResource(Files.readAllBytes(path));
        comprimido.delete();
        return ResponseEntity.ok()
                .contentLength(tam)
                .header("Content-Disposition","attachment; filename="+
                        cap.obtenerManga().getNombre()+"-ID-"+cap.getId()+"-Cap-"+cap.getNum()+".zip")
                .contentType(MediaType.valueOf("application/zip"))
                .body(resource);
    }
    @RequestMapping(value = "manga/{id}/capitulos")
    public List<Capitulo> getCapitulos(@PathVariable Long id){ return dao.getCapitulos(id);}
    private static void zipFolder(Path sourceFolderPath, Path zipPath) throws Exception {
        ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipPath.toFile()));
        Files.walkFileTree(sourceFolderPath, new SimpleFileVisitor<Path>() {
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                zos.putNextEntry(new ZipEntry(sourceFolderPath.relativize(file).toString()));
                Files.copy(file, zos);
                zos.closeEntry();
                return FileVisitResult.CONTINUE;
            }
        });
        zos.close();
    }

}
