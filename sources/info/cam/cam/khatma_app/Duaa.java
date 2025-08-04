package info.cam.cam.khatma_app;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.AbsListView;
import android.widget.Button;
import android.widget.ListAdapter;

/* loaded from: classes.dex */
public class Duaa extends ActionBarActivity {
    AbsListView listView;
    Button retour;

    @Override // android.support.v7.app.ActionBarActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityDonut, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_duaa);
        this.listView = (AbsListView) findViewById(R.id.listView);
        this.listView.setAdapter((ListAdapter) new AdapteurDuaa(this, Verser.getDuaa()));
        this.retour = (Button) findViewById(R.id.retourDuaa);
        this.retour.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.Duaa.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Duaa.this.finish();
            }
        });
    }
}
