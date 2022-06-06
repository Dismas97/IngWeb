package com.ingweb.ingweb.controllers;

import com.ingweb.ingweb.DAO.CapituloDAO;
import com.ingweb.ingweb.DAO.CapituloDAOImp;
import com.ingweb.ingweb.DAO.MangaDAO;
import com.ingweb.ingweb.DAO.MangaDAOImp;
import com.ingweb.ingweb.models.Capitulo;
import com.ingweb.ingweb.models.Manga;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
public class MangaController {
    @Autowired
    MangaDAO dao = new MangaDAOImp();
    @Autowired
    CapituloDAO daoCap= new CapituloDAOImp();
    @RequestMapping(value = "manga/{id}")
    public Manga getManga(@PathVariable long id) {
        return dao.getManga(id);
    }

    @RequestMapping(value = "manga")
    public List<Manga> getMangas(){return dao.getMangas();}

    @RequestMapping(value = "manga/busqueda")
    public List<Manga> getManga(@RequestParam String nombre){ return dao.getMangas(nombre);}

    @PostMapping(value = "manga/{id}/subida")
    public ResponseEntity<String> subirCapitulo(@PathVariable long id, @RequestParam("numCap") int numCap,
                                                @RequestParam("usuario") long iduser,
                                                @RequestParam("paginas") List<MultipartFile> paginas) {
        Capitulo aux = new Capitulo();
        aux.setNum(numCap);
        aux.setUsuarioid(iduser);
        aux.setearManga(dao.getManga(id));
        try {
            daoCap.subirCapitulo(aux, paginas);
            return ResponseEntity.status(HttpStatus.OK).body("Capitulo subido con exito");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Hubo un error al subir el archivo");
        }

    }


}
