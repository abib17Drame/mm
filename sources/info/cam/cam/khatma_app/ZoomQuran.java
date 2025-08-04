package info.cam.cam.khatma_app;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

/* loaded from: classes.dex */
public class ZoomQuran extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle extra = getIntent().getExtras();
        int id = extra.getInt(KhatmaBdHelper.KEY_ID);
        TouchImageView img = new TouchImageView(this);
        img.setImageResource(id);
        img.setMaxZoom(4.0f);
        img.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.ZoomQuran.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ZoomQuran.this.finish();
            }
        });
        setContentView(img);
    }
}
