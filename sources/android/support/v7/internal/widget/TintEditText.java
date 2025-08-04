package android.support.v7.internal.widget;

import android.R;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.EditText;

/* loaded from: classes.dex */
public class TintEditText extends EditText {
    private static final int[] TINT_ATTRS = {R.attr.background};

    public TintEditText(Context context) {
        this(context, null);
    }

    public TintEditText(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.editTextStyle);
    }

    public TintEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(context, attrs, TINT_ATTRS, defStyleAttr, 0);
        setBackgroundDrawable(a.getDrawable(0));
        a.recycle();
    }
}
