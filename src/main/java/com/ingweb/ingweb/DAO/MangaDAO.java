package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Manga;

import java.util.List;

public interface MangaDAO {
    Manga getManga(long id);

    public List<Manga> getMangas(String nombre);
}
