package android.support.v4.view.accessibility;

import android.os.Bundle;
import android.view.accessibility.AccessibilityNodeInfo;

/* loaded from: classes.dex */
class AccessibilityNodeInfoCompatKitKat {
    AccessibilityNodeInfoCompatKitKat() {
    }

    static int getLiveRegion(Object info2) {
        return ((AccessibilityNodeInfo) info2).getLiveRegion();
    }

    static void setLiveRegion(Object info2, int mode) {
        ((AccessibilityNodeInfo) info2).setLiveRegion(mode);
    }

    static Object getCollectionInfo(Object info2) {
        return ((AccessibilityNodeInfo) info2).getCollectionInfo();
    }

    static Object getCollectionItemInfo(Object info2) {
        return ((AccessibilityNodeInfo) info2).getCollectionItemInfo();
    }

    public static void setCollectionInfo(Object info2, Object collectionInfo) {
        ((AccessibilityNodeInfo) info2).setCollectionInfo((AccessibilityNodeInfo.CollectionInfo) collectionInfo);
    }

    public static void setCollectionItemInfo(Object info2, Object collectionItemInfo) {
        ((AccessibilityNodeInfo) info2).setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo) collectionItemInfo);
    }

    static Object getRangeInfo(Object info2) {
        return ((AccessibilityNodeInfo) info2).getRangeInfo();
    }

    public static void setRangeInfo(Object info2, Object rangeInfo) {
        ((AccessibilityNodeInfo) info2).setRangeInfo((AccessibilityNodeInfo.RangeInfo) rangeInfo);
    }

    public static Object obtainCollectionInfo(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
        return AccessibilityNodeInfo.CollectionInfo.obtain(rowCount, columnCount, hierarchical);
    }

    public static Object obtainCollectionItemInfo(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading) {
        return AccessibilityNodeInfo.CollectionItemInfo.obtain(rowIndex, rowSpan, columnIndex, columnSpan, heading);
    }

    public static void setContentInvalid(Object info2, boolean contentInvalid) {
        ((AccessibilityNodeInfo) info2).setContentInvalid(contentInvalid);
    }

    public static boolean isContentInvalid(Object info2) {
        return ((AccessibilityNodeInfo) info2).isContentInvalid();
    }

    public static boolean canOpenPopup(Object info2) {
        return ((AccessibilityNodeInfo) info2).canOpenPopup();
    }

    public static void setCanOpenPopup(Object info2, boolean opensPopup) {
        ((AccessibilityNodeInfo) info2).setCanOpenPopup(opensPopup);
    }

    public static Bundle getExtras(Object info2) {
        return ((AccessibilityNodeInfo) info2).getExtras();
    }

    public static int getInputType(Object info2) {
        return ((AccessibilityNodeInfo) info2).getInputType();
    }

    public static void setInputType(Object info2, int inputType) {
        ((AccessibilityNodeInfo) info2).setInputType(inputType);
    }

    public static boolean isDismissable(Object info2) {
        return ((AccessibilityNodeInfo) info2).isDismissable();
    }

    public static void setDismissable(Object info2, boolean dismissable) {
        ((AccessibilityNodeInfo) info2).setDismissable(dismissable);
    }

    public static boolean isMultiLine(Object info2) {
        return ((AccessibilityNodeInfo) info2).isMultiLine();
    }

    public static void setMultiLine(Object info2, boolean multiLine) {
        ((AccessibilityNodeInfo) info2).setMultiLine(multiLine);
    }

    static class CollectionInfo {
        CollectionInfo() {
        }

        static int getColumnCount(Object info2) {
            return ((AccessibilityNodeInfo.CollectionInfo) info2).getColumnCount();
        }

        static int getRowCount(Object info2) {
            return ((AccessibilityNodeInfo.CollectionInfo) info2).getRowCount();
        }

        static boolean isHierarchical(Object info2) {
            return ((AccessibilityNodeInfo.CollectionInfo) info2).isHierarchical();
        }
    }

    static class CollectionItemInfo {
        CollectionItemInfo() {
        }

        static int getColumnIndex(Object info2) {
            return ((AccessibilityNodeInfo.CollectionItemInfo) info2).getColumnIndex();
        }

        static int getColumnSpan(Object info2) {
            return ((AccessibilityNodeInfo.CollectionItemInfo) info2).getColumnSpan();
        }

        static int getRowIndex(Object info2) {
            return ((AccessibilityNodeInfo.CollectionItemInfo) info2).getRowIndex();
        }

        static int getRowSpan(Object info2) {
            return ((AccessibilityNodeInfo.CollectionItemInfo) info2).getRowSpan();
        }

        static boolean isHeading(Object info2) {
            return ((AccessibilityNodeInfo.CollectionItemInfo) info2).isHeading();
        }
    }

    static class RangeInfo {
        RangeInfo() {
        }

        static float getCurrent(Object info2) {
            return ((AccessibilityNodeInfo.RangeInfo) info2).getCurrent();
        }

        static float getMax(Object info2) {
            return ((AccessibilityNodeInfo.RangeInfo) info2).getMax();
        }

        static float getMin(Object info2) {
            return ((AccessibilityNodeInfo.RangeInfo) info2).getMin();
        }

        static int getType(Object info2) {
            return ((AccessibilityNodeInfo.RangeInfo) info2).getType();
        }
    }
}
