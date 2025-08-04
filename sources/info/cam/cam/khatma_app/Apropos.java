package info.cam.cam.khatma_app;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;

/* loaded from: classes.dex */
public class Apropos extends ActionBarActivity {
    Button retour;

    @Override // android.support.v7.app.ActionBarActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityDonut, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_apropos);
        this.retour = (Button) findViewById(R.id.retourapropos);
        this.retour.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.Apropos.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Apropos.this.finish();
            }
        });
    }
}
