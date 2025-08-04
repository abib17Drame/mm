package info.cam.cam.khatma_app;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;
import java.util.Date;
import java.util.List;

/* loaded from: classes.dex */
public class MainActivity extends ActionBarActivity implements AdapterView.OnItemClickListener {
    public static final String couleurDefaut = "#FFFFFF";
    public static final String couleurDouaa = "#00FFFF";
    public static final String couleurSoujoud = "#800000";
    KhatmaBdHelper bdHelper;
    TextView button;
    int id;
    LinearLayout linearLayout;
    List<String> listVerser;
    AbsListView listView;
    TextView text0;
    TextView text1;
    TextView text2;
    TextView text3;
    TextView text4;
    Date session = new Date(116, 1, 17);
    Date date_actuel = new Date();
    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, 0);

    public void precedent(View view) {
        this.date_actuel.setDate(this.date_actuel.getDate() + 1);
        affichage(this.date_actuel);
    }

    public void suivant(View view) {
        this.date_actuel.setDate(this.date_actuel.getDate() - 1);
        affichage(this.date_actuel);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> parent, View view, int position, long id1) {
        if (this.id == 1) {
            if (position == 0) {
                visualisationQuran(this.id, 1);
                return;
            }
            if (position == 1) {
                visualisationQuran(this.id, 2);
                return;
            }
            if (position == 2) {
                Intent duaa = new Intent(this, (Class<?>) Duaa.class);
                startActivityForResult(duaa, 1);
                return;
            } else {
                if (position == 3) {
                    visualisationQuran(this.id, 3);
                    return;
                }
                return;
            }
        }
        if (position == 0) {
            visualisationQuran(this.id, 1);
        } else if (position == 1) {
            visualisationQuran(this.id, 2);
        } else if (position == 2) {
            visualisationQuran(this.id, 3);
        }
    }

    @Override // android.support.v7.app.ActionBarActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityDonut, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        this.bdHelper = new KhatmaBdHelper(this);
        this.date_actuel = new Date();
        this.date_actuel.setHours(0);
        this.date_actuel.setMinutes(0);
        this.date_actuel.setSeconds(0);
        if (this.bdHelper.nombreLigne() == 0) {
            this.session = majSession(this.session);
            List<Verser> liste = Verser.listeVers();
            this.bdHelper.ajouterLigne(new Khatma(liste.get(0).getVerser1(), liste.get(0).getVerser2(), liste.get(0).getVerser3(), this.session, liste.get(0).getJour()));
            for (int i = 1; i < liste.size(); i++) {
                this.bdHelper.ajouterLigne(new Khatma(liste.get(i).getVerser1(), liste.get(i).getVerser2(), liste.get(i).getVerser3(), null, liste.get(i).getJour()));
            }
        } else {
            Date session_bd = this.bdHelper.getdernierSesseion();
            this.session = majSession(session_bd);
            if (this.session.getTime() != session_bd.getTime()) {
                this.bdHelper.updateSession(this.session);
                this.bdHelper.getdernierSesseion();
                this.session.setHours(0);
                this.session.setMinutes(0);
                this.session.setSeconds(0);
            }
        }
        this.listView = (AbsListView) findViewById(R.id.listViewMain);
        this.listView.setOnItemClickListener(this);
        this.text0 = (TextView) findViewById(R.id.edit0);
        this.linearLayout = (LinearLayout) findViewById(R.id.linlay);
        this.text0.setTextColor(Color.parseColor("#000000"));
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, 100, 0, "  قائمة الأحزاب  ");
        menu.add(0, 200, 0, "تواريخ الختمات القادمة");
        menu.add(0, 300, 0, "عن الختمة");
        menu.add(0, 400, 0, "من نحن");
        return true;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 100:
                Intent intent4 = new Intent(getApplicationContext(), (Class<?>) ListeAhzab.class);
                startActivity(intent4);
                break;
            case 200:
                Intent intent2 = new Intent(getApplicationContext(), (Class<?>) DernierDate.class);
                startActivity(intent2);
                break;
            case 300:
                Intent intent3 = new Intent(getApplicationContext(), (Class<?>) Infokhatma.class);
                startActivity(intent3);
                break;
            case 400:
                Intent intent = new Intent(getApplicationContext(), (Class<?>) Apropos.class);
                startActivity(intent);
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    public void visualisationQuran(int id, int position) {
        switch (id) {
            case 1:
                if (position == 1) {
                    Intent quran = new Intent(this, (Class<?>) Quran.class);
                    quran.putExtra(KhatmaBdHelper.KEY_ID, 59);
                    startActivityForResult(quran, 10);
                    break;
                } else if (position == 2) {
                    Intent quran2 = new Intent(this, (Class<?>) Quran.class);
                    quran2.putExtra(KhatmaBdHelper.KEY_ID, 60);
                    startActivityForResult(quran2, 10);
                    break;
                } else if (position == 3) {
                    Intent quran3 = new Intent(this, (Class<?>) Quran.class);
                    quran3.putExtra(KhatmaBdHelper.KEY_ID, 1);
                    startActivityForResult(quran3, 10);
                    break;
                }
                break;
            case 2:
                if (position == 1) {
                    Intent quran4 = new Intent(this, (Class<?>) Quran.class);
                    quran4.putExtra(KhatmaBdHelper.KEY_ID, 2);
                    startActivityForResult(quran4, 10);
                    break;
                } else if (position == 2) {
                    Intent quran5 = new Intent(this, (Class<?>) Quran.class);
                    quran5.putExtra(KhatmaBdHelper.KEY_ID, 3);
                    startActivityForResult(quran5, 10);
                    break;
                } else if (position == 3) {
                    Intent quran6 = new Intent(this, (Class<?>) Quran.class);
                    quran6.putExtra(KhatmaBdHelper.KEY_ID, 4);
                    startActivityForResult(quran6, 10);
                    break;
                }
                break;
            case 3:
                if (position == 1) {
                    Intent quran7 = new Intent(this, (Class<?>) Quran.class);
                    quran7.putExtra(KhatmaBdHelper.KEY_ID, 61);
                    startActivityForResult(quran7, 10);
                    break;
                } else if (position == 2) {
                    Intent quran8 = new Intent(this, (Class<?>) Quran.class);
                    quran8.putExtra(KhatmaBdHelper.KEY_ID, 5);
                    startActivityForResult(quran8, 10);
                    break;
                } else if (position == 3) {
                    Intent quran9 = new Intent(this, (Class<?>) Quran.class);
                    quran9.putExtra(KhatmaBdHelper.KEY_ID, 6);
                    startActivityForResult(quran9, 10);
                    break;
                }
                break;
            case 4:
                if (position == 1) {
                    Intent quran10 = new Intent(this, (Class<?>) Quran.class);
                    quran10.putExtra(KhatmaBdHelper.KEY_ID, 7);
                    startActivityForResult(quran10, 10);
                    break;
                } else if (position == 2) {
                    Intent quran11 = new Intent(this, (Class<?>) Quran.class);
                    quran11.putExtra(KhatmaBdHelper.KEY_ID, 8);
                    startActivityForResult(quran11, 10);
                    break;
                } else if (position == 3) {
                    Intent quran12 = new Intent(this, (Class<?>) Quran.class);
                    quran12.putExtra(KhatmaBdHelper.KEY_ID, 9);
                    startActivityForResult(quran12, 10);
                    break;
                }
                break;
            case 5:
                if (position == 1) {
                    Intent quran13 = new Intent(this, (Class<?>) Quran.class);
                    quran13.putExtra(KhatmaBdHelper.KEY_ID, 10);
                    startActivityForResult(quran13, 10);
                    break;
                } else if (position == 2) {
                    Intent quran14 = new Intent(this, (Class<?>) Quran.class);
                    quran14.putExtra(KhatmaBdHelper.KEY_ID, 11);
                    startActivityForResult(quran14, 10);
                    break;
                } else if (position == 3) {
                    Intent quran15 = new Intent(this, (Class<?>) Quran.class);
                    quran15.putExtra(KhatmaBdHelper.KEY_ID, 12);
                    startActivityForResult(quran15, 10);
                    break;
                }
                break;
            case 6:
                if (position == 1) {
                    Intent quran16 = new Intent(this, (Class<?>) Quran.class);
                    quran16.putExtra(KhatmaBdHelper.KEY_ID, 13);
                    startActivityForResult(quran16, 10);
                    break;
                } else if (position == 2) {
                    Intent quran17 = new Intent(this, (Class<?>) Quran.class);
                    quran17.putExtra(KhatmaBdHelper.KEY_ID, 14);
                    startActivityForResult(quran17, 10);
                    break;
                } else if (position == 3) {
                    Intent quran18 = new Intent(this, (Class<?>) Quran.class);
                    quran18.putExtra(KhatmaBdHelper.KEY_ID, 15);
                    startActivityForResult(quran18, 10);
                    break;
                }
                break;
            case 7:
                if (position == 1) {
                    Intent quran19 = new Intent(this, (Class<?>) Quran.class);
                    quran19.putExtra(KhatmaBdHelper.KEY_ID, 16);
                    startActivityForResult(quran19, 10);
                    break;
                } else if (position == 2) {
                    Intent quran20 = new Intent(this, (Class<?>) Quran.class);
                    quran20.putExtra(KhatmaBdHelper.KEY_ID, 17);
                    startActivityForResult(quran20, 10);
                    break;
                } else if (position == 3) {
                    Intent quran21 = new Intent(this, (Class<?>) Quran.class);
                    quran21.putExtra(KhatmaBdHelper.KEY_ID, 18);
                    startActivityForResult(quran21, 10);
                    break;
                }
                break;
            case 8:
                if (position == 1) {
                    Intent quran22 = new Intent(this, (Class<?>) Quran.class);
                    quran22.putExtra(KhatmaBdHelper.KEY_ID, 19);
                    startActivityForResult(quran22, 10);
                    break;
                } else if (position == 2) {
                    Intent quran23 = new Intent(this, (Class<?>) Quran.class);
                    quran23.putExtra(KhatmaBdHelper.KEY_ID, 20);
                    startActivityForResult(quran23, 10);
                    break;
                } else if (position == 3) {
                    Intent quran24 = new Intent(this, (Class<?>) Quran.class);
                    quran24.putExtra(KhatmaBdHelper.KEY_ID, 21);
                    startActivityForResult(quran24, 10);
                    break;
                }
                break;
            case 9:
                if (position == 1) {
                    Intent quran25 = new Intent(this, (Class<?>) Quran.class);
                    quran25.putExtra(KhatmaBdHelper.KEY_ID, 22);
                    startActivityForResult(quran25, 10);
                    break;
                } else if (position == 2) {
                    Intent quran26 = new Intent(this, (Class<?>) Quran.class);
                    quran26.putExtra(KhatmaBdHelper.KEY_ID, 23);
                    startActivityForResult(quran26, 10);
                    break;
                } else if (position == 3) {
                    Intent quran27 = new Intent(this, (Class<?>) Quran.class);
                    quran27.putExtra(KhatmaBdHelper.KEY_ID, 24);
                    startActivityForResult(quran27, 10);
                    break;
                }
                break;
            case 10:
                if (position == 1) {
                    Intent quran28 = new Intent(this, (Class<?>) Quran.class);
                    quran28.putExtra(KhatmaBdHelper.KEY_ID, 61);
                    startActivityForResult(quran28, 10);
                    break;
                } else if (position == 2) {
                    Intent quran29 = new Intent(this, (Class<?>) Quran.class);
                    quran29.putExtra(KhatmaBdHelper.KEY_ID, 25);
                    startActivityForResult(quran29, 10);
                    break;
                } else if (position == 3) {
                    Intent quran30 = new Intent(this, (Class<?>) Quran.class);
                    quran30.putExtra(KhatmaBdHelper.KEY_ID, 26);
                    startActivityForResult(quran30, 10);
                    break;
                }
                break;
            case 11:
                if (position == 1) {
                    Intent quran31 = new Intent(this, (Class<?>) Quran.class);
                    quran31.putExtra(KhatmaBdHelper.KEY_ID, 27);
                    startActivityForResult(quran31, 10);
                    break;
                } else if (position == 2) {
                    Intent quran32 = new Intent(this, (Class<?>) Quran.class);
                    quran32.putExtra(KhatmaBdHelper.KEY_ID, 28);
                    startActivityForResult(quran32, 10);
                    break;
                } else if (position == 3) {
                    Intent quran33 = new Intent(this, (Class<?>) Quran.class);
                    quran33.putExtra(KhatmaBdHelper.KEY_ID, 29);
                    startActivityForResult(quran33, 10);
                    break;
                }
                break;
            case 12:
                if (position == 1) {
                    Intent quran34 = new Intent(this, (Class<?>) Quran.class);
                    quran34.putExtra(KhatmaBdHelper.KEY_ID, 30);
                    startActivityForResult(quran34, 10);
                    break;
                } else if (position == 2) {
                    Intent quran35 = new Intent(this, (Class<?>) Quran.class);
                    quran35.putExtra(KhatmaBdHelper.KEY_ID, 31);
                    startActivityForResult(quran35, 10);
                    break;
                } else if (position == 3) {
                    Intent quran36 = new Intent(this, (Class<?>) Quran.class);
                    quran36.putExtra(KhatmaBdHelper.KEY_ID, 32);
                    startActivityForResult(quran36, 10);
                    break;
                }
                break;
            case 13:
                if (position == 1) {
                    Intent quran37 = new Intent(this, (Class<?>) Quran.class);
                    quran37.putExtra(KhatmaBdHelper.KEY_ID, 33);
                    startActivityForResult(quran37, 10);
                    break;
                } else if (position == 2) {
                    Intent quran38 = new Intent(this, (Class<?>) Quran.class);
                    quran38.putExtra(KhatmaBdHelper.KEY_ID, 34);
                    startActivityForResult(quran38, 10);
                    break;
                } else if (position == 3) {
                    Intent quran39 = new Intent(this, (Class<?>) Quran.class);
                    quran39.putExtra(KhatmaBdHelper.KEY_ID, 35);
                    startActivityForResult(quran39, 10);
                    break;
                }
                break;
            case 14:
                if (position == 1) {
                    Intent quran40 = new Intent(this, (Class<?>) Quran.class);
                    quran40.putExtra(KhatmaBdHelper.KEY_ID, 36);
                    startActivityForResult(quran40, 10);
                    break;
                } else if (position == 2) {
                    Intent quran41 = new Intent(this, (Class<?>) Quran.class);
                    quran41.putExtra(KhatmaBdHelper.KEY_ID, 37);
                    startActivityForResult(quran41, 10);
                    break;
                } else if (position == 3) {
                    Intent quran42 = new Intent(this, (Class<?>) Quran.class);
                    quran42.putExtra(KhatmaBdHelper.KEY_ID, 38);
                    startActivityForResult(quran42, 10);
                    break;
                }
                break;
            case 15:
                if (position == 1) {
                    Intent quran43 = new Intent(this, (Class<?>) Quran.class);
                    quran43.putExtra(KhatmaBdHelper.KEY_ID, 39);
                    startActivityForResult(quran43, 10);
                    break;
                } else if (position == 2) {
                    Intent quran44 = new Intent(this, (Class<?>) Quran.class);
                    quran44.putExtra(KhatmaBdHelper.KEY_ID, 40);
                    startActivityForResult(quran44, 10);
                    break;
                } else if (position == 3) {
                    Intent quran45 = new Intent(this, (Class<?>) Quran.class);
                    quran45.putExtra(KhatmaBdHelper.KEY_ID, 41);
                    startActivityForResult(quran45, 10);
                    break;
                }
                break;
            case 16:
                if (position == 1) {
                    Intent quran46 = new Intent(this, (Class<?>) Quran.class);
                    quran46.putExtra(KhatmaBdHelper.KEY_ID, 42);
                    startActivityForResult(quran46, 10);
                    break;
                } else if (position == 2) {
                    Intent quran47 = new Intent(this, (Class<?>) Quran.class);
                    quran47.putExtra(KhatmaBdHelper.KEY_ID, 43);
                    startActivityForResult(quran47, 10);
                    break;
                } else if (position == 3) {
                    Intent quran48 = new Intent(this, (Class<?>) Quran.class);
                    quran48.putExtra(KhatmaBdHelper.KEY_ID, 44);
                    startActivityForResult(quran48, 10);
                    break;
                }
                break;
            case 17:
                if (position == 1) {
                    Intent quran49 = new Intent(this, (Class<?>) Quran.class);
                    quran49.putExtra(KhatmaBdHelper.KEY_ID, 61);
                    startActivityForResult(quran49, 10);
                    break;
                } else if (position == 2) {
                    Intent quran50 = new Intent(this, (Class<?>) Quran.class);
                    quran50.putExtra(KhatmaBdHelper.KEY_ID, 45);
                    startActivityForResult(quran50, 10);
                    break;
                } else if (position == 3) {
                    Intent quran51 = new Intent(this, (Class<?>) Quran.class);
                    quran51.putExtra(KhatmaBdHelper.KEY_ID, 46);
                    startActivityForResult(quran51, 10);
                    break;
                }
                break;
            case 18:
                if (position == 1) {
                    Intent quran52 = new Intent(this, (Class<?>) Quran.class);
                    quran52.putExtra(KhatmaBdHelper.KEY_ID, 47);
                    startActivityForResult(quran52, 10);
                    break;
                } else if (position == 2) {
                    Intent quran53 = new Intent(this, (Class<?>) Quran.class);
                    quran53.putExtra(KhatmaBdHelper.KEY_ID, 48);
                    startActivityForResult(quran53, 10);
                    break;
                } else if (position == 3) {
                    Intent quran54 = new Intent(this, (Class<?>) Quran.class);
                    quran54.putExtra(KhatmaBdHelper.KEY_ID, 49);
                    startActivityForResult(quran54, 10);
                    break;
                }
                break;
            case 19:
                if (position == 1) {
                    Intent quran55 = new Intent(this, (Class<?>) Quran.class);
                    quran55.putExtra(KhatmaBdHelper.KEY_ID, 50);
                    startActivityForResult(quran55, 10);
                    break;
                } else if (position == 2) {
                    Intent quran56 = new Intent(this, (Class<?>) Quran.class);
                    quran56.putExtra(KhatmaBdHelper.KEY_ID, 51);
                    startActivityForResult(quran56, 10);
                    break;
                } else if (position == 3) {
                    Intent quran57 = new Intent(this, (Class<?>) Quran.class);
                    quran57.putExtra(KhatmaBdHelper.KEY_ID, 52);
                    startActivityForResult(quran57, 10);
                    break;
                }
                break;
            case 20:
                if (position == 1) {
                    Intent quran58 = new Intent(this, (Class<?>) Quran.class);
                    quran58.putExtra(KhatmaBdHelper.KEY_ID, 53);
                    startActivityForResult(quran58, 10);
                    break;
                } else if (position == 2) {
                    Intent quran59 = new Intent(this, (Class<?>) Quran.class);
                    quran59.putExtra(KhatmaBdHelper.KEY_ID, 54);
                    startActivityForResult(quran59, 10);
                    break;
                } else if (position == 3) {
                    Intent quran60 = new Intent(this, (Class<?>) Quran.class);
                    quran60.putExtra(KhatmaBdHelper.KEY_ID, 55);
                    startActivityForResult(quran60, 10);
                    break;
                }
                break;
            case 21:
                if (position == 1) {
                    Intent quran61 = new Intent(this, (Class<?>) Quran.class);
                    quran61.putExtra(KhatmaBdHelper.KEY_ID, 56);
                    startActivityForResult(quran61, 10);
                    break;
                } else if (position == 2) {
                    Intent quran62 = new Intent(this, (Class<?>) Quran.class);
                    quran62.putExtra(KhatmaBdHelper.KEY_ID, 57);
                    startActivityForResult(quran62, 10);
                    break;
                } else if (position == 3) {
                    Intent quran63 = new Intent(this, (Class<?>) Quran.class);
                    quran63.putExtra(KhatmaBdHelper.KEY_ID, 58);
                    startActivityForResult(quran63, 10);
                    break;
                }
                break;
        }
    }

    public void affichage(Date actuel) {
        if (this.bdHelper == null) {
            this.bdHelper = new KhatmaBdHelper(getApplicationContext());
        }
        Log.e("session new", "" + this.session);
        this.date_actuel.setHours(0);
        this.date_actuel.setMinutes(0);
        this.date_actuel.setSeconds(0);
        this.id = recherche(this.session, actuel);
        Log.e("id:    ", "" + this.id);
        Khatma ligne = this.bdHelper.getLigneById(this.id);
        this.text0.setText(ligne.getJour() + " " + (this.date_actuel.getYear() + 1900) + " / " + (this.date_actuel.getMonth() + 1) + " / " + this.date_actuel.getDate());
        AdapteurMain adapteurMain = new AdapteurMain(this, ligne, this.id);
        this.listView.setAdapter((ListAdapter) adapteurMain);
        this.listView.invalidateViews();
    }

    public int recherche(Date session, Date cour) {
        int diff = getJourDiff(session, cour);
        Log.e("diff= ", "" + diff);
        int i = 1;
        if (diff == 0) {
            return 1;
        }
        if (diff > 0) {
            if (diff < 21) {
                for (int k = 0; k < diff; k++) {
                    i++;
                }
            } else {
                for (int k2 = 0; k2 < diff; k2++) {
                    i++;
                    if (i == 22) {
                        i = 1;
                    }
                }
            }
            return i;
        }
        int diff2 = -diff;
        for (int k3 = 0; k3 < diff2; k3++) {
            i--;
            if (i == 0) {
                i = 21;
            }
        }
        return i;
    }

    public int getJourDiff(Date ses, Date d) {
        int d1 = (int) ((d.getTime() / 1000) / 86400);
        int ses1 = (int) ((ses.getTime() / 1000) / 86400);
        int diff = d1 - ses1;
        return diff;
    }

    public Date majSession(Date d) {
        int i = getJourDiff(d, new Date());
        if (i > 20) {
            int j = i / 21;
            int s = j * 21;
            d.setDate(d.getDate() + s);
        }
        return d;
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        affichage(this.date_actuel);
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
        this.bdHelper = null;
    }
}
