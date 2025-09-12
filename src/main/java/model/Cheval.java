package model;

import java.time.LocalDate;

public class Cheval {

    private int id;
    private String nom;
    private String sexe;
    private String sire;
    private LocalDate dateNaissance;

    private Race race;
    private Robe robe;

    public Cheval() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(LocalDate dateNaissance) {
        this.dateNaissance = dateNaissance;
    }
    public Race getRace() {
        return race;
    }
    public void setRace(Race race) {
        this.race = race;
    }

    public String getSexe() {
        return sexe;
    }
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getSire() {
        return sire;
    }

    public void setSire(String sire) {
        this.sire = sire;
    }

    public Robe getRobe() {
        return robe;
    }

    public void setRobe(Robe robe) {
        this.robe = robe;
    }




}
