package com.ingweb.ingweb.models;

import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="capitulo")
public class Capitulo implements Comparable<Capitulo> {
    @Getter @Setter @Column(name = "id") @Id
    private long id;
    @Getter @Setter @Column(name = "usuarioid")
    private long usuarioid;
    @Getter @Setter @Column(name = "num")
    private int num;
    @ManyToOne @JoinColumn(name="mangaid")
    Manga manga;
    public void setearManga(Manga manga) {
        this.manga = manga;
    }

    public Manga obtenerManga(){
        return this.manga;
    }
    @Getter @Setter
    @ElementCollection
    @CollectionTable(
            name = "pagina",
            joinColumns = @JoinColumn(name = "cap")
    )
    @Column(name="img")
    private List<String> pag;
    @Override
    public int compareTo(@NotNull Capitulo c){
        return this.num - c.num;
    }
}
