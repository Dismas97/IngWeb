package com.ingweb.ingweb.DAO;
import com.ingweb.ingweb.models.Capitulo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Repository
@Transactional
public class CapituloDAOImp implements CapituloDAO{

    @PersistenceContext
    EntityManager conexion;
    @Override
    public Capitulo getCapitulo(Long mangaid, Long id) {
        String query = "FROM Capitulo C WHERE C.id = "+id+" AND C.manga.id = "+mangaid;
        return (Capitulo) conexion.createQuery(query).getSingleResult();
    }

    @Override
    public List<Capitulo> getCapitulos(Long mangaid) {
        String query = "From Capitulo C WHERE C.manga.id = "+mangaid+" ORDER BY C.num";
        return conexion.createQuery(query).getResultList();
    }

    @Override
    public void subirCapitulo(Capitulo aux, List<MultipartFile> paginas) throws IOException {
        Capitulo subido = conexion.merge(aux);
        String ruta= "Imagenes\\"+subido.obtenerManga().getId()+"\\"+subido.getId();
        Path carpeta = Paths.get("src\\main\\resources\\static\\"+ruta);
        Files.createDirectory(carpeta);
        List<String> pag = new ArrayList<>();
        for (MultipartFile p : paginas){
            Files.copy(p.getInputStream(),carpeta.resolve(p.getOriginalFilename()));
            pag.add(ruta+"\\"+p.getOriginalFilename());
        }
        subido.setPag(pag);
    }
}
