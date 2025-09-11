package model;

import java.util.ArrayList;

public class Lieu {

    private int id;
    private String ville;
    private int nbBoxes;
    private String commentaires;

    private ArrayList<Course> courses;


    public Lieu() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public int getNbBoxes() {
        return nbBoxes;
    }

    public void setNbBoxes(int nbBoxes) {
        this.nbBoxes = nbBoxes;
    }

    public String getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(String commentaires) {
        this.commentaires = commentaires;
    }

    public ArrayList<Course> getCourses() {
        return courses;
    }

    public void setCourses(ArrayList<Course> courses) {
        this.courses = courses;
    }

    public void addCourse(Course course) {
        if (this.courses == null) {
            this.courses = new ArrayList<>();
        }
        this.courses.add(course);
    }

}
