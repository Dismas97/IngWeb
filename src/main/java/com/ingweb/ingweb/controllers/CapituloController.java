package com.ingweb.ingweb.controllers;
import com.ingweb.ingweb.DAO.CapituloDAO;
import com.ingweb.ingweb.DAO.CapituloDAOImp;
import com.ingweb.ingweb.models.Capitulo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class CapituloController {
    @Autowired
    private CapituloDAO dao = new CapituloDAOImp();

    @RequestMapping(value = "manga/{id}/{capid}")
    public Capitulo getCapitulo(@PathVariable("id") Long mangaid, @PathVariable("capid") Long capid){
        return dao.getCapitulo(mangaid,capid);
    }
    @RequestMapping(value = "manga/{id}/capitulos")
    public List<Capitulo> getCapitulos(@PathVariable Long id){ return dao.getCapitulos(id);}


}
