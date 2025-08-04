package android.support.v4.view;

import android.os.Build;
import android.view.LayoutInflater;

/* loaded from: classes.dex */
public class LayoutInflaterCompat {
    static final LayoutInflaterCompatImpl IMPL;

    interface LayoutInflaterCompatImpl {
        void setFactory(LayoutInflater layoutInflater, LayoutInflaterFactory layoutInflaterFactory);
    }

    static class LayoutInflaterCompatImplBase implements LayoutInflaterCompatImpl {
        LayoutInflaterCompatImplBase() {
        }

        @Override // android.support.v4.view.LayoutInflaterCompat.LayoutInflaterCompatImpl
        public void setFactory(LayoutInflater layoutInflater, LayoutInflaterFactory factory) {
            LayoutInflaterCompatBase.setFactory(layoutInflater, factory);
        }
    }

    static class LayoutInflaterCompatImplV11 extends LayoutInflaterCompatImplBase {
        LayoutInflaterCompatImplV11() {
        }

        @Override // android.support.v4.view.LayoutInflaterCompat.LayoutInflaterCompatImplBase, android.support.v4.view.LayoutInflaterCompat.LayoutInflaterCompatImpl
        public void setFactory(LayoutInflater layoutInflater, LayoutInflaterFactory factory) throws IllegalAccessException, IllegalArgumentException {
            LayoutInflaterCompatHC.setFactory(layoutInflater, factory);
        }
    }

    static class LayoutInflaterCompatImplV21 extends LayoutInflaterCompatImplV11 {
        LayoutInflaterCompatImplV21() {
        }

        @Override // android.support.v4.view.LayoutInflaterCompat.LayoutInflaterCompatImplV11, android.support.v4.view.LayoutInflaterCompat.LayoutInflaterCompatImplBase, android.support.v4.view.LayoutInflaterCompat.LayoutInflaterCompatImpl
        public void setFactory(LayoutInflater layoutInflater, LayoutInflaterFactory factory) {
            LayoutInflaterCompatLollipop.setFactory(layoutInflater, factory);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 21) {
            IMPL = new LayoutInflaterCompatImplV21();
        } else if (version >= 11) {
            IMPL = new LayoutInflaterCompatImplV11();
        } else {
            IMPL = new LayoutInflaterCompatImplBase();
        }
    }

    private LayoutInflaterCompat() {
    }

    public static void setFactory(LayoutInflater inflater, LayoutInflaterFactory factory) {
        IMPL.setFactory(inflater, factory);
    }
}
