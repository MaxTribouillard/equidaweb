package test;

import java.sql.Connection;
import java.util.ArrayList;

import database.Connexionbdd;
import database.DaoCheval;
import database.DaoRace;
import model.Cheval;

public class TestConnexionBdd {

    public static void main (String args[]) {

        Connection cnx = Connexionbdd.ouvrirConnexion();
        System.out.println ("nombre de chevaux = " + DaoCheval.getLesChevaux(cnx).size());


        System.out.println("Cheval 1 : " + DaoCheval.getLeCheval(cnx, 1).getPoids());


        for(Cheval c :  DaoCheval.getLesChevaux(cnx)) {
            System.out.println(" - Numéro :  " + c.getId() + " Nom : " + c.getNom() + " Sexe : " + c.getSexe() + " Naissance : " + c.getDateNaissance() + " ");
        }

    }

}
