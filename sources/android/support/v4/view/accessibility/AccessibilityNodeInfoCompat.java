package android.support.v4.view.accessibility;

import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompatApi21;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompatKitKat;
import android.view.View;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class AccessibilityNodeInfoCompat {
    public static final int ACTION_ACCESSIBILITY_FOCUS = 64;
    public static final String ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN = "ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN";
    public static final String ACTION_ARGUMENT_HTML_ELEMENT_STRING = "ACTION_ARGUMENT_HTML_ELEMENT_STRING";
    public static final String ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT = "ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT";
    public static final String ACTION_ARGUMENT_SELECTION_END_INT = "ACTION_ARGUMENT_SELECTION_END_INT";
    public static final String ACTION_ARGUMENT_SELECTION_START_INT = "ACTION_ARGUMENT_SELECTION_START_INT";
    public static final String ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE = "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE";
    public static final int ACTION_CLEAR_ACCESSIBILITY_FOCUS = 128;
    public static final int ACTION_CLEAR_FOCUS = 2;
    public static final int ACTION_CLEAR_SELECTION = 8;
    public static final int ACTION_CLICK = 16;
    public static final int ACTION_COLLAPSE = 524288;
    public static final int ACTION_COPY = 16384;
    public static final int ACTION_CUT = 65536;
    public static final int ACTION_DISMISS = 1048576;
    public static final int ACTION_EXPAND = 262144;
    public static final int ACTION_FOCUS = 1;
    public static final int ACTION_LONG_CLICK = 32;
    public static final int ACTION_NEXT_AT_MOVEMENT_GRANULARITY = 256;
    public static final int ACTION_NEXT_HTML_ELEMENT = 1024;
    public static final int ACTION_PASTE = 32768;
    public static final int ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY = 512;
    public static final int ACTION_PREVIOUS_HTML_ELEMENT = 2048;
    public static final int ACTION_SCROLL_BACKWARD = 8192;
    public static final int ACTION_SCROLL_FORWARD = 4096;
    public static final int ACTION_SELECT = 4;
    public static final int ACTION_SET_SELECTION = 131072;
    public static final int ACTION_SET_TEXT = 2097152;
    public static final int FOCUS_ACCESSIBILITY = 2;
    public static final int FOCUS_INPUT = 1;
    private static final AccessibilityNodeInfoImpl IMPL;
    public static final int MOVEMENT_GRANULARITY_CHARACTER = 1;
    public static final int MOVEMENT_GRANULARITY_LINE = 4;
    public static final int MOVEMENT_GRANULARITY_PAGE = 16;
    public static final int MOVEMENT_GRANULARITY_PARAGRAPH = 8;
    public static final int MOVEMENT_GRANULARITY_WORD = 2;
    private final Object mInfo;

    interface AccessibilityNodeInfoImpl {
        void addAction(Object obj, int i);

        void addAction(Object obj, Object obj2);

        void addChild(Object obj, View view);

        void addChild(Object obj, View view, int i);

        boolean canOpenPopup(Object obj);

        List<Object> findAccessibilityNodeInfosByText(Object obj, String str);

        List<Object> findAccessibilityNodeInfosByViewId(Object obj, String str);

        Object findFocus(Object obj, int i);

        Object focusSearch(Object obj, int i);

        int getAccessibilityActionId(Object obj);

        CharSequence getAccessibilityActionLabel(Object obj);

        List<Object> getActionList(Object obj);

        int getActions(Object obj);

        void getBoundsInParent(Object obj, Rect rect);

        void getBoundsInScreen(Object obj, Rect rect);

        Object getChild(Object obj, int i);

        int getChildCount(Object obj);

        CharSequence getClassName(Object obj);

        Object getCollectionInfo(Object obj);

        int getCollectionInfoColumnCount(Object obj);

        int getCollectionInfoRowCount(Object obj);

        int getCollectionItemColumnIndex(Object obj);

        int getCollectionItemColumnSpan(Object obj);

        Object getCollectionItemInfo(Object obj);

        int getCollectionItemRowIndex(Object obj);

        int getCollectionItemRowSpan(Object obj);

        CharSequence getContentDescription(Object obj);

        CharSequence getError(Object obj);

        Bundle getExtras(Object obj);

        int getInputType(Object obj);

        Object getLabelFor(Object obj);

        Object getLabeledBy(Object obj);

        int getLiveRegion(Object obj);

        int getMaxTextLength(Object obj);

        int getMovementGranularities(Object obj);

        CharSequence getPackageName(Object obj);

        Object getParent(Object obj);

        Object getRangeInfo(Object obj);

        CharSequence getText(Object obj);

        int getTextSelectionEnd(Object obj);

        int getTextSelectionStart(Object obj);

        Object getTraversalAfter(Object obj);

        Object getTraversalBefore(Object obj);

        String getViewIdResourceName(Object obj);

        Object getWindow(Object obj);

        int getWindowId(Object obj);

        boolean isAccessibilityFocused(Object obj);

        boolean isCheckable(Object obj);

        boolean isChecked(Object obj);

        boolean isClickable(Object obj);

        boolean isCollectionInfoHierarchical(Object obj);

        boolean isCollectionItemHeading(Object obj);

        boolean isCollectionItemSelected(Object obj);

        boolean isContentInvalid(Object obj);

        boolean isDismissable(Object obj);

        boolean isEditable(Object obj);

        boolean isEnabled(Object obj);

        boolean isFocusable(Object obj);

        boolean isFocused(Object obj);

        boolean isLongClickable(Object obj);

        boolean isMultiLine(Object obj);

        boolean isPassword(Object obj);

        boolean isScrollable(Object obj);

        boolean isSelected(Object obj);

        boolean isVisibleToUser(Object obj);

        Object newAccessibilityAction(int i, CharSequence charSequence);

        Object obtain();

        Object obtain(View view);

        Object obtain(View view, int i);

        Object obtain(Object obj);

        Object obtainCollectionInfo(int i, int i2, boolean z, int i3);

        Object obtainCollectionItemInfo(int i, int i2, int i3, int i4, boolean z, boolean z2);

        boolean performAction(Object obj, int i);

        boolean performAction(Object obj, int i, Bundle bundle);

        void recycle(Object obj);

        boolean refresh(Object obj);

        boolean removeAction(Object obj, Object obj2);

        boolean removeChild(Object obj, View view);

        boolean removeChild(Object obj, View view, int i);

        void setAccessibilityFocused(Object obj, boolean z);

        void setBoundsInParent(Object obj, Rect rect);

        void setBoundsInScreen(Object obj, Rect rect);

        void setCanOpenPopup(Object obj, boolean z);

        void setCheckable(Object obj, boolean z);

        void setChecked(Object obj, boolean z);

        void setClassName(Object obj, CharSequence charSequence);

        void setClickable(Object obj, boolean z);

        void setCollectionInfo(Object obj, Object obj2);

        void setCollectionItemInfo(Object obj, Object obj2);

        void setContentDescription(Object obj, CharSequence charSequence);

        void setContentInvalid(Object obj, boolean z);

        void setDismissable(Object obj, boolean z);

        void setEditable(Object obj, boolean z);

        void setEnabled(Object obj, boolean z);

        void setError(Object obj, CharSequence charSequence);

        void setFocusable(Object obj, boolean z);

        void setFocused(Object obj, boolean z);

        void setInputType(Object obj, int i);

        void setLabelFor(Object obj, View view);

        void setLabelFor(Object obj, View view, int i);

        void setLabeledBy(Object obj, View view);

        void setLabeledBy(Object obj, View view, int i);

        void setLiveRegion(Object obj, int i);

        void setLongClickable(Object obj, boolean z);

        void setMaxTextLength(Object obj, int i);

        void setMovementGranularities(Object obj, int i);

        void setMultiLine(Object obj, boolean z);

        void setPackageName(Object obj, CharSequence charSequence);

        void setParent(Object obj, View view);

        void setParent(Object obj, View view, int i);

        void setPassword(Object obj, boolean z);

        void setRangeInfo(Object obj, Object obj2);

        void setScrollable(Object obj, boolean z);

        void setSelected(Object obj, boolean z);

        void setSource(Object obj, View view);

        void setSource(Object obj, View view, int i);

        void setText(Object obj, CharSequence charSequence);

        void setTextSelection(Object obj, int i, int i2);

        void setTraversalAfter(Object obj, View view);

        void setTraversalAfter(Object obj, View view, int i);

        void setTraversalBefore(Object obj, View view);

        void setTraversalBefore(Object obj, View view, int i);

        void setViewIdResourceName(Object obj, String str);

        void setVisibleToUser(Object obj, boolean z);
    }

    public static class AccessibilityActionCompat {
        private final Object mAction;
        public static final AccessibilityActionCompat ACTION_FOCUS = new AccessibilityActionCompat(1, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_CLEAR_FOCUS = new AccessibilityActionCompat(2, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_SELECT = new AccessibilityActionCompat(4, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_CLEAR_SELECTION = new AccessibilityActionCompat(8, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_CLICK = new AccessibilityActionCompat(16, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_LONG_CLICK = new AccessibilityActionCompat(32, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_ACCESSIBILITY_FOCUS = new AccessibilityActionCompat(64, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_CLEAR_ACCESSIBILITY_FOCUS = new AccessibilityActionCompat(128, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_NEXT_AT_MOVEMENT_GRANULARITY = new AccessibilityActionCompat(256, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY = new AccessibilityActionCompat(512, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_NEXT_HTML_ELEMENT = new AccessibilityActionCompat(1024, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_PREVIOUS_HTML_ELEMENT = new AccessibilityActionCompat(2048, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_SCROLL_FORWARD = new AccessibilityActionCompat(4096, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_SCROLL_BACKWARD = new AccessibilityActionCompat(8192, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_COPY = new AccessibilityActionCompat(16384, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_PASTE = new AccessibilityActionCompat(32768, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_CUT = new AccessibilityActionCompat(65536, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_SET_SELECTION = new AccessibilityActionCompat(131072, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_EXPAND = new AccessibilityActionCompat(262144, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_COLLAPSE = new AccessibilityActionCompat(524288, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_DISMISS = new AccessibilityActionCompat(1048576, (CharSequence) null);
        public static final AccessibilityActionCompat ACTION_SET_TEXT = new AccessibilityActionCompat(2097152, (CharSequence) null);

        public AccessibilityActionCompat(int actionId, CharSequence label) {
            this(AccessibilityNodeInfoCompat.IMPL.newAccessibilityAction(actionId, label));
        }

        private AccessibilityActionCompat(Object action) {
            this.mAction = action;
        }

        public int getId() {
            return AccessibilityNodeInfoCompat.IMPL.getAccessibilityActionId(this.mAction);
        }

        public CharSequence getLabel() {
            return AccessibilityNodeInfoCompat.IMPL.getAccessibilityActionLabel(this.mAction);
        }
    }

    public static class CollectionInfoCompat {
        public static final int SELECTION_MODE_MULTIPLE = 2;
        public static final int SELECTION_MODE_NONE = 0;
        public static final int SELECTION_MODE_SINGLE = 1;
        final Object mInfo;

        public static CollectionInfoCompat obtain(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
            return new CollectionInfoCompat(AccessibilityNodeInfoCompat.IMPL.obtainCollectionInfo(rowCount, columnCount, hierarchical, selectionMode));
        }

        private CollectionInfoCompat(Object info2) {
            this.mInfo = info2;
        }

        public int getColumnCount() {
            return AccessibilityNodeInfoCompat.IMPL.getCollectionInfoColumnCount(this.mInfo);
        }

        public int getRowCount() {
            return AccessibilityNodeInfoCompat.IMPL.getCollectionInfoRowCount(this.mInfo);
        }

        public boolean isHierarchical() {
            return AccessibilityNodeInfoCompat.IMPL.isCollectionInfoHierarchical(this.mInfo);
        }
    }

    public static class CollectionItemInfoCompat {
        private final Object mInfo;

        public static CollectionItemInfoCompat obtain(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading, boolean selected) {
            return new CollectionItemInfoCompat(AccessibilityNodeInfoCompat.IMPL.obtainCollectionItemInfo(rowIndex, rowSpan, columnIndex, columnSpan, heading, selected));
        }

        private CollectionItemInfoCompat(Object info2) {
            this.mInfo = info2;
        }

        public int getColumnIndex() {
            return AccessibilityNodeInfoCompat.IMPL.getCollectionItemColumnIndex(this.mInfo);
        }

        public int getColumnSpan() {
            return AccessibilityNodeInfoCompat.IMPL.getCollectionItemColumnSpan(this.mInfo);
        }

        public int getRowIndex() {
            return AccessibilityNodeInfoCompat.IMPL.getCollectionItemRowIndex(this.mInfo);
        }

        public int getRowSpan() {
            return AccessibilityNodeInfoCompat.IMPL.getCollectionItemRowSpan(this.mInfo);
        }

        public boolean isHeading() {
            return AccessibilityNodeInfoCompat.IMPL.isCollectionItemHeading(this.mInfo);
        }

        public boolean isSelected() {
            return AccessibilityNodeInfoCompat.IMPL.isCollectionItemSelected(this.mInfo);
        }
    }

    public static class RangeInfoCompat {
        public static final int RANGE_TYPE_FLOAT = 1;
        public static final int RANGE_TYPE_INT = 0;
        public static final int RANGE_TYPE_PERCENT = 2;
        private final Object mInfo;

        private RangeInfoCompat(Object info2) {
            this.mInfo = info2;
        }

        public float getCurrent() {
            return AccessibilityNodeInfoCompatKitKat.RangeInfo.getCurrent(this.mInfo);
        }

        public float getMax() {
            return AccessibilityNodeInfoCompatKitKat.RangeInfo.getMax(this.mInfo);
        }

        public float getMin() {
            return AccessibilityNodeInfoCompatKitKat.RangeInfo.getMin(this.mInfo);
        }

        public int getType() {
            return AccessibilityNodeInfoCompatKitKat.RangeInfo.getType(this.mInfo);
        }
    }

    static class AccessibilityNodeInfoStubImpl implements AccessibilityNodeInfoImpl {
        AccessibilityNodeInfoStubImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object newAccessibilityAction(int actionId, CharSequence label) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain() {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain(View source) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain(View root, int virtualDescendantId) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addAction(Object info2, int action) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addAction(Object info2, Object action) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean removeAction(Object info2, Object action) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getAccessibilityActionId(Object action) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getAccessibilityActionLabel(Object action) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addChild(Object info2, View child) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addChild(Object info2, View child, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean removeChild(Object info2, View child) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean removeChild(Object info2, View root, int virtualDescendantId) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public List<Object> findAccessibilityNodeInfosByText(Object info2, String text) {
            return Collections.emptyList();
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getActions(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void getBoundsInParent(Object info2, Rect outBounds) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void getBoundsInScreen(Object info2, Rect outBounds) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getChild(Object info2, int index) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getChildCount(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getClassName(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getContentDescription(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getPackageName(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getParent(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getText(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getWindowId(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCheckable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isChecked(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isClickable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isEnabled(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isFocusable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isFocused(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isVisibleToUser(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isAccessibilityFocused(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isLongClickable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isPassword(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isScrollable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isSelected(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean performAction(Object info2, int action) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean performAction(Object info2, int action, Bundle arguments) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setMovementGranularities(Object info2, int granularities) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getMovementGranularities(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setBoundsInParent(Object info2, Rect bounds) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setBoundsInScreen(Object info2, Rect bounds) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCheckable(Object info2, boolean checkable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setChecked(Object info2, boolean checked) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setClassName(Object info2, CharSequence className) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setClickable(Object info2, boolean clickable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setContentDescription(Object info2, CharSequence contentDescription) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setEnabled(Object info2, boolean enabled) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setFocusable(Object info2, boolean focusable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setFocused(Object info2, boolean focused) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setVisibleToUser(Object info2, boolean visibleToUser) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setAccessibilityFocused(Object info2, boolean focused) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLongClickable(Object info2, boolean longClickable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setPackageName(Object info2, CharSequence packageName) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setParent(Object info2, View parent) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setPassword(Object info2, boolean password) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setScrollable(Object info2, boolean scrollable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setSelected(Object info2, boolean selected) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setSource(Object info2, View source) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setSource(Object info2, View root, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object findFocus(Object info2, int focus) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object focusSearch(Object info2, int direction) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setText(Object info2, CharSequence text) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void recycle(Object info2) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setParent(Object info2, View root, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public String getViewIdResourceName(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setViewIdResourceName(Object info2, String viewId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getLiveRegion(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLiveRegion(Object info2, int mode) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getCollectionInfo(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCollectionInfo(Object info2, Object collectionInfo) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getCollectionItemInfo(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCollectionItemInfo(Object info2, Object collectionItemInfo) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getRangeInfo(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setRangeInfo(Object info2, Object rangeInfo) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public List<Object> getActionList(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtainCollectionInfo(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionInfoColumnCount(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionInfoRowCount(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCollectionInfoHierarchical(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtainCollectionItemInfo(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading, boolean selected) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemColumnIndex(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemColumnSpan(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemRowIndex(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemRowSpan(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCollectionItemHeading(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCollectionItemSelected(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getTraversalBefore(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalBefore(Object info2, View view) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalBefore(Object info2, View root, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getTraversalAfter(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalAfter(Object info2, View view) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalAfter(Object info2, View root, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setContentInvalid(Object info2, boolean contentInvalid) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isContentInvalid(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setError(Object info2, CharSequence error) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getError(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabelFor(Object info2, View labeled) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabelFor(Object info2, View root, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getLabelFor(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabeledBy(Object info2, View labeled) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabeledBy(Object info2, View root, int virtualDescendantId) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getLabeledBy(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean canOpenPopup(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCanOpenPopup(Object info2, boolean opensPopup) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public List<Object> findAccessibilityNodeInfosByViewId(Object info2, String viewId) {
            return Collections.emptyList();
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Bundle getExtras(Object info2) {
            return new Bundle();
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getInputType(Object info2) {
            return 0;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setInputType(Object info2, int inputType) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setMaxTextLength(Object info2, int max) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getMaxTextLength(Object info2) {
            return -1;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTextSelection(Object info2, int start, int end) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getTextSelectionStart(Object info2) {
            return -1;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getTextSelectionEnd(Object info2) {
            return -1;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getWindow(Object info2) {
            return null;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isDismissable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setDismissable(Object info2, boolean dismissable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isEditable(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setEditable(Object info2, boolean editable) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isMultiLine(Object info2) {
            return false;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setMultiLine(Object info2, boolean multiLine) {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean refresh(Object info2) {
            return false;
        }
    }

    static class AccessibilityNodeInfoIcsImpl extends AccessibilityNodeInfoStubImpl {
        AccessibilityNodeInfoIcsImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain() {
            return AccessibilityNodeInfoCompatIcs.obtain();
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain(View source) {
            return AccessibilityNodeInfoCompatIcs.obtain(source);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain(Object info2) {
            return AccessibilityNodeInfoCompatIcs.obtain(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addAction(Object info2, int action) {
            AccessibilityNodeInfoCompatIcs.addAction(info2, action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addChild(Object info2, View child) {
            AccessibilityNodeInfoCompatIcs.addChild(info2, child);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public List<Object> findAccessibilityNodeInfosByText(Object info2, String text) {
            return AccessibilityNodeInfoCompatIcs.findAccessibilityNodeInfosByText(info2, text);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getActions(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getActions(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void getBoundsInParent(Object info2, Rect outBounds) {
            AccessibilityNodeInfoCompatIcs.getBoundsInParent(info2, outBounds);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void getBoundsInScreen(Object info2, Rect outBounds) {
            AccessibilityNodeInfoCompatIcs.getBoundsInScreen(info2, outBounds);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getChild(Object info2, int index) {
            return AccessibilityNodeInfoCompatIcs.getChild(info2, index);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getChildCount(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getChildCount(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getClassName(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getClassName(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getContentDescription(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getContentDescription(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getPackageName(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getPackageName(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getParent(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getParent(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getText(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getText(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getWindowId(Object info2) {
            return AccessibilityNodeInfoCompatIcs.getWindowId(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCheckable(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isCheckable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isChecked(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isChecked(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isClickable(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isClickable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isEnabled(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isEnabled(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isFocusable(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isFocusable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isFocused(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isFocused(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isLongClickable(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isLongClickable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isPassword(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isPassword(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isScrollable(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isScrollable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isSelected(Object info2) {
            return AccessibilityNodeInfoCompatIcs.isSelected(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean performAction(Object info2, int action) {
            return AccessibilityNodeInfoCompatIcs.performAction(info2, action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setBoundsInParent(Object info2, Rect bounds) {
            AccessibilityNodeInfoCompatIcs.setBoundsInParent(info2, bounds);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setBoundsInScreen(Object info2, Rect bounds) {
            AccessibilityNodeInfoCompatIcs.setBoundsInScreen(info2, bounds);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCheckable(Object info2, boolean checkable) {
            AccessibilityNodeInfoCompatIcs.setCheckable(info2, checkable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setChecked(Object info2, boolean checked) {
            AccessibilityNodeInfoCompatIcs.setChecked(info2, checked);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setClassName(Object info2, CharSequence className) {
            AccessibilityNodeInfoCompatIcs.setClassName(info2, className);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setClickable(Object info2, boolean clickable) {
            AccessibilityNodeInfoCompatIcs.setClickable(info2, clickable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setContentDescription(Object info2, CharSequence contentDescription) {
            AccessibilityNodeInfoCompatIcs.setContentDescription(info2, contentDescription);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setEnabled(Object info2, boolean enabled) {
            AccessibilityNodeInfoCompatIcs.setEnabled(info2, enabled);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setFocusable(Object info2, boolean focusable) {
            AccessibilityNodeInfoCompatIcs.setFocusable(info2, focusable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setFocused(Object info2, boolean focused) {
            AccessibilityNodeInfoCompatIcs.setFocused(info2, focused);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLongClickable(Object info2, boolean longClickable) {
            AccessibilityNodeInfoCompatIcs.setLongClickable(info2, longClickable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setPackageName(Object info2, CharSequence packageName) {
            AccessibilityNodeInfoCompatIcs.setPackageName(info2, packageName);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setParent(Object info2, View parent) {
            AccessibilityNodeInfoCompatIcs.setParent(info2, parent);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setPassword(Object info2, boolean password) {
            AccessibilityNodeInfoCompatIcs.setPassword(info2, password);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setScrollable(Object info2, boolean scrollable) {
            AccessibilityNodeInfoCompatIcs.setScrollable(info2, scrollable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setSelected(Object info2, boolean selected) {
            AccessibilityNodeInfoCompatIcs.setSelected(info2, selected);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setSource(Object info2, View source) {
            AccessibilityNodeInfoCompatIcs.setSource(info2, source);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setText(Object info2, CharSequence text) {
            AccessibilityNodeInfoCompatIcs.setText(info2, text);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void recycle(Object info2) {
            AccessibilityNodeInfoCompatIcs.recycle(info2);
        }
    }

    static class AccessibilityNodeInfoJellybeanImpl extends AccessibilityNodeInfoIcsImpl {
        AccessibilityNodeInfoJellybeanImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtain(View root, int virtualDescendantId) {
            return AccessibilityNodeInfoCompatJellyBean.obtain(root, virtualDescendantId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object findFocus(Object info2, int focus) {
            return AccessibilityNodeInfoCompatJellyBean.findFocus(info2, focus);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object focusSearch(Object info2, int direction) {
            return AccessibilityNodeInfoCompatJellyBean.focusSearch(info2, direction);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addChild(Object info2, View child, int virtualDescendantId) {
            AccessibilityNodeInfoCompatJellyBean.addChild(info2, child, virtualDescendantId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setSource(Object info2, View root, int virtualDescendantId) {
            AccessibilityNodeInfoCompatJellyBean.setSource(info2, root, virtualDescendantId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isVisibleToUser(Object info2) {
            return AccessibilityNodeInfoCompatJellyBean.isVisibleToUser(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setVisibleToUser(Object info2, boolean visibleToUser) {
            AccessibilityNodeInfoCompatJellyBean.setVisibleToUser(info2, visibleToUser);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isAccessibilityFocused(Object info2) {
            return AccessibilityNodeInfoCompatJellyBean.isAccessibilityFocused(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setAccessibilityFocused(Object info2, boolean focused) {
            AccessibilityNodeInfoCompatJellyBean.setAccesibilityFocused(info2, focused);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean performAction(Object info2, int action, Bundle arguments) {
            return AccessibilityNodeInfoCompatJellyBean.performAction(info2, action, arguments);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setMovementGranularities(Object info2, int granularities) {
            AccessibilityNodeInfoCompatJellyBean.setMovementGranularities(info2, granularities);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getMovementGranularities(Object info2) {
            return AccessibilityNodeInfoCompatJellyBean.getMovementGranularities(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setParent(Object info2, View root, int virtualDescendantId) {
            AccessibilityNodeInfoCompatJellyBean.setParent(info2, root, virtualDescendantId);
        }
    }

    static class AccessibilityNodeInfoJellybeanMr1Impl extends AccessibilityNodeInfoJellybeanImpl {
        AccessibilityNodeInfoJellybeanMr1Impl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabelFor(Object info2, View labeled) {
            AccessibilityNodeInfoCompatJellybeanMr1.setLabelFor(info2, labeled);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabelFor(Object info2, View root, int virtualDescendantId) {
            AccessibilityNodeInfoCompatJellybeanMr1.setLabelFor(info2, root, virtualDescendantId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getLabelFor(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr1.getLabelFor(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabeledBy(Object info2, View labeled) {
            AccessibilityNodeInfoCompatJellybeanMr1.setLabeledBy(info2, labeled);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLabeledBy(Object info2, View root, int virtualDescendantId) {
            AccessibilityNodeInfoCompatJellybeanMr1.setLabeledBy(info2, root, virtualDescendantId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getLabeledBy(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr1.getLabeledBy(info2);
        }
    }

    static class AccessibilityNodeInfoJellybeanMr2Impl extends AccessibilityNodeInfoJellybeanMr1Impl {
        AccessibilityNodeInfoJellybeanMr2Impl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public String getViewIdResourceName(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr2.getViewIdResourceName(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setViewIdResourceName(Object info2, String viewId) {
            AccessibilityNodeInfoCompatJellybeanMr2.setViewIdResourceName(info2, viewId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public List<Object> findAccessibilityNodeInfosByViewId(Object info2, String viewId) {
            return AccessibilityNodeInfoCompatJellybeanMr2.findAccessibilityNodeInfosByViewId(info2, viewId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTextSelection(Object info2, int start, int end) {
            AccessibilityNodeInfoCompatJellybeanMr2.setTextSelection(info2, start, end);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getTextSelectionStart(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr2.getTextSelectionStart(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getTextSelectionEnd(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr2.getTextSelectionEnd(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isEditable(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr2.isEditable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setEditable(Object info2, boolean editable) {
            AccessibilityNodeInfoCompatJellybeanMr2.setEditable(info2, editable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean refresh(Object info2) {
            return AccessibilityNodeInfoCompatJellybeanMr2.refresh(info2);
        }
    }

    static class AccessibilityNodeInfoKitKatImpl extends AccessibilityNodeInfoJellybeanMr2Impl {
        AccessibilityNodeInfoKitKatImpl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getLiveRegion(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.getLiveRegion(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setLiveRegion(Object info2, int mode) {
            AccessibilityNodeInfoCompatKitKat.setLiveRegion(info2, mode);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getCollectionInfo(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.getCollectionInfo(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCollectionInfo(Object info2, Object collectionInfo) {
            AccessibilityNodeInfoCompatKitKat.setCollectionInfo(info2, collectionInfo);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtainCollectionInfo(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
            return AccessibilityNodeInfoCompatKitKat.obtainCollectionInfo(rowCount, columnCount, hierarchical, selectionMode);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtainCollectionItemInfo(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading, boolean selected) {
            return AccessibilityNodeInfoCompatKitKat.obtainCollectionItemInfo(rowIndex, rowSpan, columnIndex, columnSpan, heading);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionInfoColumnCount(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionInfo.getColumnCount(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionInfoRowCount(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionInfo.getRowCount(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCollectionInfoHierarchical(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionInfo.isHierarchical(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getCollectionItemInfo(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.getCollectionItemInfo(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getRangeInfo(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.getRangeInfo(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setRangeInfo(Object info2, Object rangeInfo) {
            AccessibilityNodeInfoCompatKitKat.setRangeInfo(info2, rangeInfo);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemColumnIndex(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionItemInfo.getColumnIndex(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemColumnSpan(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionItemInfo.getColumnSpan(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemRowIndex(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionItemInfo.getRowIndex(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getCollectionItemRowSpan(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionItemInfo.getRowSpan(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCollectionItemHeading(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.CollectionItemInfo.isHeading(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCollectionItemInfo(Object info2, Object collectionItemInfo) {
            AccessibilityNodeInfoCompatKitKat.setCollectionItemInfo(info2, collectionItemInfo);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setContentInvalid(Object info2, boolean contentInvalid) {
            AccessibilityNodeInfoCompatKitKat.setContentInvalid(info2, contentInvalid);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isContentInvalid(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.isContentInvalid(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean canOpenPopup(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.canOpenPopup(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setCanOpenPopup(Object info2, boolean opensPopup) {
            AccessibilityNodeInfoCompatKitKat.setCanOpenPopup(info2, opensPopup);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Bundle getExtras(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.getExtras(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getInputType(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.getInputType(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setInputType(Object info2, int inputType) {
            AccessibilityNodeInfoCompatKitKat.setInputType(info2, inputType);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isDismissable(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.isDismissable(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setDismissable(Object info2, boolean dismissable) {
            AccessibilityNodeInfoCompatKitKat.setDismissable(info2, dismissable);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isMultiLine(Object info2) {
            return AccessibilityNodeInfoCompatKitKat.isMultiLine(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setMultiLine(Object info2, boolean multiLine) {
            AccessibilityNodeInfoCompatKitKat.setMultiLine(info2, multiLine);
        }
    }

    static class AccessibilityNodeInfoApi21Impl extends AccessibilityNodeInfoKitKatImpl {
        AccessibilityNodeInfoApi21Impl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object newAccessibilityAction(int actionId, CharSequence label) {
            return AccessibilityNodeInfoCompatApi21.newAccessibilityAction(actionId, label);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public List<Object> getActionList(Object info2) {
            return AccessibilityNodeInfoCompatApi21.getActionList(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoKitKatImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtainCollectionInfo(int rowCount, int columnCount, boolean hierarchical, int selectionMode) {
            return AccessibilityNodeInfoCompatApi21.obtainCollectionInfo(rowCount, columnCount, hierarchical, selectionMode);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void addAction(Object info2, Object action) {
            AccessibilityNodeInfoCompatApi21.addAction(info2, action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean removeAction(Object info2, Object action) {
            return AccessibilityNodeInfoCompatApi21.removeAction(info2, action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getAccessibilityActionId(Object action) {
            return AccessibilityNodeInfoCompatApi21.getAccessibilityActionId(action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getAccessibilityActionLabel(Object action) {
            return AccessibilityNodeInfoCompatApi21.getAccessibilityActionLabel(action);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoKitKatImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object obtainCollectionItemInfo(int rowIndex, int rowSpan, int columnIndex, int columnSpan, boolean heading, boolean selected) {
            return AccessibilityNodeInfoCompatApi21.obtainCollectionItemInfo(rowIndex, rowSpan, columnIndex, columnSpan, heading, selected);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean isCollectionItemSelected(Object info2) {
            return AccessibilityNodeInfoCompatApi21.CollectionItemInfo.isSelected(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public CharSequence getError(Object info2) {
            return AccessibilityNodeInfoCompatApi21.getError(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setError(Object info2, CharSequence error) {
            AccessibilityNodeInfoCompatApi21.setError(info2, error);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setMaxTextLength(Object info2, int max) {
            AccessibilityNodeInfoCompatApi21.setMaxTextLength(info2, max);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public int getMaxTextLength(Object info2) {
            return AccessibilityNodeInfoCompatApi21.getMaxTextLength(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getWindow(Object info2) {
            return AccessibilityNodeInfoCompatApi21.getWindow(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean removeChild(Object info2, View child) {
            return AccessibilityNodeInfoCompatApi21.removeChild(info2, child);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public boolean removeChild(Object info2, View root, int virtualDescendantId) {
            return AccessibilityNodeInfoCompatApi21.removeChild(info2, root, virtualDescendantId);
        }
    }

    static class AccessibilityNodeInfoApi22Impl extends AccessibilityNodeInfoApi21Impl {
        AccessibilityNodeInfoApi22Impl() {
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getTraversalBefore(Object info2) {
            return AccessibilityNodeInfoCompatApi22.getTraversalBefore(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalBefore(Object info2, View view) {
            AccessibilityNodeInfoCompatApi22.setTraversalBefore(info2, view);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalBefore(Object info2, View root, int virtualDescendantId) {
            AccessibilityNodeInfoCompatApi22.setTraversalBefore(info2, root, virtualDescendantId);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public Object getTraversalAfter(Object info2) {
            return AccessibilityNodeInfoCompatApi22.getTraversalAfter(info2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalAfter(Object info2, View view) {
            AccessibilityNodeInfoCompatApi22.setTraversalAfter(info2, view);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoStubImpl, android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.AccessibilityNodeInfoImpl
        public void setTraversalAfter(Object info2, View root, int virtualDescendantId) {
            AccessibilityNodeInfoCompatApi22.setTraversalAfter(info2, root, virtualDescendantId);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 22) {
            IMPL = new AccessibilityNodeInfoApi22Impl();
            return;
        }
        if (Build.VERSION.SDK_INT >= 21) {
            IMPL = new AccessibilityNodeInfoApi21Impl();
            return;
        }
        if (Build.VERSION.SDK_INT >= 19) {
            IMPL = new AccessibilityNodeInfoKitKatImpl();
            return;
        }
        if (Build.VERSION.SDK_INT >= 18) {
            IMPL = new AccessibilityNodeInfoJellybeanMr2Impl();
            return;
        }
        if (Build.VERSION.SDK_INT >= 17) {
            IMPL = new AccessibilityNodeInfoJellybeanMr1Impl();
            return;
        }
        if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new AccessibilityNodeInfoJellybeanImpl();
        } else if (Build.VERSION.SDK_INT >= 14) {
            IMPL = new AccessibilityNodeInfoIcsImpl();
        } else {
            IMPL = new AccessibilityNodeInfoStubImpl();
        }
    }

    static AccessibilityNodeInfoCompat wrapNonNullInstance(Object object) {
        if (object != null) {
            return new AccessibilityNodeInfoCompat(object);
        }
        return null;
    }

    public AccessibilityNodeInfoCompat(Object info2) {
        this.mInfo = info2;
    }

    public Object getInfo() {
        return this.mInfo;
    }

    public static AccessibilityNodeInfoCompat obtain(View source) {
        return wrapNonNullInstance(IMPL.obtain(source));
    }

    public static AccessibilityNodeInfoCompat obtain(View root, int virtualDescendantId) {
        return wrapNonNullInstance(IMPL.obtain(root, virtualDescendantId));
    }

    public static AccessibilityNodeInfoCompat obtain() {
        return wrapNonNullInstance(IMPL.obtain());
    }

    public static AccessibilityNodeInfoCompat obtain(AccessibilityNodeInfoCompat info2) {
        return wrapNonNullInstance(IMPL.obtain(info2.mInfo));
    }

    public void setSource(View source) {
        IMPL.setSource(this.mInfo, source);
    }

    public void setSource(View root, int virtualDescendantId) {
        IMPL.setSource(this.mInfo, root, virtualDescendantId);
    }

    public AccessibilityNodeInfoCompat findFocus(int focus) {
        return wrapNonNullInstance(IMPL.findFocus(this.mInfo, focus));
    }

    public AccessibilityNodeInfoCompat focusSearch(int direction) {
        return wrapNonNullInstance(IMPL.focusSearch(this.mInfo, direction));
    }

    public int getWindowId() {
        return IMPL.getWindowId(this.mInfo);
    }

    public int getChildCount() {
        return IMPL.getChildCount(this.mInfo);
    }

    public AccessibilityNodeInfoCompat getChild(int index) {
        return wrapNonNullInstance(IMPL.getChild(this.mInfo, index));
    }

    public void addChild(View child) {
        IMPL.addChild(this.mInfo, child);
    }

    public void addChild(View root, int virtualDescendantId) {
        IMPL.addChild(this.mInfo, root, virtualDescendantId);
    }

    public boolean removeChild(View child) {
        return IMPL.removeChild(this.mInfo, child);
    }

    public boolean removeChild(View root, int virtualDescendantId) {
        return IMPL.removeChild(this.mInfo, root, virtualDescendantId);
    }

    public int getActions() {
        return IMPL.getActions(this.mInfo);
    }

    public void addAction(int action) {
        IMPL.addAction(this.mInfo, action);
    }

    public void addAction(AccessibilityActionCompat action) {
        IMPL.addAction(this.mInfo, action.mAction);
    }

    public boolean removeAction(AccessibilityActionCompat action) {
        return IMPL.removeAction(this.mInfo, action.mAction);
    }

    public boolean performAction(int action) {
        return IMPL.performAction(this.mInfo, action);
    }

    public boolean performAction(int action, Bundle arguments) {
        return IMPL.performAction(this.mInfo, action, arguments);
    }

    public void setMovementGranularities(int granularities) {
        IMPL.setMovementGranularities(this.mInfo, granularities);
    }

    public int getMovementGranularities() {
        return IMPL.getMovementGranularities(this.mInfo);
    }

    public List<AccessibilityNodeInfoCompat> findAccessibilityNodeInfosByText(String text) {
        List<AccessibilityNodeInfoCompat> result = new ArrayList<>();
        List<Object> infos = IMPL.findAccessibilityNodeInfosByText(this.mInfo, text);
        int infoCount = infos.size();
        for (int i = 0; i < infoCount; i++) {
            Object info2 = infos.get(i);
            result.add(new AccessibilityNodeInfoCompat(info2));
        }
        return result;
    }

    public AccessibilityNodeInfoCompat getParent() {
        return wrapNonNullInstance(IMPL.getParent(this.mInfo));
    }

    public void setParent(View parent) {
        IMPL.setParent(this.mInfo, parent);
    }

    public void setParent(View root, int virtualDescendantId) {
        IMPL.setParent(this.mInfo, root, virtualDescendantId);
    }

    public void getBoundsInParent(Rect outBounds) {
        IMPL.getBoundsInParent(this.mInfo, outBounds);
    }

    public void setBoundsInParent(Rect bounds) {
        IMPL.setBoundsInParent(this.mInfo, bounds);
    }

    public void getBoundsInScreen(Rect outBounds) {
        IMPL.getBoundsInScreen(this.mInfo, outBounds);
    }

    public void setBoundsInScreen(Rect bounds) {
        IMPL.setBoundsInScreen(this.mInfo, bounds);
    }

    public boolean isCheckable() {
        return IMPL.isCheckable(this.mInfo);
    }

    public void setCheckable(boolean checkable) {
        IMPL.setCheckable(this.mInfo, checkable);
    }

    public boolean isChecked() {
        return IMPL.isChecked(this.mInfo);
    }

    public void setChecked(boolean checked) {
        IMPL.setChecked(this.mInfo, checked);
    }

    public boolean isFocusable() {
        return IMPL.isFocusable(this.mInfo);
    }

    public void setFocusable(boolean focusable) {
        IMPL.setFocusable(this.mInfo, focusable);
    }

    public boolean isFocused() {
        return IMPL.isFocused(this.mInfo);
    }

    public void setFocused(boolean focused) {
        IMPL.setFocused(this.mInfo, focused);
    }

    public boolean isVisibleToUser() {
        return IMPL.isVisibleToUser(this.mInfo);
    }

    public void setVisibleToUser(boolean visibleToUser) {
        IMPL.setVisibleToUser(this.mInfo, visibleToUser);
    }

    public boolean isAccessibilityFocused() {
        return IMPL.isAccessibilityFocused(this.mInfo);
    }

    public void setAccessibilityFocused(boolean focused) {
        IMPL.setAccessibilityFocused(this.mInfo, focused);
    }

    public boolean isSelected() {
        return IMPL.isSelected(this.mInfo);
    }

    public void setSelected(boolean selected) {
        IMPL.setSelected(this.mInfo, selected);
    }

    public boolean isClickable() {
        return IMPL.isClickable(this.mInfo);
    }

    public void setClickable(boolean clickable) {
        IMPL.setClickable(this.mInfo, clickable);
    }

    public boolean isLongClickable() {
        return IMPL.isLongClickable(this.mInfo);
    }

    public void setLongClickable(boolean longClickable) {
        IMPL.setLongClickable(this.mInfo, longClickable);
    }

    public boolean isEnabled() {
        return IMPL.isEnabled(this.mInfo);
    }

    public void setEnabled(boolean enabled) {
        IMPL.setEnabled(this.mInfo, enabled);
    }

    public boolean isPassword() {
        return IMPL.isPassword(this.mInfo);
    }

    public void setPassword(boolean password) {
        IMPL.setPassword(this.mInfo, password);
    }

    public boolean isScrollable() {
        return IMPL.isScrollable(this.mInfo);
    }

    public void setScrollable(boolean scrollable) {
        IMPL.setScrollable(this.mInfo, scrollable);
    }

    public CharSequence getPackageName() {
        return IMPL.getPackageName(this.mInfo);
    }

    public void setPackageName(CharSequence packageName) {
        IMPL.setPackageName(this.mInfo, packageName);
    }

    public CharSequence getClassName() {
        return IMPL.getClassName(this.mInfo);
    }

    public void setClassName(CharSequence className) {
        IMPL.setClassName(this.mInfo, className);
    }

    public CharSequence getText() {
        return IMPL.getText(this.mInfo);
    }

    public void setText(CharSequence text) {
        IMPL.setText(this.mInfo, text);
    }

    public CharSequence getContentDescription() {
        return IMPL.getContentDescription(this.mInfo);
    }

    public void setContentDescription(CharSequence contentDescription) {
        IMPL.setContentDescription(this.mInfo, contentDescription);
    }

    public void recycle() {
        IMPL.recycle(this.mInfo);
    }

    public void setViewIdResourceName(String viewId) {
        IMPL.setViewIdResourceName(this.mInfo, viewId);
    }

    public String getViewIdResourceName() {
        return IMPL.getViewIdResourceName(this.mInfo);
    }

    public int getLiveRegion() {
        return IMPL.getLiveRegion(this.mInfo);
    }

    public void setLiveRegion(int mode) {
        IMPL.setLiveRegion(this.mInfo, mode);
    }

    public CollectionInfoCompat getCollectionInfo() {
        Object info2 = IMPL.getCollectionInfo(this.mInfo);
        if (info2 == null) {
            return null;
        }
        return new CollectionInfoCompat(info2);
    }

    public void setCollectionInfo(Object collectionInfo) {
        IMPL.setCollectionInfo(this.mInfo, ((CollectionInfoCompat) collectionInfo).mInfo);
    }

    public void setCollectionItemInfo(Object collectionItemInfo) {
        IMPL.setCollectionItemInfo(this.mInfo, ((CollectionItemInfoCompat) collectionItemInfo).mInfo);
    }

    public CollectionItemInfoCompat getCollectionItemInfo() {
        Object info2 = IMPL.getCollectionItemInfo(this.mInfo);
        if (info2 == null) {
            return null;
        }
        return new CollectionItemInfoCompat(info2);
    }

    public RangeInfoCompat getRangeInfo() {
        Object info2 = IMPL.getRangeInfo(this.mInfo);
        if (info2 == null) {
            return null;
        }
        return new RangeInfoCompat(info2);
    }

    public void setRangeInfo(RangeInfoCompat rangeInfo) {
        IMPL.setRangeInfo(this.mInfo, rangeInfo.mInfo);
    }

    public List<AccessibilityActionCompat> getActionList() {
        List<Object> actions = IMPL.getActionList(this.mInfo);
        if (actions != null) {
            List<AccessibilityActionCompat> result = new ArrayList<>();
            int actionCount = actions.size();
            for (int i = 0; i < actionCount; i++) {
                Object action = actions.get(i);
                result.add(new AccessibilityActionCompat(action));
            }
            return result;
        }
        return Collections.emptyList();
    }

    public void setContentInvalid(boolean contentInvalid) {
        IMPL.setContentInvalid(this.mInfo, contentInvalid);
    }

    public boolean isContentInvalid() {
        return IMPL.isContentInvalid(this.mInfo);
    }

    public void setError(CharSequence error) {
        IMPL.setError(this.mInfo, error);
    }

    public CharSequence getError() {
        return IMPL.getError(this.mInfo);
    }

    public void setLabelFor(View labeled) {
        IMPL.setLabelFor(this.mInfo, labeled);
    }

    public void setLabelFor(View root, int virtualDescendantId) {
        IMPL.setLabelFor(this.mInfo, root, virtualDescendantId);
    }

    public AccessibilityNodeInfoCompat getLabelFor() {
        return wrapNonNullInstance(IMPL.getLabelFor(this.mInfo));
    }

    public void setLabeledBy(View label) {
        IMPL.setLabeledBy(this.mInfo, label);
    }

    public void setLabeledBy(View root, int virtualDescendantId) {
        IMPL.setLabeledBy(this.mInfo, root, virtualDescendantId);
    }

    public AccessibilityNodeInfoCompat getLabeledBy() {
        return wrapNonNullInstance(IMPL.getLabeledBy(this.mInfo));
    }

    public boolean canOpenPopup() {
        return IMPL.canOpenPopup(this.mInfo);
    }

    public void setCanOpenPopup(boolean opensPopup) {
        IMPL.setCanOpenPopup(this.mInfo, opensPopup);
    }

    public List<AccessibilityNodeInfoCompat> findAccessibilityNodeInfosByViewId(String viewId) {
        List<Object> nodes = IMPL.findAccessibilityNodeInfosByViewId(this.mInfo, viewId);
        if (nodes != null) {
            List<AccessibilityNodeInfoCompat> result = new ArrayList<>();
            for (Object node : nodes) {
                result.add(new AccessibilityNodeInfoCompat(node));
            }
            return result;
        }
        return Collections.emptyList();
    }

    public Bundle getExtras() {
        return IMPL.getExtras(this.mInfo);
    }

    public int getInputType() {
        return IMPL.getInputType(this.mInfo);
    }

    public void setInputType(int inputType) {
        IMPL.setInputType(this.mInfo, inputType);
    }

    public void setMaxTextLength(int max) {
        IMPL.setMaxTextLength(this.mInfo, max);
    }

    public int getMaxTextLength() {
        return IMPL.getMaxTextLength(this.mInfo);
    }

    public void setTextSelection(int start, int end) {
        IMPL.setTextSelection(this.mInfo, start, end);
    }

    public int getTextSelectionStart() {
        return IMPL.getTextSelectionStart(this.mInfo);
    }

    public int getTextSelectionEnd() {
        return IMPL.getTextSelectionEnd(this.mInfo);
    }

    public AccessibilityNodeInfoCompat getTraversalBefore() {
        return wrapNonNullInstance(IMPL.getTraversalBefore(this.mInfo));
    }

    public void setTraversalBefore(View view) {
        IMPL.setTraversalBefore(this.mInfo, view);
    }

    public void setTraversalBefore(View root, int virtualDescendantId) {
        IMPL.setTraversalBefore(this.mInfo, root, virtualDescendantId);
    }

    public AccessibilityNodeInfoCompat getTraversalAfter() {
        return wrapNonNullInstance(IMPL.getTraversalAfter(this.mInfo));
    }

    public void setTraversalAfter(View view) {
        IMPL.setTraversalAfter(this.mInfo, view);
    }

    public void setTraversalAfter(View root, int virtualDescendantId) {
        IMPL.setTraversalAfter(this.mInfo, root, virtualDescendantId);
    }

    public AccessibilityWindowInfoCompat getWindow() {
        return AccessibilityWindowInfoCompat.wrapNonNullInstance(IMPL.getWindow(this.mInfo));
    }

    public boolean isDismissable() {
        return IMPL.isDismissable(this.mInfo);
    }

    public void setDismissable(boolean dismissable) {
        IMPL.setDismissable(this.mInfo, dismissable);
    }

    public boolean isEditable() {
        return IMPL.isEditable(this.mInfo);
    }

    public void setEditable(boolean editable) {
        IMPL.setEditable(this.mInfo, editable);
    }

    public boolean isMultiLine() {
        return IMPL.isMultiLine(this.mInfo);
    }

    public void setMultiLine(boolean multiLine) {
        IMPL.setMultiLine(this.mInfo, multiLine);
    }

    public boolean refresh() {
        return IMPL.refresh(this.mInfo);
    }

    public int hashCode() {
        if (this.mInfo == null) {
            return 0;
        }
        return this.mInfo.hashCode();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            AccessibilityNodeInfoCompat other = (AccessibilityNodeInfoCompat) obj;
            return this.mInfo == null ? other.mInfo == null : this.mInfo.equals(other.mInfo);
        }
        return false;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(super.toString());
        Rect bounds = new Rect();
        getBoundsInParent(bounds);
        builder.append("; boundsInParent: " + bounds);
        getBoundsInScreen(bounds);
        builder.append("; boundsInScreen: " + bounds);
        builder.append("; packageName: ").append(getPackageName());
        builder.append("; className: ").append(getClassName());
        builder.append("; text: ").append(getText());
        builder.append("; contentDescription: ").append(getContentDescription());
        builder.append("; viewId: ").append(getViewIdResourceName());
        builder.append("; checkable: ").append(isCheckable());
        builder.append("; checked: ").append(isChecked());
        builder.append("; focusable: ").append(isFocusable());
        builder.append("; focused: ").append(isFocused());
        builder.append("; selected: ").append(isSelected());
        builder.append("; clickable: ").append(isClickable());
        builder.append("; longClickable: ").append(isLongClickable());
        builder.append("; enabled: ").append(isEnabled());
        builder.append("; password: ").append(isPassword());
        builder.append("; scrollable: " + isScrollable());
        builder.append("; [");
        int actionBits = getActions();
        while (actionBits != 0) {
            int action = 1 << Integer.numberOfTrailingZeros(actionBits);
            actionBits &= action ^ (-1);
            builder.append(getActionSymbolicName(action));
            if (actionBits != 0) {
                builder.append(", ");
            }
        }
        builder.append("]");
        return builder.toString();
    }

    private static String getActionSymbolicName(int action) {
        switch (action) {
            case 1:
                return "ACTION_FOCUS";
            case 2:
                return "ACTION_CLEAR_FOCUS";
            case 4:
                return "ACTION_SELECT";
            case 8:
                return "ACTION_CLEAR_SELECTION";
            case 16:
                return "ACTION_CLICK";
            case 32:
                return "ACTION_LONG_CLICK";
            case 64:
                return "ACTION_ACCESSIBILITY_FOCUS";
            case 128:
                return "ACTION_CLEAR_ACCESSIBILITY_FOCUS";
            case 256:
                return "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";
            case 512:
                return "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";
            case 1024:
                return "ACTION_NEXT_HTML_ELEMENT";
            case 2048:
                return "ACTION_PREVIOUS_HTML_ELEMENT";
            case 4096:
                return "ACTION_SCROLL_FORWARD";
            case 8192:
                return "ACTION_SCROLL_BACKWARD";
            case 16384:
                return "ACTION_COPY";
            case 32768:
                return "ACTION_PASTE";
            case 65536:
                return "ACTION_CUT";
            case 131072:
                return "ACTION_SET_SELECTION";
            default:
                return "ACTION_UNKNOWN";
        }
    }
}
