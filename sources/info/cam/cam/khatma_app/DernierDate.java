package info.cam.cam.khatma_app;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.View;
import android.widget.AbsListView;
import android.widget.Button;
import android.widget.ListAdapter;
import java.util.Date;

/* loaded from: classes.dex */
public class DernierDate extends ActionBarActivity {
    AbsListView listView;
    Button retour;

    @Override // android.support.v7.app.ActionBarActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityDonut, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dernier_date);
        this.listView = (AbsListView) findViewById(R.id.listViewDernierDate);
        KhatmaBdHelper khatmaBdHelper = new KhatmaBdHelper(this);
        Date session = khatmaBdHelper.getdernierSesseion();
        Log.e("derniere date", session.toGMTString());
        this.listView.setAdapter((ListAdapter) new AdapteurDernierDate(this, Verser.liste10khatma(session)));
        this.retour = (Button) findViewById(R.id.retourDernierDate);
        this.retour.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.DernierDate.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                DernierDate.this.finish();
            }
        });
    }
}
