package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Manga;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

@Repository
@Transactional
public class MangaDAOImp implements MangaDAO{
    private EntityManager conexion;
    @Override
    public Manga getManga(long id) {
        return null;
    }
}
