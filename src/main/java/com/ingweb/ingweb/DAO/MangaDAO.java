package com.ingweb.ingweb.DAO;
import com.ingweb.ingweb.models.Manga;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface MangaDAO {
    Manga getManga(long id);
    public List<Manga> getMangas(String nombre);
    public List<Manga> getMangas();
    void altaManga(Manga aux, MultipartFile portada) throws IOException;
    void bajaManga(long mangaid);

    Manga modificar(long id, String nombre, String descripcion);

    Manga modificar(long id, String nombre, String descripcion, MultipartFile port);

}
