package android.support.v4.view.accessibility;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

/* loaded from: classes.dex */
class AccessibilityNodeInfoCompatJellybeanMr1 {
    AccessibilityNodeInfoCompatJellybeanMr1() {
    }

    public static void setLabelFor(Object info2, View labeled) {
        ((AccessibilityNodeInfo) info2).setLabelFor(labeled);
    }

    public static void setLabelFor(Object info2, View root, int virtualDescendantId) {
        ((AccessibilityNodeInfo) info2).setLabelFor(root, virtualDescendantId);
    }

    public static Object getLabelFor(Object info2) {
        return ((AccessibilityNodeInfo) info2).getLabelFor();
    }

    public static void setLabeledBy(Object info2, View labeled) {
        ((AccessibilityNodeInfo) info2).setLabeledBy(labeled);
    }

    public static void setLabeledBy(Object info2, View root, int virtualDescendantId) {
        ((AccessibilityNodeInfo) info2).setLabeledBy(root, virtualDescendantId);
    }

    public static Object getLabeledBy(Object info2) {
        return ((AccessibilityNodeInfo) info2).getLabeledBy();
    }
}
