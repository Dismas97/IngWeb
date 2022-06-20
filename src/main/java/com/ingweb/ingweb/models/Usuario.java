package com.ingweb.ingweb.models;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;

@Entity
@Table(name="usuarios")
public class Usuario {
    @Getter @Setter @Column(name = "id") @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Getter @Setter @Column(name = "alias")
    private String alias;

    @Getter @Setter @Column(name = "email")
    private String email;

    @Getter @Setter @Column(name = "contra")
    private String contra;

    @Getter @Setter @Column(name = "admin")
    private boolean admin;
}
