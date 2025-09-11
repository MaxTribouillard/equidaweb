package test;

import model.CategVente;
import model.Vente;
import model.Lieu;

public class TestCheval {

    public static void main(String[] args) {

        // Test Many Cheval to One Race
        model.Race race = new model.Race();
        race.setId(1);
        race.setNom("Pur Sang");

        model.Cheval cheval1 = new model.Cheval();
        cheval1.setId(101);
        cheval1.setNom("Eclair");
        cheval1.setRace(race);

        model.Cheval cheval2 = new model.Cheval();
        cheval2.setId(102);
        cheval2.setNom("Tonnerre");
        cheval2.setRace(race);

        System.out.println("Cheval1: " + cheval1.getNom() + ", Race: " + cheval1.getRace().getNom());
        System.out.println("Cheval2: " + cheval2.getNom() + ", Race: " + cheval2.getRace().getNom());

        // Test Many Vente to One Lieu
        model.Lieu lieu = new model.Lieu();
        lieu.setId(1);
        lieu.setVille("Domfront");

        model.Vente vente1 = new model.Vente();
        vente1.setId(201);
        vente1.setNom("Vente Printemps");
        vente1.setLieu(lieu);

        model.Vente vente2 = new model.Vente();
        vente2.setId(202);
        vente2.setNom("Vente Été");
        vente2.setLieu(lieu);

        System.out.println("Vente1: " + vente1.getNom() + ", Lieu: " + vente1.getLieu().getVille());
        System.out.println("Vente2: " + vente2.getNom() + ", Lieu: " + vente2.getLieu().getVille());

        // Test Many Vente to One CategVente
        model.CategVente categ = new model.CategVente();
        categ.setCode("14A");
        categ.setLibelle("Vente de cheval pure sang");

        model.Vente vente3 = new model.Vente();
        vente3.setId(203);
        vente3.setNom("Vente Automne");
        vente3.setCategVente(categ);

        model.Vente vente4 = new model.Vente();
        vente4.setId(204);
        vente4.setNom("Vente Hiver");
        vente4.setCategVente(categ);

        System.out.println("Vente3: " + vente3.getNom() + ", Catégorie: " + vente3.getCategVente().getLibelle());
        System.out.println("Vente4: " + vente4.getNom() + ", Catégorie: " + vente4.getCategVente().getLibelle());
        System.out.println("Catégorie partagée: " + (vente3.getCategVente() == vente4.getCategVente()));
    }

}
