package com.ingweb.ingweb.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="capitulo")
public class Capitulo {
    @Getter @Setter @Column(name = "id") @Id
    private long id;
    @ManyToOne @JoinColumn(name="mangaid")
    Manga manga;
    @Getter @Setter
    @ElementCollection
    @CollectionTable(
            name = "pagina",
            joinColumns = @JoinColumn(name = "cap")
    )
    @Column(name="img")
    private List<String> pag;
}
