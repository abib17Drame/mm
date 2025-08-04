package android.support.v7.internal.widget;

import android.R;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.CheckBox;

/* loaded from: classes.dex */
public class TintCheckBox extends CheckBox {
    private static final int[] TINT_ATTRS = {R.attr.button};
    private final TintManager mTintManager;

    public TintCheckBox(Context context) {
        this(context, null);
    }

    public TintCheckBox(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.checkboxStyle);
    }

    public TintCheckBox(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(context, attrs, TINT_ATTRS, defStyleAttr, 0);
        setButtonDrawable(a.getDrawable(0));
        a.recycle();
        this.mTintManager = a.getTintManager();
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(int resid) {
        setButtonDrawable(this.mTintManager.getDrawable(resid));
    }
}
