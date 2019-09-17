package com.example.jianyu.lab6;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DatabaseExample {

    // database columns
    private static final String KEY_ROWID 	    = "_id";
    private static final String KEY_FIRSTNAME 	= "first_name";
    private static final String KEY_SURNAME     = "surname";
    private static final String KEY_CITY 	    = "city";
    private static final String DATABASE_NAME 	= "Contacts";
    private static final String DATABASE_TABLE 	= "Contact_Details";
    private static final int DATABASE_VERSION 	= 1;

    // SQL statement to create the database
    private static final String DATABASE_CREATE =
            "create table Contact_Details (_id integer primary key autoincrement, " +
                    "first_name text not null, " + " surname text not null, "  +
                    "city text not null);";

    private final Context context;
    private DatabaseHelper DBHelper;
    private SQLiteDatabase db;

    // Constructor
    public DatabaseExample(Context ctx)
    {
        //
        this.context 	= ctx;
        DBHelper 		= new DatabaseHelper(context);
    }

    public DatabaseExample open() throws SQLException
    {
        db     = DBHelper.getWritableDatabase();
        return this;

    }

    public void close()
    {
        DBHelper.close();
    }

    public long insertPerson(String firstName, String surname, String city)
    {

        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_FIRSTNAME, firstName);
        initialValues.put(KEY_SURNAME, surname);
        initialValues.put(KEY_CITY, city);
        return db.insert(DATABASE_TABLE, null, initialValues);
    }

    public boolean deletePerson(long rowId)
    {
        //
        return db.delete(DATABASE_TABLE, KEY_ROWID +
                "=" + rowId, null) > 0;
    }

    public String getAllPeople()
    {
        String[] columns = {DatabaseExample.KEY_FIRSTNAME,DatabaseExample.KEY_SURNAME,DatabaseExample.KEY_CITY};
        Cursor cursor = db.query(

                                DATABASE_TABLE, columns
                        ,
                null, null, null, null, null);
        StringBuffer buffer= new StringBuffer();
        while (cursor.moveToNext())
        {
            int firstname =cursor.getInt(cursor.getColumnIndex(DatabaseExample.KEY_FIRSTNAME));
            String surname =cursor.getString(cursor.getColumnIndex(DatabaseExample.KEY_SURNAME));
            String  city =cursor.getString(cursor.getColumnIndex(DatabaseExample.KEY_CITY));
            buffer.append(firstname+ "   " + surname + "   " + city +" \n");
        }
        return buffer.toString();
    }

    public Cursor getPerson(long rowId) throws SQLException
    {

        Cursor mCursor =
                db.query(true, DATABASE_TABLE, new String[]
                                {
                                        KEY_ROWID,
                                        KEY_FIRSTNAME,
                                        KEY_SURNAME,
                                        KEY_CITY
                                },
                        KEY_ROWID + "=" + rowId,  null, null, null, null, null);

        if (mCursor != null)
        {
            mCursor.moveToFirst();
        }
        return mCursor;
    }

    //
    public boolean updatePerson(long rowId, String firstName, String surname, String city)
    {
        ContentValues args = new ContentValues();
        args.put(KEY_FIRSTNAME, firstName);
        args.put(KEY_SURNAME, surname);
        args.put(KEY_CITY, city);
        return db.update(DATABASE_TABLE, args,
                KEY_ROWID + "=" + rowId, null) > 0;
    }

    // ///////////////////////nested dB helper class ///////////////////////////////////////
    private static class DatabaseHelper extends SQLiteOpenHelper
    {
        //
        DatabaseHelper(Context context)
        {
            super(context, DATABASE_NAME, null, DATABASE_VERSION);
        }


        @Override
        //
        public void onCreate(SQLiteDatabase db)
        {

            db.execSQL(DATABASE_CREATE);
        }

        @Override
        //
        public void onUpgrade(SQLiteDatabase db, int oldVersion,
                              int newVersion)
        {
            // dB structure change..

        }
    }
    //////////////////////////// end nested dB helper class //////////////////////////////////////
}
