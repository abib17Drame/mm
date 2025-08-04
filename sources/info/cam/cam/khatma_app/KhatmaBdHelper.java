package info.cam.cam.khatma_app;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import java.util.ArrayList;
import java.util.Date;

/* loaded from: classes.dex */
public class KhatmaBdHelper extends SQLiteOpenHelper {
    public static final String DB_NAME = "khatma_BASEVF0";
    public static final int DB_VERSION = 1;
    public static final String ENCODING_SETTING = "PRAGMA encoding ='windows-1256'";
    public static final String KEY_DATE = "date";
    public static final String KEY_ID = "id";
    public static final String Key_JOUR = "jour";
    public static final String Key_VERSER1 = "verser1";
    public static final String Key_VERSER2 = "verser2";
    public static final String Key_VERSER3 = "verser3";
    public static final String TABLE_KHAIMA = "khatma";

    public KhatmaBdHelper(Context context) {
        super(context, DB_NAME, (SQLiteDatabase.CursorFactory) null, 1);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sqLiteDatabase) throws SQLException {
        Log.e("La requete", "CREATE TABLE khatma (id INTEGER PRIMARY KEY AUTOINCREMENT,verser1 TEXT,verser2 TEXT,verser3 TEXT ,date TEXT,jour TEXT)");
        sqLiteDatabase.execSQL("CREATE TABLE khatma (id INTEGER PRIMARY KEY AUTOINCREMENT,verser1 TEXT,verser2 TEXT,verser3 TEXT ,date TEXT,jour TEXT)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onOpen(SQLiteDatabase db) throws SQLException {
        if (!db.isReadOnly()) {
            db.execSQL(ENCODING_SETTING);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) throws SQLException {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS khatma");
        onCreate(sqLiteDatabase);
    }

    public void ajouterLigne(Khatma khatma) {
        SQLiteDatabase db = getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(Key_VERSER1, khatma.getVerser1());
        values.put(Key_VERSER2, khatma.getVerser2());
        values.put(Key_VERSER3, khatma.getVerser3());
        values.put(Key_JOUR, khatma.getJour());
        if (khatma.getDate() == null) {
            values.put(KEY_DATE, "0");
        } else {
            values.put(KEY_DATE, "" + khatma.getDate().getTime());
        }
        db.insert(TABLE_KHAIMA, null, values);
        db.close();
    }

    public ArrayList<Khatma> getToutLigne() {
        ArrayList<Khatma> contactsList = new ArrayList<>();
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM khatma", null);
        if (cursor.moveToFirst()) {
            do {
                Khatma p = new Khatma(cursor.getInt(0), cursor.getString(1), cursor.getString(2), cursor.getString(3), new Date((long) Double.parseDouble(cursor.getString(4))), cursor.getString(5));
                contactsList.add(p);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return contactsList;
    }

    public Date getdernierSesseion() {
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM khatma where id=1", null);
        Khatma p = null;
        if (cursor.moveToFirst()) {
            do {
                p = new Khatma(cursor.getInt(0), cursor.getString(1), cursor.getString(2), cursor.getString(3), new Date((long) Double.parseDouble(cursor.getString(4))), cursor.getString(5));
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return p.getDate();
    }

    public int nombreLigne() {
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM khatma", null);
        return cursor.getCount();
    }

    public String[] colonne() {
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM khatma", null);
        return cursor.getColumnNames();
    }

    public Khatma getLigneById(int id) {
        Khatma p = null;
        String sql = "SELECT * FROM khatma where id=" + id;
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.rawQuery(sql, null);
        if (cursor.moveToFirst()) {
            do {
                p = new Khatma(cursor.getInt(0), cursor.getString(1), cursor.getString(2), cursor.getString(3), new Date((long) Double.parseDouble(cursor.getString(4))), cursor.getString(5));
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return p;
    }

    public void deleteContact() {
        SQLiteDatabase db = getWritableDatabase();
        db.delete(TABLE_KHAIMA, null, null);
        db.close();
    }

    public void deleteTable() throws SQLException {
        SQLiteDatabase db = getWritableDatabase();
        db.execSQL("DROP TABLE IF EXISTS khatma");
        db.close();
    }

    public int updateSession(Date session) {
        SQLiteDatabase sq = getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(KEY_DATE, "" + session.getTime());
        return sq.update(TABLE_KHAIMA, values, "id = ?", new String[]{String.valueOf(1)});
    }
}
