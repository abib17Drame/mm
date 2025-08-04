package info.cam.cam.khatma_app;

import java.util.Date;

/* loaded from: classes.dex */
public class Khatma {
    Date date;
    int id;
    String jour;
    String verser1;
    String verser2;
    String verser3;

    public Khatma() {
    }

    public Khatma(int id, String verser1, String verser2, String verser3, Date date, String jour) {
        this.verser1 = verser1;
        this.verser2 = verser2;
        this.verser3 = verser3;
        this.date = date;
        this.id = id;
        this.jour = jour;
    }

    public Khatma(String verser1, String verser2, String verser3, Date date, String jour) {
        this.jour = jour;
        this.verser1 = verser1;
        this.verser2 = verser2;
        this.verser3 = verser3;
        this.date = date;
    }

    public String getJour() {
        return this.jour;
    }

    public void setJour(String jour) {
        this.jour = jour;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVerser1() {
        return this.verser1;
    }

    public void setVerser1(String verser1) {
        this.verser1 = verser1;
    }

    public String getVerser2() {
        return this.verser2;
    }

    public void setVerser2(String verser2) {
        this.verser2 = verser2;
    }

    public String getVerser3() {
        return this.verser3;
    }

    public void setVerser3(String verser3) {
        this.verser3 = verser3;
    }

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
