package database;

import model.Cheval;
import model.Vente;
import model.Lot;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoVente {

    Connection cnx;
    static PreparedStatement req = null;
    static ResultSet res = null;

    public static ArrayList<Vente> getLesVentes(Connection cnx){
        ArrayList<Vente> listeVentes = new ArrayList<Vente>();
        try {
            req = cnx.prepareStatement("SELECT Id_vente, nom, dateDebutVente FROM vente");
            res = req.executeQuery();
            while (res.next()) {
                Vente vente = new Vente();
                vente.setId(res.getInt("Id_vente"));
                vente.setNom(res.getString("nom"));
                vente.setDateDebutVente(res.getString("dateDebutVente"));
                listeVentes.add(vente);
            }
        }

        catch(Exception e){
            System.err.println(e);
        }
    return listeVentes;
    }

    public static Vente getVenteById(Connection cnx, int id){

        Vente vente = new Vente();

        try{
            req = cnx.prepareStatement("SELECT Id_vente, nom FROM vente WHERE Id_vente=?");
            req.setInt(1, id);
            res = req.executeQuery();

            if (res.next()) {
                vente.setId(res.getInt("Id_vente"));
                vente.setNom(res.getString("nom"));
            }

        }

        catch(Exception e){
            System.err.println(e);
        }

        return vente;
    }

    public static ArrayList<Lot> getLesLots(Connection cnx){
        ArrayList<Lot> lesLots = new ArrayList<>();

        try{
            req = cnx.prepareStatement("SELECT id as id_lot, prixDepart, numLot, lot.Id_Vente FROM lot, vente WHERE lot.Id_vente = vente.Id_vente");
            res = req.executeQuery();
            while (res.next()) {
                Lot lot = new Lot();
                lot.setId(res.getInt("id_lot"));
                lot.setPrixDepart(res.getString("prixDepart"));
                lot.setNumLot(res.getString("numLot"));
                lesLots.add(lot);
            }
        }
        catch(Exception e){
            System.err.println(e);
        }

        return lesLots;
    }

    public static ArrayList<Lot> getLotsByVenteId(Connection cnx, int id){
        ArrayList<Lot> lesLots = new ArrayList<>();

        try{
            req = cnx.prepareStatement("SELECT * FROM lot JOIN cheval ON lot.id = cheval.id JOIN race ON cheval.id_race = race.id_race WHERE lot.Id_Vente = ?;");
            req.setInt(1, id);
            res = req.executeQuery();

                while (res.next()) {
                    Lot lot = new Lot();
                    lot.setId(res.getInt("id"));
                    lot.setPrixDepart(res.getString("prixDepart"));
                    lot.setNumLot(res.getString("numLot"));
                    Cheval c = new Cheval();
                    c.setId(res.getInt("id"));
                    c.setSexe(res.getString("sexe"));
                    c.setNom(res.getString("nom"));
                    c.setDateNaissance(res.getDate("date_naissance").toLocalDate());
                    c.setSire(res.getString("sire"));

                    lesLots.add(lot);
                }

        }
        catch(Exception e){
            System.err.println(e);
        }
        return lesLots;
    }

};
