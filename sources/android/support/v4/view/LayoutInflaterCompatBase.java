package android.support.v4.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;

/* loaded from: classes.dex */
class LayoutInflaterCompatBase {
    LayoutInflaterCompatBase() {
    }

    static class FactoryWrapper implements LayoutInflater.Factory {
        final LayoutInflaterFactory mDelegateFactory;

        FactoryWrapper(LayoutInflaterFactory delegateFactory) {
            this.mDelegateFactory = delegateFactory;
        }

        @Override // android.view.LayoutInflater.Factory
        public View onCreateView(String name, Context context, AttributeSet attrs) {
            return this.mDelegateFactory.onCreateView(null, name, context, attrs);
        }

        public String toString() {
            return getClass().getName() + "{" + this.mDelegateFactory + "}";
        }
    }

    static void setFactory(LayoutInflater inflater, LayoutInflaterFactory factory) {
        inflater.setFactory(factory != null ? new FactoryWrapper(factory) : null);
    }
}
