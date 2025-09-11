package model;

import java.util.ArrayList;

public class CategVente {
    private String code;
    private String libelle;

    private ArrayList<Vente> ventes;



    public CategVente() {
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setVentes(ArrayList<Vente> ventes) {
        this.ventes = ventes;
    }

    public ArrayList<Vente> getVentes() {
        return ventes;
    }

    public void addVente(Vente vente) {
        if (this.ventes == null) {
            this.ventes = new ArrayList<>();
        }
        this.ventes.add(vente);
    }

}
