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
            req = cnx.prepareStatement("SELECT id as id_lot, prixDepart, numLot, Id_Vente FROM lot, vente WHERE lot.Id_vente = vente.Id_vente");
            res = req.executeQuery();
            while (res.next()) {
                Lot lot = new Lot();
                lot.setId(res.getInt("id_lot"));
                lot.setPrixDepart(res.getString("prixDepart"));
                lot.setNumLot(res.getString("numLot"));
            }
        }
        catch(Exception e){
            System.err.println(e);
        }

        return lesLots;
    }

    public static Lot getLotByVenteId(Connection cnx, int id){
        Lot lot = new Lot();

        try{
            req = cnx.prepareStatement("SELECT * FROM lot, cheval WHERE Id_vente=? AND lot.id=cheval.id");
            req.setInt(1, id);
            res = req.executeQuery();
            if(res.next()){
                lot.setId(res.getInt("id"));
                lot.setPrixDepart(res.getString("prixDepart"));
                lot.setNumLot(res.getString("numLot"));
                Cheval che = new Cheval();
                che.setId(res.getInt("id"));
                che.setNom(res.getString("nom"));
                che.setSexe(res.getString("sexe"));
                lot.setCheval(che);
            }
        }
        catch(Exception e){
            System.err.println(e);
        }
        return lot;
    }

};
