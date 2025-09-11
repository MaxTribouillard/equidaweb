package model;

import java.util.ArrayList;

public class Race {

    private int id;
    private String nom;
    private ArrayList<Cheval> chevaux;

    public Race() {
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

    public ArrayList<Cheval> getChevaux() {
        return chevaux;
    }

    public void setChevaux(ArrayList<Cheval> chevaux) {
        this.chevaux = chevaux;
    }

    public void addCheval(Cheval cheval) {
        if (this.chevaux == null) {
            this.chevaux = new ArrayList<>();
        }
        this.chevaux.add(cheval);
    }


}
