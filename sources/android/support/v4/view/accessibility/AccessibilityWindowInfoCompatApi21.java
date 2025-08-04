package android.support.v4.view.accessibility;

import android.graphics.Rect;
import android.view.accessibility.AccessibilityWindowInfo;

/* loaded from: classes.dex */
class AccessibilityWindowInfoCompatApi21 {
    AccessibilityWindowInfoCompatApi21() {
    }

    public static Object obtain() {
        return AccessibilityWindowInfo.obtain();
    }

    public static Object obtain(Object info2) {
        return AccessibilityWindowInfo.obtain((AccessibilityWindowInfo) info2);
    }

    public static int getType(Object info2) {
        return ((AccessibilityWindowInfo) info2).getType();
    }

    public static int getLayer(Object info2) {
        return ((AccessibilityWindowInfo) info2).getLayer();
    }

    public static Object getRoot(Object info2) {
        return ((AccessibilityWindowInfo) info2).getRoot();
    }

    public static Object getParent(Object info2) {
        return ((AccessibilityWindowInfo) info2).getParent();
    }

    public static int getId(Object info2) {
        return ((AccessibilityWindowInfo) info2).getId();
    }

    public static void getBoundsInScreen(Object info2, Rect outBounds) {
        ((AccessibilityWindowInfo) info2).getBoundsInScreen(outBounds);
    }

    public static boolean isActive(Object info2) {
        return ((AccessibilityWindowInfo) info2).isActive();
    }

    public static boolean isFocused(Object info2) {
        return ((AccessibilityWindowInfo) info2).isFocused();
    }

    public static boolean isAccessibilityFocused(Object info2) {
        return ((AccessibilityWindowInfo) info2).isAccessibilityFocused();
    }

    public static int getChildCount(Object info2) {
        return ((AccessibilityWindowInfo) info2).getChildCount();
    }

    public static Object getChild(Object info2, int index) {
        return ((AccessibilityWindowInfo) info2).getChild(index);
    }

    public static void recycle(Object info2) {
        ((AccessibilityWindowInfo) info2).recycle();
    }
}
