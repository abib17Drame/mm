package android.support.v4.net;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/* loaded from: classes.dex */
class ConnectivityManagerCompatGingerbread {
    ConnectivityManagerCompatGingerbread() {
    }

    public static boolean isActiveNetworkMetered(ConnectivityManager cm) {
        NetworkInfo info2 = cm.getActiveNetworkInfo();
        if (info2 == null) {
            return true;
        }
        int type = info2.getType();
        switch (type) {
        }
        return true;
    }
}
