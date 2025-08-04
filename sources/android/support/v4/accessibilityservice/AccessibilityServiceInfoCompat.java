package android.support.v4.accessibilityservice;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.pm.ResolveInfo;
import android.os.Build;

/* loaded from: classes.dex */
public class AccessibilityServiceInfoCompat {
    public static final int CAPABILITY_CAN_FILTER_KEY_EVENTS = 8;
    public static final int CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY = 4;
    public static final int CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION = 2;
    public static final int CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT = 1;
    public static final int DEFAULT = 1;
    public static final int FEEDBACK_ALL_MASK = -1;
    public static final int FEEDBACK_BRAILLE = 32;
    public static final int FLAG_INCLUDE_NOT_IMPORTANT_VIEWS = 2;
    public static final int FLAG_REPORT_VIEW_IDS = 16;
    public static final int FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY = 8;
    public static final int FLAG_REQUEST_FILTER_KEY_EVENTS = 32;
    public static final int FLAG_REQUEST_TOUCH_EXPLORATION_MODE = 4;
    private static final AccessibilityServiceInfoVersionImpl IMPL;

    interface AccessibilityServiceInfoVersionImpl {
        boolean getCanRetrieveWindowContent(AccessibilityServiceInfo accessibilityServiceInfo);

        int getCapabilities(AccessibilityServiceInfo accessibilityServiceInfo);

        String getDescription(AccessibilityServiceInfo accessibilityServiceInfo);

        String getId(AccessibilityServiceInfo accessibilityServiceInfo);

        ResolveInfo getResolveInfo(AccessibilityServiceInfo accessibilityServiceInfo);

        String getSettingsActivityName(AccessibilityServiceInfo accessibilityServiceInfo);
    }

    static class AccessibilityServiceInfoStubImpl implements AccessibilityServiceInfoVersionImpl {
        AccessibilityServiceInfoStubImpl() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public boolean getCanRetrieveWindowContent(AccessibilityServiceInfo info2) {
            return false;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getDescription(AccessibilityServiceInfo info2) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getId(AccessibilityServiceInfo info2) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public ResolveInfo getResolveInfo(AccessibilityServiceInfo info2) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getSettingsActivityName(AccessibilityServiceInfo info2) {
            return null;
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public int getCapabilities(AccessibilityServiceInfo info2) {
            return 0;
        }
    }

    static class AccessibilityServiceInfoIcsImpl extends AccessibilityServiceInfoStubImpl {
        AccessibilityServiceInfoIcsImpl() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public boolean getCanRetrieveWindowContent(AccessibilityServiceInfo info2) {
            return AccessibilityServiceInfoCompatIcs.getCanRetrieveWindowContent(info2);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getDescription(AccessibilityServiceInfo info2) {
            return AccessibilityServiceInfoCompatIcs.getDescription(info2);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getId(AccessibilityServiceInfo info2) {
            return AccessibilityServiceInfoCompatIcs.getId(info2);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public ResolveInfo getResolveInfo(AccessibilityServiceInfo info2) {
            return AccessibilityServiceInfoCompatIcs.getResolveInfo(info2);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public String getSettingsActivityName(AccessibilityServiceInfo info2) {
            return AccessibilityServiceInfoCompatIcs.getSettingsActivityName(info2);
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public int getCapabilities(AccessibilityServiceInfo info2) {
            return getCanRetrieveWindowContent(info2) ? 1 : 0;
        }
    }

    static class AccessibilityServiceInfoJellyBeanMr2 extends AccessibilityServiceInfoIcsImpl {
        AccessibilityServiceInfoJellyBeanMr2() {
        }

        @Override // android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoIcsImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoStubImpl, android.support.v4.accessibilityservice.AccessibilityServiceInfoCompat.AccessibilityServiceInfoVersionImpl
        public int getCapabilities(AccessibilityServiceInfo info2) {
            return AccessibilityServiceInfoCompatJellyBeanMr2.getCapabilities(info2);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 18) {
            IMPL = new AccessibilityServiceInfoJellyBeanMr2();
        } else if (Build.VERSION.SDK_INT >= 14) {
            IMPL = new AccessibilityServiceInfoIcsImpl();
        } else {
            IMPL = new AccessibilityServiceInfoStubImpl();
        }
    }

    private AccessibilityServiceInfoCompat() {
    }

    public static String getId(AccessibilityServiceInfo info2) {
        return IMPL.getId(info2);
    }

    public static ResolveInfo getResolveInfo(AccessibilityServiceInfo info2) {
        return IMPL.getResolveInfo(info2);
    }

    public static String getSettingsActivityName(AccessibilityServiceInfo info2) {
        return IMPL.getSettingsActivityName(info2);
    }

    public static boolean getCanRetrieveWindowContent(AccessibilityServiceInfo info2) {
        return IMPL.getCanRetrieveWindowContent(info2);
    }

    public static String getDescription(AccessibilityServiceInfo info2) {
        return IMPL.getDescription(info2);
    }

    public static String feedbackTypeToString(int feedbackType) {
        StringBuilder builder = new StringBuilder();
        builder.append("[");
        while (feedbackType > 0) {
            int feedbackTypeFlag = 1 << Integer.numberOfTrailingZeros(feedbackType);
            feedbackType &= feedbackTypeFlag ^ (-1);
            if (builder.length() > 1) {
                builder.append(", ");
            }
            switch (feedbackTypeFlag) {
                case 1:
                    builder.append("FEEDBACK_SPOKEN");
                    break;
                case 2:
                    builder.append("FEEDBACK_HAPTIC");
                    break;
                case 4:
                    builder.append("FEEDBACK_AUDIBLE");
                    break;
                case 8:
                    builder.append("FEEDBACK_VISUAL");
                    break;
                case 16:
                    builder.append("FEEDBACK_GENERIC");
                    break;
            }
        }
        builder.append("]");
        return builder.toString();
    }

    public static String flagToString(int flag) {
        switch (flag) {
            case 1:
                return "DEFAULT";
            case 2:
                return "FLAG_INCLUDE_NOT_IMPORTANT_VIEWS";
            case 4:
                return "FLAG_REQUEST_TOUCH_EXPLORATION_MODE";
            case 8:
                return "FLAG_REQUEST_ENHANCED_WEB_ACCESSIBILITY";
            case 16:
                return "FLAG_REPORT_VIEW_IDS";
            case 32:
                return "FLAG_REQUEST_FILTER_KEY_EVENTS";
            default:
                return null;
        }
    }

    public static int getCapabilities(AccessibilityServiceInfo info2) {
        return IMPL.getCapabilities(info2);
    }

    public static String capabilityToString(int capability) {
        switch (capability) {
            case 1:
                return "CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT";
            case 2:
                return "CAPABILITY_CAN_REQUEST_TOUCH_EXPLORATION";
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                return "UNKNOWN";
            case 4:
                return "CAPABILITY_CAN_REQUEST_ENHANCED_WEB_ACCESSIBILITY";
            case 8:
                return "CAPABILITY_CAN_FILTER_KEY_EVENTS";
        }
    }
}
