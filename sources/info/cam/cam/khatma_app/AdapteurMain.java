package info.cam.cam.khatma_app;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class AdapteurMain extends BaseAdapter {
    Context context;
    int id;
    Khatma khatma;
    List<String> list = new ArrayList();

    public AdapteurMain(Context context, Khatma khatma, int id) {
        this.context = context;
        this.khatma = khatma;
        this.id = id;
        if (id != 1) {
            this.list.add(khatma.getVerser1());
            this.list.add(khatma.getVerser2());
            this.list.add(khatma.getVerser3());
        } else {
            this.list.add(khatma.getVerser1());
            this.list.add(khatma.getVerser2());
            this.list.add("دعاء ختم القرآن الكريم");
            this.list.add(khatma.getVerser3());
        }
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.id != 1 ? 3 : 4;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.list.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return 0L;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater in = (LayoutInflater) this.context.getSystemService("layout_inflater");
        View r = in.inflate(R.layout.itemmain, parent, false);
        TextView edit = (TextView) r.findViewById(R.id.edit);
        if (getCount() == 4 && position == 2) {
            edit.setTextColor(Color.parseColor(MainActivity.couleurDouaa));
        }
        edit.setText(this.list.get(position));
        return r;
    }
}
