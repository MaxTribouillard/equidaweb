package model;

public class Vente {

    private int id;
    private String nom;
    private String dateDebutVente;

    private Lieu lieu;
    private CategVente categVente;

    public Vente() {

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

    public String getDateDebutVente() {
        return dateDebutVente;
    }

    public void setDateDebutVente(String dateDebutVente) {
        this.dateDebutVente = dateDebutVente;
    }

    public Lieu getLieu() {
        return lieu;
    }

    public void setLieu(Lieu lieu) {
       this.lieu = lieu;
    }

    public CategVente getCategVente() {
        return categVente;
    }

    public void setCategVente(CategVente categVente) {
        this.categVente = categVente;
    }

}
