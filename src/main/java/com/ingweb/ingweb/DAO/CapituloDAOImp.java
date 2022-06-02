package com.ingweb.ingweb.DAO;
import com.ingweb.ingweb.models.Capitulo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class CapituloDAOImp implements CapituloDAO{

    @PersistenceContext
    EntityManager conexion;
    @Override
    public Capitulo getCapitulo(long mangaid, long id) {
        String query = "FROM Capitulo C WHERE C.id = "+id+" AND C.manga.id = "+mangaid;
        return (Capitulo) conexion.createQuery(query).getSingleResult();
    }

    @Override
    public List<Capitulo> getCapitulos(long mangaid) {
        String query = "From Capitulo C WHERE C.manga.id = "+mangaid+" ORDER BY C.num";
        return conexion.createQuery(query).getResultList();
    }

    @Override
    public void subirCapitulo(Capitulo aux, List<MultipartFile> paginas) {
        conexion.merge(aux);
    }
}
