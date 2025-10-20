package database;

import model.Cheval;
import model.Race;
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
            req = cnx.prepareStatement("SELECT lot.id AS lot_id, lot.numLot AS lot_numLot, lot.prixDepart AS lot_prixDepart, cheval.id AS cheval_id, cheval.nom AS cheval_nom, cheval.sexe AS cheval_sexe, cheval.date_naissance AS cheval_dateNaissance, cheval.sire AS cheval_sire, race.id_race AS race_id, race.nom AS race_nom FROM lot JOIN cheval ON lot.id = cheval.id JOIN race ON cheval.id_race = race.id_race WHERE lot.Id_Vente = ?;");
            req.setInt(1, id);
            res = req.executeQuery();

                while (res.next()) {
                    Lot lot = new Lot();
                    lot.setId(res.getInt("lot_id"));
                    lot.setNumLot(res.getString("lot_numLot"));
                    lot.setPrixDepart(res.getString("lot_prixDepart"));

                    Cheval c = new Cheval();
                    c.setId(res.getInt("cheval_id"));
                    c.setNom(res.getString("cheval_nom"));
                    c.setSexe(res.getString("cheval_sexe"));
                    c.setDateNaissance(res.getDate("cheval_dateNaissance").toLocalDate());
                    c.setSire(res.getString("cheval_sire"));

                    Race r = new Race();
                    r.setId(res.getInt("race_id"));
                    r.setNom(res.getString("race_nom"));

                    c.setRace(r);
                    lot.setCheval(c);

                    lesLots.add(lot);
                }

        }
        catch(Exception e){
            System.err.println(e);
        }
        return lesLots;
    }

};
