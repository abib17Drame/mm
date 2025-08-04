package android.support.v4.view.accessibility;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.List;

/* loaded from: classes.dex */
class AccessibilityNodeInfoCompatApi21 {
    AccessibilityNodeInfoCompatApi21() {
    }

    static List<Object> getActionList(Object info2) {
        List result = ((AccessibilityNodeInfo) info2).getActionList();
        return result;
    }

    static void addAction(Object info2, Object action) {
        ((AccessibilityNodeInfo) info2).addAction((AccessibilityNodeInfo.AccessibilityAction) action);
    }

    public static boolean removeAction(Object info2, Object action) {
        return ((AccessibilityNodeInfo) info2).removeAction((AccessibilityNodeInfo.AccessibilityAction) action);
    }

    public static Object obtainCollectionInfo(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
        return AccessibilityNodeInfo.CollectionInfo.obtain(rowCount, columnCount, hierarchical, selectionMode);
    }

    public static Object obtainCollectionItemInfo(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading, boolean selected) {
        return AccessibilityNodeInfo.CollectionItemInfo.obtain(rowIndex, rowSpan, columnIndex, columnSpan, heading, selected);
    }

    public static CharSequence getError(Object info2) {
        return ((AccessibilityNodeInfo) info2).getError();
    }

    public static void setError(Object info2, CharSequence error) {
        ((AccessibilityNodeInfo) info2).setError(error);
    }

    public static void setMaxTextLength(Object info2, int max) {
        ((AccessibilityNodeInfo) info2).setMaxTextLength(max);
    }

    public static int getMaxTextLength(Object info2) {
        return ((AccessibilityNodeInfo) info2).getMaxTextLength();
    }

    public static Object getWindow(Object info2) {
        return ((AccessibilityNodeInfo) info2).getWindow();
    }

    public static boolean removeChild(Object info2, View child) {
        return ((AccessibilityNodeInfo) info2).removeChild(child);
    }

    public static boolean removeChild(Object info2, View root, int virtualDescendantId) {
        return ((AccessibilityNodeInfo) info2).removeChild(root, virtualDescendantId);
    }

    static class CollectionItemInfo {
        CollectionItemInfo() {
        }

        public static boolean isSelected(Object info2) {
            return ((AccessibilityNodeInfo.CollectionItemInfo) info2).isSelected();
        }
    }

    static Object newAccessibilityAction(int actionId, CharSequence label) {
        return new AccessibilityNodeInfo.AccessibilityAction(actionId, label);
    }

    static int getAccessibilityActionId(Object action) {
        return ((AccessibilityNodeInfo.AccessibilityAction) action).getId();
    }

    static CharSequence getAccessibilityActionLabel(Object action) {
        return ((AccessibilityNodeInfo.AccessibilityAction) action).getLabel();
    }
}
