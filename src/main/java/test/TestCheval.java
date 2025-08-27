package test;

import model.Race;
import model.Cheval;

public class TestCheval {

    public static void main(String[] args) {

        Cheval c = new Cheval();
        c.setId(2);
        c.setNom("Houri");

        Race r = new Race();
        r.setId(1);
        r.setNom("Pur-sang");

        c.setRace(r);

        System.out.println("Cheval : " + c.getId() + " " + c.getNom() + " " + c.getRace().getId() + " " + c.getRace().getNom());

    }

}
