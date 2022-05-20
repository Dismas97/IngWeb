package com.ingweb.ingweb.controllers;

import com.ingweb.ingweb.DAO.MangaDAO;
import com.ingweb.ingweb.DAO.MangaDAOImp;
import com.ingweb.ingweb.models.Manga;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MangaController {
    @Autowired
    MangaDAO dao = new MangaDAOImp();
    @RequestMapping(value = "manga/{id}")
    public Manga getManga(@PathVariable long id) {
        return dao.getManga(id);
    }

}
