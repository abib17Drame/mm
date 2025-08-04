package info.cam.cam.khatma_app;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;

/* loaded from: classes.dex */
public class ListeAhzab extends ActionBarActivity implements AdapterView.OnItemClickListener {
    AbsListView listView;
    Button retour;

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Intent quran = new Intent(this, (Class<?>) Quran.class);
        quran.putExtra(KhatmaBdHelper.KEY_ID, position + 1);
        startActivityForResult(quran, 10);
    }

    @Override // android.support.v7.app.ActionBarActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityDonut, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste_ahzab);
        this.listView = (AbsListView) findViewById(R.id.listViewDernierDate);
        this.listView.setAdapter((ListAdapter) new AdapteurAhzab(this, Verser.getListeAhzab()));
        this.retour = (Button) findViewById(R.id.retourDernierDate);
        this.retour.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.ListeAhzab.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ListeAhzab.this.finish();
            }
        });
        this.listView.setOnItemClickListener(this);
    }
}
