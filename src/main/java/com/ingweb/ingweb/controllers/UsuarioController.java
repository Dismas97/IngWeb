package com.ingweb.ingweb.controllers;

import com.ingweb.ingweb.DAO.MangaDAO;
import com.ingweb.ingweb.DAO.MangaDAOImp;
import com.ingweb.ingweb.DAO.UsuarioDAO;
import com.ingweb.ingweb.DAO.UsuarioDAOImp;
import com.ingweb.ingweb.models.Manga;
import com.ingweb.ingweb.models.Usuario;
import com.ingweb.ingweb.utils.JWTUtil;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.Optional;

@RestController
public class UsuarioController {
    @Autowired
    private UsuarioDAO dao = new UsuarioDAOImp();
    @Autowired
    private MangaDAO mangadao = new MangaDAOImp();

    @Autowired
    private JWTUtil jwtUtil;

    @PostMapping(value = "admin/{id}/modificarManga")
    ResponseEntity<String> modificarManga(@PathVariable Long id, @RequestParam("mangaid") Long mangaid, @RequestParam("nombre") String nombre,
                                      @RequestParam("descripcion") String descripcion, @RequestParam("port") Optional<MultipartFile> port){
        if(dao.getUsuario(id).isAdmin()) {
            if (!port.isPresent()) {
                mangadao.modificar(mangaid,nombre,descripcion);
                return ResponseEntity.status(HttpStatus.OK).body("Manga subido con exito, sin portada");
            } else {
                mangadao.modificar(mangaid,nombre,descripcion,port.get());
                return ResponseEntity.status(HttpStatus.OK).body("Manga subido con exito");
            }
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El usuario no es administrador");
    }
    @PostMapping(value = "admin/{id}/subirmanga")
    ResponseEntity<String> subirManga(@PathVariable Long id, @RequestParam("nombre") String nombre,
                       @RequestParam("descripcion") String descripcion, @RequestParam("port") MultipartFile port){
        if(dao.getUsuario(id).isAdmin()){
            Manga aux = new Manga();
            aux.setDescripcion(descripcion);
            aux.setNombre(nombre);
            try {
                mangadao.altaManga(aux,port);
                return ResponseEntity.status(HttpStatus.OK).body("Manga subido con exito");
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Hubo un error al subir el archivo");
            }
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El usuario no es administrador");
    }

    @DeleteMapping(value = "admin/{id}/borrarmanga")
    ResponseEntity<String> borrarManga(@PathVariable Long id, @RequestParam("mangaid") Long mangaid){
        if(dao.getUsuario(id).isAdmin()){
            mangadao.bajaManga(mangaid);
            return ResponseEntity.status(HttpStatus.OK).body("Manga Eliminado con exito");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El usuario no es administrador");
    }

    @PostMapping(value = "registrarse")
    void registrar(@RequestBody Usuario nuevo){
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        String hash = argon2.hash(1,1024,1,nuevo.getContra());
        nuevo.setContra(hash);
        dao.altaUsuario(nuevo);
    }

    @PostMapping(value = "login")
    String login(@RequestBody Usuario nuevo){
        Usuario aux = dao.verificar(nuevo);
        if(aux != null){
            return jwtUtil.create(String.valueOf(aux.getId()),aux.getAlias());
        }
        else{
            return "ERROR";
        }
    }
}
