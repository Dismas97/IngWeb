package com.ingweb.ingweb.DAO;
import com.ingweb.ingweb.models.Capitulo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class CapituloDAOImp implements CapituloDAO{

    @PersistenceContext
    EntityManager conexion;
    @Override
    public List<Capitulo> getCapitulos() {
        String query = "FROM Capitulo";
        return conexion.createQuery(query).getResultList();
    }
}
