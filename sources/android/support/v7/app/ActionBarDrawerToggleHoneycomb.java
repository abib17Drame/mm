package android.support.v7.app;

import android.R;
import android.app.Activity;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
class ActionBarDrawerToggleHoneycomb {
    private static final String TAG = "ActionBarDrawerToggleHoneycomb";
    private static final int[] THEME_ATTRS = {R.attr.homeAsUpIndicator};

    ActionBarDrawerToggleHoneycomb() {
    }

    public static SetIndicatorInfo setActionBarUpIndicator(SetIndicatorInfo info2, Activity activity, Drawable drawable, int contentDescRes) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        SetIndicatorInfo info3 = new SetIndicatorInfo(activity);
        if (info3.setHomeAsUpIndicator != null) {
            try {
                android.app.ActionBar actionBar = activity.getActionBar();
                info3.setHomeAsUpIndicator.invoke(actionBar, drawable);
                info3.setHomeActionContentDescription.invoke(actionBar, Integer.valueOf(contentDescRes));
            } catch (Exception e) {
                Log.w(TAG, "Couldn't set home-as-up indicator via JB-MR2 API", e);
            }
        } else if (info3.upIndicatorView != null) {
            info3.upIndicatorView.setImageDrawable(drawable);
        } else {
            Log.w(TAG, "Couldn't set home-as-up indicator");
        }
        return info3;
    }

    public static SetIndicatorInfo setActionBarDescription(SetIndicatorInfo info2, Activity activity, int contentDescRes) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (info2 == null) {
            info2 = new SetIndicatorInfo(activity);
        }
        if (info2.setHomeAsUpIndicator != null) {
            try {
                android.app.ActionBar actionBar = activity.getActionBar();
                info2.setHomeActionContentDescription.invoke(actionBar, Integer.valueOf(contentDescRes));
                if (Build.VERSION.SDK_INT <= 19) {
                    actionBar.setSubtitle(actionBar.getSubtitle());
                }
            } catch (Exception e) {
                Log.w(TAG, "Couldn't set content description via JB-MR2 API", e);
            }
        }
        return info2;
    }

    public static Drawable getThemeUpIndicator(Activity activity) {
        TypedArray a = activity.obtainStyledAttributes(THEME_ATTRS);
        Drawable result = a.getDrawable(0);
        a.recycle();
        return result;
    }

    static class SetIndicatorInfo {
        public Method setHomeActionContentDescription;
        public Method setHomeAsUpIndicator;
        public ImageView upIndicatorView;

        SetIndicatorInfo(Activity activity) {
            try {
                this.setHomeAsUpIndicator = android.app.ActionBar.class.getDeclaredMethod("setHomeAsUpIndicator", Drawable.class);
                this.setHomeActionContentDescription = android.app.ActionBar.class.getDeclaredMethod("setHomeActionContentDescription", Integer.TYPE);
            } catch (NoSuchMethodException e) {
                View home = activity.findViewById(R.id.home);
                if (home != null) {
                    ViewGroup parent = (ViewGroup) home.getParent();
                    int childCount = parent.getChildCount();
                    if (childCount == 2) {
                        View first = parent.getChildAt(0);
                        View second = parent.getChildAt(1);
                        View up = first.getId() == 16908332 ? second : first;
                        if (up instanceof ImageView) {
                            this.upIndicatorView = (ImageView) up;
                        }
                    }
                }
            }
        }
    }
}
