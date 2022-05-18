package com.ingweb.ingweb.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;

@Entity
@Table(name="capitulo")
public class Capitulo {
    @Getter @Setter @Column(name = "id")
    private long id;
    @ManyToOne @JoinColumn(name="mangaid")
    Manga manga;
    @Getter @Setter @OneToMany(mappedBy="capitulo")
    private ArrayList<Long> pag;
}
