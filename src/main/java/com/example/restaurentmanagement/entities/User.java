package com.example.restaurentmanagement.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer idPersonne;
    private String nomPersonne;
    private String prenomPersonne;
    private Date datenaissPersonne;

    public User(String nomPersonne, String prenomPersonne, Date datenaissPersonne) {
        this.nomPersonne = nomPersonne;
        this.prenomPersonne = prenomPersonne;
        this.datenaissPersonne = datenaissPersonne;
    }

    public User() {
    }

    public Date getDatenaissPersonne() {
        return datenaissPersonne;
    }

    public Integer getIdPersonne() {
        return idPersonne;
    }

    public String getNomPersonne() {
        return nomPersonne;
    }

    public String getPrenomPersonne() {
        return prenomPersonne;
    }

    public void setDatenaissPersonne(Date date) {
        datenaissPersonne = date;
    }

    public void setIdPersonne(Integer integer) {
        idPersonne = integer;
    }

    public void setNomPersonne(String string) {
        nomPersonne = string;
    }

    public void setPrenomPersonne(String string) {
        prenomPersonne = string;
    }
}
