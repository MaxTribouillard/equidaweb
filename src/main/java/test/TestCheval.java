package test;

import model.Vente;
import model.Lieu;

public class TestCheval {

    public static void main(String[] args) {

//        System.out.println("Cheval : " + c.getId() + " " + c.getNom() + " " + c.getRace().getId() + " " + c.getRace().getNom());

        Vente v = new Vente();
        v.setId(2);
        v.setNom("Vente de Benjamin");

        Lieu l = new Lieu();
        l.setId(1);
        l.setVille("Domfron");


        v.setLieu(l);

        System.out.println(v.getLieu().getCommentaires());

    }

}
