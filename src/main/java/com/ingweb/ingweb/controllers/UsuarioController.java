package com.ingweb.ingweb.controllers;

import com.ingweb.ingweb.DAO.MangaDAO;
import com.ingweb.ingweb.DAO.MangaDAOImp;
import com.ingweb.ingweb.DAO.UsuarioDAO;
import com.ingweb.ingweb.DAO.UsuarioDAOImp;
import com.ingweb.ingweb.models.Manga;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.PostRemove;
import java.io.IOException;

@RestController
public class UsuarioController {
    @Autowired
    UsuarioDAO dao = new UsuarioDAOImp();
    @Autowired
    MangaDAO mangadao = new MangaDAOImp();

    @PostMapping(value = "admin/{id}/subirmanga")
    ResponseEntity<String> subirManga(@PathVariable long id, @RequestParam("nombre") String nombre,
                       @RequestParam("descripcion") String descripcion, @RequestParam("port") MultipartFile port){
        if(dao.getUsuario(id).isAdmin()){
            Manga aux = new Manga();
            aux.setDescripcion(descripcion);
            aux.setNombre(nombre);
            try {
                mangadao.altaManga(aux,port);
                return ResponseEntity.status(HttpStatus.OK).body("Capitulo subido con exito");
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Hubo un error al subir el archivo");
            }
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El usuario no es administrador");
    }

    @DeleteMapping(value = "admin/{id}/borrarmanga")
    ResponseEntity<String> borrarManga(@PathVariable long id, @RequestParam("mangaid") long mangaid){
        if(dao.getUsuario(id).isAdmin()){
                mangadao.bajaManga(mangaid);
                return ResponseEntity.status(HttpStatus.OK).body("Manga Eliminado con exito");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El usuario no es administrador");
    }

}
