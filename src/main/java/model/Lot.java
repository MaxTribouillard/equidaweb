package model;

public class Lot {

    private int id;
    private String prixDepart;

    private Cheval cheval;
    private Vente vente;

    public Lot(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrixDepart() {
        return prixDepart;
    }

    public void setPrixDepart(String prixDepart) {
        this.prixDepart = prixDepart;
    }

    public Cheval getCheval() {
        return cheval;
    }
    public void setCheval(Cheval cheval) {
        this.cheval = cheval;
    }
    public Vente getVente() {
        return vente;
    }
    public void setVente(Vente vente) {
        this.vente = vente;
    }


}
