package android.support.v7.app;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.support.v7.internal.view.SupportActionModeWrapper;
import android.support.v7.internal.widget.NativeActionModeAwareLayout;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.View;

@TargetApi(11)
/* loaded from: classes.dex */
class ActionBarActivityDelegateHC extends ActionBarActivityDelegateBase implements NativeActionModeAwareLayout.OnActionModeForChildListener {
    private NativeActionModeAwareLayout mNativeActionModeAwareLayout;

    ActionBarActivityDelegateHC(ActionBarActivity activity) {
        super(activity);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateBase
    void onSubDecorInstalled() {
        this.mNativeActionModeAwareLayout = (NativeActionModeAwareLayout) this.mActivity.findViewById(R.id.content);
        if (this.mNativeActionModeAwareLayout != null) {
            this.mNativeActionModeAwareLayout.setActionModeForChildListener(this);
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateBase, android.support.v7.app.ActionBarActivityDelegate
    boolean onKeyDown(int keyCode, KeyEvent event) {
        return false;
    }

    @Override // android.support.v7.internal.widget.NativeActionModeAwareLayout.OnActionModeForChildListener
    public ActionMode startActionModeForChild(View originalView, ActionMode.Callback callback) {
        Context context = originalView.getContext();
        android.support.v7.view.ActionMode supportActionMode = startSupportActionMode(new SupportActionModeWrapper.CallbackWrapper(context, callback));
        if (supportActionMode != null) {
            return new SupportActionModeWrapper(this.mActivity, supportActionMode);
        }
        return null;
    }
}
