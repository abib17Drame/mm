package android.support.v4.view.accessibility;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

/* loaded from: classes.dex */
class AccessibilityNodeInfoCompatApi22 {
    AccessibilityNodeInfoCompatApi22() {
    }

    public static Object getTraversalBefore(Object info2) {
        return ((AccessibilityNodeInfo) info2).getTraversalBefore();
    }

    public static void setTraversalBefore(Object info2, View view) {
        ((AccessibilityNodeInfo) info2).setTraversalBefore(view);
    }

    public static void setTraversalBefore(Object info2, View root, int virtualDescendantId) {
        ((AccessibilityNodeInfo) info2).setTraversalBefore(root, virtualDescendantId);
    }

    public static Object getTraversalAfter(Object info2) {
        return ((AccessibilityNodeInfo) info2).getTraversalAfter();
    }

    public static void setTraversalAfter(Object info2, View view) {
        ((AccessibilityNodeInfo) info2).setTraversalAfter(view);
    }

    public static void setTraversalAfter(Object info2, View root, int virtualDescendantId) {
        ((AccessibilityNodeInfo) info2).setTraversalAfter(root, virtualDescendantId);
    }
}
