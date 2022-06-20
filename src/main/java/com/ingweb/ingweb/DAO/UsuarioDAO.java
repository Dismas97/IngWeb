package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Usuario;

public interface UsuarioDAO {
    Usuario getUsuario(long id);
    void altaUsuario(Usuario nuevo);
    Usuario verificar(Usuario user);
}
