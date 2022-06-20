package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Usuario;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

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

    @Override
    public void altaUsuario(Usuario nuevo) {
        Usuario subido = conexion.merge(nuevo);
    }

    @Override
    public Usuario verificar(@NotNull Usuario user) {
        String query = "From Usuario U WHERE U.email = :email";
        List<Usuario> aux = conexion.createQuery(query)
                .setParameter("email",user.getEmail())
                .getResultList();
        if(!aux.isEmpty()) {
            String hash = aux.get(0).getContra();
            Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
            if(argon2.verify(hash,user.getContra()))
                return aux.get(0);
        }
        return null;
    }

}
