package com.ingweb.ingweb.models;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="manga")
public class Manga {
    @Getter @Setter @Id
    private long id;
    @Getter @Setter
    private String nombre;
    @Getter @Setter
    private String descripcion;
    @Getter @Setter @OneToMany(mappedBy="manga")
    private List<Capitulo> caps;
}
