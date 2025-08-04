package info.cam.cam.khatma_app;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import java.util.List;

/* loaded from: classes.dex */
public class AdapteurDernierDate extends BaseAdapter {
    Context context;
    List<String> listeNom;

    public AdapteurDernierDate(Context context, List<String> listeNom) {
        this.context = context;
        this.listeNom = listeNom;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.listeNom.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.listeNom.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return 0L;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater in = (LayoutInflater) this.context.getSystemService("layout_inflater");
        View r = in.inflate(R.layout.textedernierdate, parent, false);
        TextView imageView = (TextView) r.findViewById(R.id.textdernierdate);
        imageView.setText(" ليلة الخميس " + this.listeNom.get(position) + " ");
        return r;
    }
}
