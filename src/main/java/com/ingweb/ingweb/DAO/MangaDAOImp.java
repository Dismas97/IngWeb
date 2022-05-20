package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Manga;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class MangaDAOImp implements MangaDAO{
    @PersistenceContext

    private EntityManager conexion;
    @Override
    public Manga getManga(long id) {
        String query = "From Manga M WHERE M.id = :mangaid";
        Manga aux = (Manga)conexion.createQuery(query).setParameter("mangaid",id).getSingleResult();
        aux.ordenarCaps();
        return aux;
    }
}
