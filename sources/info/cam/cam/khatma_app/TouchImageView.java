package info.cam.cam.khatma_app;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.widget.ImageView;

/* loaded from: classes.dex */
public class TouchImageView extends ImageView {
    static final int CLICK = 3;
    static final int DRAG = 1;
    static final int NONE = 0;
    static final int ZOOM = 2;
    Context context;
    PointF last;
    float[] m;
    ScaleGestureDetector mScaleDetector;
    Matrix matrix;
    float maxScale;
    float minScale;
    int mode;
    int oldMeasuredHeight;
    int oldMeasuredWidth;
    protected float origHeight;
    protected float origWidth;
    float saveScale;
    PointF start;
    int viewHeight;
    int viewWidth;

    public TouchImageView(Context context) {
        super(context);
        this.mode = 0;
        this.last = new PointF();
        this.start = new PointF();
        this.minScale = 1.0f;
        this.maxScale = 3.0f;
        this.saveScale = 1.0f;
        sharedConstructing(context);
    }

    public TouchImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mode = 0;
        this.last = new PointF();
        this.start = new PointF();
        this.minScale = 1.0f;
        this.maxScale = 3.0f;
        this.saveScale = 1.0f;
        sharedConstructing(context);
    }

    private void sharedConstructing(Context context) {
        super.setClickable(true);
        this.context = context;
        this.mScaleDetector = new ScaleGestureDetector(context, new ScaleListener());
        this.matrix = new Matrix();
        this.m = new float[9];
        setImageMatrix(this.matrix);
        setScaleType(ImageView.ScaleType.MATRIX);
        setOnTouchListener(new View.OnTouchListener() { // from class: info.cam.cam.khatma_app.TouchImageView.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                TouchImageView.this.mScaleDetector.onTouchEvent(event);
                PointF curr = new PointF(event.getX(), event.getY());
                switch (event.getAction()) {
                    case 0:
                        TouchImageView.this.last.set(curr);
                        TouchImageView.this.start.set(TouchImageView.this.last);
                        TouchImageView.this.mode = 1;
                        break;
                    case 1:
                        TouchImageView.this.mode = 0;
                        int xDiff = (int) Math.abs(curr.x - TouchImageView.this.start.x);
                        int yDiff = (int) Math.abs(curr.y - TouchImageView.this.start.y);
                        if (xDiff < 3 && yDiff < 3) {
                            TouchImageView.this.performClick();
                            break;
                        }
                        break;
                    case 2:
                        if (TouchImageView.this.mode == 1) {
                            float deltaX = curr.x - TouchImageView.this.last.x;
                            float deltaY = curr.y - TouchImageView.this.last.y;
                            float fixTransX = TouchImageView.this.getFixDragTrans(deltaX, TouchImageView.this.viewWidth, TouchImageView.this.origWidth * TouchImageView.this.saveScale);
                            float fixTransY = TouchImageView.this.getFixDragTrans(deltaY, TouchImageView.this.viewHeight, TouchImageView.this.origHeight * TouchImageView.this.saveScale);
                            TouchImageView.this.matrix.postTranslate(fixTransX, fixTransY);
                            TouchImageView.this.fixTrans();
                            TouchImageView.this.last.set(curr.x, curr.y);
                            break;
                        }
                        break;
                    case 6:
                        TouchImageView.this.mode = 0;
                        break;
                }
                TouchImageView.this.setImageMatrix(TouchImageView.this.matrix);
                TouchImageView.this.invalidate();
                return true;
            }
        });
    }

    public void setMaxZoom(float x) {
        this.maxScale = x;
    }

    private class ScaleListener extends ScaleGestureDetector.SimpleOnScaleGestureListener {
        private ScaleListener() {
        }

        @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScaleBegin(ScaleGestureDetector detector) {
            TouchImageView.this.mode = 2;
            return true;
        }

        @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScale(ScaleGestureDetector detector) {
            float mScaleFactor = detector.getScaleFactor();
            float origScale = TouchImageView.this.saveScale;
            TouchImageView.this.saveScale *= mScaleFactor;
            if (TouchImageView.this.saveScale > TouchImageView.this.maxScale) {
                TouchImageView.this.saveScale = TouchImageView.this.maxScale;
                mScaleFactor = TouchImageView.this.maxScale / origScale;
            } else if (TouchImageView.this.saveScale < TouchImageView.this.minScale) {
                TouchImageView.this.saveScale = TouchImageView.this.minScale;
                mScaleFactor = TouchImageView.this.minScale / origScale;
            }
            if (TouchImageView.this.origWidth * TouchImageView.this.saveScale <= TouchImageView.this.viewWidth || TouchImageView.this.origHeight * TouchImageView.this.saveScale <= TouchImageView.this.viewHeight) {
                TouchImageView.this.matrix.postScale(mScaleFactor, mScaleFactor, TouchImageView.this.viewWidth / 2, TouchImageView.this.viewHeight / 2);
            } else {
                TouchImageView.this.matrix.postScale(mScaleFactor, mScaleFactor, detector.getFocusX(), detector.getFocusY());
            }
            TouchImageView.this.fixTrans();
            return true;
        }
    }

    void fixTrans() {
        this.matrix.getValues(this.m);
        float transX = this.m[2];
        float transY = this.m[5];
        float fixTransX = getFixTrans(transX, this.viewWidth, this.origWidth * this.saveScale);
        float fixTransY = getFixTrans(transY, this.viewHeight, this.origHeight * this.saveScale);
        if (fixTransX != 0.0f || fixTransY != 0.0f) {
            this.matrix.postTranslate(fixTransX, fixTransY);
        }
    }

    float getFixTrans(float trans, float viewSize, float contentSize) {
        float minTrans;
        float maxTrans;
        if (contentSize <= viewSize) {
            minTrans = 0.0f;
            maxTrans = viewSize - contentSize;
        } else {
            minTrans = viewSize - contentSize;
            maxTrans = 0.0f;
        }
        if (trans < minTrans) {
            return (-trans) + minTrans;
        }
        if (trans > maxTrans) {
            return (-trans) + maxTrans;
        }
        return 0.0f;
    }

    float getFixDragTrans(float delta, float viewSize, float contentSize) {
        if (contentSize <= viewSize) {
            return 0.0f;
        }
        return delta;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        this.viewWidth = View.MeasureSpec.getSize(widthMeasureSpec);
        this.viewHeight = View.MeasureSpec.getSize(heightMeasureSpec);
        if ((this.oldMeasuredHeight != this.viewWidth || this.oldMeasuredHeight != this.viewHeight) && this.viewWidth != 0 && this.viewHeight != 0) {
            this.oldMeasuredHeight = this.viewHeight;
            this.oldMeasuredWidth = this.viewWidth;
            if (this.saveScale == 1.0f) {
                Drawable drawable = getDrawable();
                if (drawable != null && drawable.getIntrinsicWidth() != 0 && drawable.getIntrinsicHeight() != 0) {
                    int bmWidth = drawable.getIntrinsicWidth();
                    int bmHeight = drawable.getIntrinsicHeight();
                    Log.d("bmSize", "bmWidth: " + bmWidth + " bmHeight : " + bmHeight);
                    float scaleX = this.viewWidth / bmWidth;
                    float scaleY = this.viewHeight / bmHeight;
                    float scale = Math.min(scaleX, scaleY);
                    this.matrix.setScale(scale, scale);
                    float redundantYSpace = (this.viewHeight - (bmHeight * scale)) / 2.0f;
                    float redundantXSpace = (this.viewWidth - (bmWidth * scale)) / 2.0f;
                    this.matrix.postTranslate(redundantXSpace, redundantYSpace);
                    this.origWidth = this.viewWidth - (2.0f * redundantXSpace);
                    this.origHeight = this.viewHeight - (2.0f * redundantYSpace);
                    setImageMatrix(this.matrix);
                } else {
                    return;
                }
            }
            fixTrans();
        }
    }
}
