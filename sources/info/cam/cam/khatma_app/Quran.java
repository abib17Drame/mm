package info.cam.cam.khatma_app;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ViewFlipper;
import java.util.List;

/* loaded from: classes.dex */
public class Quran extends Activity implements GestureDetector.OnGestureListener {
    private static final int SWIPE_MAX_OFF_DISTANCE = 250;
    private static final int SWIPE_MIN_DISTANCE = 120;
    private static final int SWIPE_THRESHOLD_VELOCITY = 200;
    int curseur;
    private GestureDetector detector;
    int id;
    ImageView imageView1;
    ImageView imageView2;
    List<Integer> list;
    Button retour;
    private Animation slideleftin;
    private Animation slideleftout;
    private Animation sliderightin;
    private Animation sliderightout;
    ViewFlipper viewFlipper;
    Button zoom;
    int cpt = 0;
    int r = 0;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quran);
        this.imageView1 = (ImageView) findViewById(R.id.id1);
        this.imageView2 = (ImageView) findViewById(R.id.id2);
        this.viewFlipper = (ViewFlipper) findViewById(R.id.flipper);
        this.detector = new GestureDetector(this, this);
        Bundle extra = getIntent().getExtras();
        this.id = extra.getInt(KhatmaBdHelper.KEY_ID);
        this.list = Verser.getQuran(this.id);
        this.imageView1.setImageResource(this.list.get(this.cpt).intValue());
        this.cpt++;
        this.slideleftin = AnimationUtils.loadAnimation(this, R.anim.slide_left_in);
        this.slideleftout = AnimationUtils.loadAnimation(this, R.anim.slide_left_out);
        this.sliderightin = AnimationUtils.loadAnimation(this, R.anim.slide_right_in);
        this.sliderightout = AnimationUtils.loadAnimation(this, R.anim.slide_right_out);
        this.retour = (Button) findViewById(R.id.retourQuran);
        this.zoom = (Button) findViewById(R.id.zoom);
        this.retour.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.Quran.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Quran.this.finish();
            }
        });
        this.zoom.setOnClickListener(new View.OnClickListener() { // from class: info.cam.cam.khatma_app.Quran.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Quran.this.viewFlipper.getDisplayedChild();
                Intent zoom = new Intent(Quran.this.getApplicationContext(), (Class<?>) ZoomQuran.class);
                zoom.putExtra(KhatmaBdHelper.KEY_ID, Quran.this.list.get(Quran.this.curseur));
                Quran.this.startActivityForResult(zoom, 1);
            }
        });
    }

    @Override // android.app.Activity
    public boolean onTouchEvent(MotionEvent event) {
        return this.detector.onTouchEvent(event);
    }

    public void precedent(View view) {
        if (this.cpt > 1) {
            this.cpt--;
            if (this.r == 0) {
                this.imageView2.setImageResource(this.list.get(this.cpt - 1).intValue());
                this.r = 1;
            } else if (this.r == 1) {
                this.imageView1.setImageResource(this.list.get(this.cpt - 1).intValue());
                this.r = 0;
            }
            this.curseur = this.cpt - 1;
            this.viewFlipper.showNext();
        }
    }

    public void suivant(View view) {
        if (this.cpt < this.list.size()) {
            if (this.r == 0) {
                this.imageView2.setImageResource(this.list.get(this.cpt).intValue());
                this.cpt++;
                this.r = 1;
            } else if (this.r == 1) {
                this.imageView1.setImageResource(this.list.get(this.cpt).intValue());
                this.cpt++;
                this.r = 0;
            }
            this.curseur = this.cpt - 1;
            this.viewFlipper.showNext();
            return;
        }
        if (this.cpt == this.list.size() && this.id < 60) {
            AlertDialog.Builder alertDialog2 = new AlertDialog.Builder(this);
            alertDialog2.setTitle("الحزب التالي ");
            alertDialog2.setIcon(R.drawable.khatma);
            alertDialog2.setPositiveButton("نعم", new DialogInterface.OnClickListener() { // from class: info.cam.cam.khatma_app.Quran.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    Quran.this.id++;
                    Quran.this.cpt = 0;
                    Quran.this.list = Verser.getQuran(Quran.this.id);
                    if (Quran.this.r == 0) {
                        Quran.this.imageView2.setImageResource(Quran.this.list.get(Quran.this.cpt).intValue());
                        Quran.this.cpt++;
                        Quran.this.r = 1;
                    } else if (Quran.this.r == 1) {
                        Quran.this.imageView1.setImageResource(Quran.this.list.get(Quran.this.cpt).intValue());
                        Quran.this.cpt++;
                        Quran.this.r = 0;
                    }
                    Quran.this.curseur = Quran.this.cpt - 1;
                    Quran.this.viewFlipper.showNext();
                }
            });
            alertDialog2.setNegativeButton("لا.", new DialogInterface.OnClickListener() { // from class: info.cam.cam.khatma_app.Quran.4
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    dialog.cancel();
                }
            });
            alertDialog2.show();
        }
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
        if (Math.abs(e1.getY() - e2.getY()) <= 250.0f) {
            if (e1.getX() - e2.getX() > 120.0f && Math.abs(velocityX) > 200.0f) {
                this.viewFlipper.setInAnimation(this.slideleftin);
                this.viewFlipper.setOutAnimation(this.slideleftout);
                if (this.cpt > 1) {
                    this.cpt--;
                    if (this.r == 0) {
                        this.imageView2.setImageResource(this.list.get(this.cpt - 1).intValue());
                        this.r = 1;
                    } else if (this.r == 1) {
                        this.imageView1.setImageResource(this.list.get(this.cpt - 1).intValue());
                        this.r = 0;
                    }
                    this.curseur = this.cpt - 1;
                    this.viewFlipper.showNext();
                }
            } else if (e2.getX() - e1.getX() > 120.0f && Math.abs(velocityX) > 200.0f) {
                this.viewFlipper.setInAnimation(this.sliderightin);
                this.viewFlipper.setOutAnimation(this.sliderightout);
                if (this.cpt < this.list.size()) {
                    if (this.r == 0) {
                        this.imageView2.setImageResource(this.list.get(this.cpt).intValue());
                        this.cpt++;
                        this.r = 1;
                    } else if (this.r == 1) {
                        this.imageView1.setImageResource(this.list.get(this.cpt).intValue());
                        this.cpt++;
                        this.r = 0;
                    }
                    this.curseur = this.cpt - 1;
                    this.viewFlipper.showNext();
                } else if (this.cpt == this.list.size() && this.id < 60) {
                    AlertDialog.Builder alertDialog2 = new AlertDialog.Builder(this);
                    alertDialog2.setTitle("الحزب التالي ");
                    alertDialog2.setIcon(R.drawable.khatma);
                    alertDialog2.setPositiveButton("نعم", new DialogInterface.OnClickListener() { // from class: info.cam.cam.khatma_app.Quran.5
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            Quran.this.id++;
                            Quran.this.cpt = 0;
                            Quran.this.list = Verser.getQuran(Quran.this.id);
                            if (Quran.this.r == 0) {
                                Quran.this.imageView2.setImageResource(Quran.this.list.get(Quran.this.cpt).intValue());
                                Quran.this.cpt++;
                                Quran.this.r = 1;
                            } else if (Quran.this.r == 1) {
                                Quran.this.imageView1.setImageResource(Quran.this.list.get(Quran.this.cpt).intValue());
                                Quran.this.cpt++;
                                Quran.this.r = 0;
                            }
                            Quran.this.curseur = Quran.this.cpt - 1;
                            Quran.this.viewFlipper.showNext();
                        }
                    });
                    alertDialog2.setNegativeButton("لا.", new DialogInterface.OnClickListener() { // from class: info.cam.cam.khatma_app.Quran.6
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.cancel();
                        }
                    });
                    alertDialog2.show();
                }
            }
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onDown(MotionEvent e) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onShowPress(MotionEvent e) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(MotionEvent e) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onLongPress(MotionEvent e) {
    }
}
