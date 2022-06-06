package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Usuario;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class UsuarioDAOImp implements UsuarioDAO{
    @PersistenceContext
    private EntityManager conexion;
    @Override
    public Usuario getUsuario(long id) {
        String query = "From Usuario U WHERE U.id = :userid";
        Usuario aux = (Usuario) conexion.createQuery(query).setParameter("userid",id).getSingleResult();
        return aux;
    }

}
