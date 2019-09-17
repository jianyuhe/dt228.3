package com.example.sk.lab6;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class Database
{

    // database columns
    private static final String KEY_ROWID 	    = "_id";
    private static final String KEY_TASKNAME 	= "task_name";
    private static final String KEY_TASKDESC     = "task_desc";
    private static final String KEY_COMPLETE  = "complete_status";
    private static final String DATABASE_NAME 	= "TaskList";
    private static final String DATABASE_TABLE 	= "Tasks";
    private static final int DATABASE_VERSION 	= 1;

    // SQL statement to create the database
    private static final String DATABASE_CREATE =
            "create table Tasks (_id integer primary key autoincrement, " +
                    "task_name text not null, " + "task_desc text not null, "  +
                    "complete_status integer not null, CHECK (complete_status IN (0, 1)));";

    private final Context context;
    private DatabaseHelper DBHelper;
    private SQLiteDatabase db;

    // Constructor
    public Database(Context ctx)
    {
        //
        this.context 	= ctx;
        DBHelper 		= new DatabaseHelper(context);
    }

    public Database open() throws SQLException
    {
        db     = DBHelper.getWritableDatabase();
        return this;
    }

    public void close()
    {
        DBHelper.close();
    }

    public long insertTask(String taskName, String taskDesc, int completeStatus)
    {
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_TASKNAME, taskName);
        initialValues.put(KEY_TASKDESC, taskDesc);
        initialValues.put(KEY_COMPLETE, completeStatus);
        return db.insert(DATABASE_TABLE, null, initialValues);
    }

    public boolean deleteTask(long rowId)
    {
        //
        return db.delete(DATABASE_TABLE, KEY_ROWID +
                "=" + rowId, null) > 0;
    }

    public Cursor getAllTasks()
    {
        return db.query(DATABASE_TABLE, new String[]
                        {
                                KEY_ROWID,
                                KEY_TASKNAME,
                                KEY_TASKDESC,
                                KEY_COMPLETE
                        },
                null, null, null, null, null);
    }

    public Cursor getTask(long rowId) throws SQLException
    {
        Cursor mCursor =
                    db.query(true, DATABASE_TABLE, new String[]
                                {
                                        KEY_ROWID,
                                        KEY_TASKNAME,
                                        KEY_TASKDESC,
                                        KEY_COMPLETE
                                },
                        KEY_ROWID + "=" + rowId,  null, null, null, null, null);

        if (mCursor != null)
        {
            mCursor.moveToFirst();
        }
        return mCursor;
    }

    public Cursor getCompletedTask() throws SQLException
    {
        return db.query(true, DATABASE_TABLE, new String[]
                                {
                                        KEY_ROWID,
                                        KEY_TASKNAME,
                                        KEY_TASKDESC,
                                        KEY_COMPLETE
                                },
                        KEY_COMPLETE + "=" + 1, null, null,null, null, null);
    }

    //
    public boolean updateTask(long rowId, String taskName, String taskDesc, String completeStatus)
    {
        ContentValues args = new ContentValues();
        args.put(KEY_TASKNAME, taskName);
        args.put(KEY_TASKDESC, taskDesc);
        args.put(KEY_COMPLETE, completeStatus);
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


