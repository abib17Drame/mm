package info.cam.cam.khatma_app;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

/* loaded from: classes.dex */
public class AdapteurDuaa extends BaseAdapter {
    Context context;
    String texte;

    public AdapteurDuaa(Context context, String texte) {
        this.context = context;
        this.texte = texte;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return 1;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.texte;
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return 0L;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater in = (LayoutInflater) this.context.getSystemService("layout_inflater");
        View r = in.inflate(R.layout.texteduaa, parent, false);
        TextView textView = (TextView) r.findViewById(R.id.texteduaa);
        textView.setText(this.texte);
        return r;
    }
}
