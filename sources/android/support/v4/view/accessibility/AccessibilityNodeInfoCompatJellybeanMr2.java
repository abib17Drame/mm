package android.support.v4.view.accessibility;

import android.view.accessibility.AccessibilityNodeInfo;
import java.util.List;

/* loaded from: classes.dex */
class AccessibilityNodeInfoCompatJellybeanMr2 {
    AccessibilityNodeInfoCompatJellybeanMr2() {
    }

    public static void setViewIdResourceName(Object info2, String viewId) {
        ((AccessibilityNodeInfo) info2).setViewIdResourceName(viewId);
    }

    public static String getViewIdResourceName(Object info2) {
        return ((AccessibilityNodeInfo) info2).getViewIdResourceName();
    }

    public static List<Object> findAccessibilityNodeInfosByViewId(Object info2, String viewId) {
        List result = ((AccessibilityNodeInfo) info2).findAccessibilityNodeInfosByViewId(viewId);
        return result;
    }

    public static void setTextSelection(Object info2, int start, int end) {
        ((AccessibilityNodeInfo) info2).setTextSelection(start, end);
    }

    public static int getTextSelectionStart(Object info2) {
        return ((AccessibilityNodeInfo) info2).getTextSelectionStart();
    }

    public static int getTextSelectionEnd(Object info2) {
        return ((AccessibilityNodeInfo) info2).getTextSelectionEnd();
    }

    public static boolean isEditable(Object info2) {
        return ((AccessibilityNodeInfo) info2).isEditable();
    }

    public static void setEditable(Object info2, boolean editable) {
        ((AccessibilityNodeInfo) info2).setEditable(editable);
    }

    public static boolean refresh(Object info2) {
        return ((AccessibilityNodeInfo) info2).refresh();
    }
}
