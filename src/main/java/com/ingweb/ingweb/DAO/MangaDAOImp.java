package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Manga;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

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

    @Override
    public List<Manga> getMangas(String nombre){
        String query = "From Manga as M WHERE M.nombre LIKE :nombre";
        return conexion.createQuery(query).setParameter("nombre", "%" + nombre + "%").getResultList();
    }

    public List<Manga> getMangas(){
        String query = "From Manga";
        return conexion.createQuery(query).getResultList();
    }
}
