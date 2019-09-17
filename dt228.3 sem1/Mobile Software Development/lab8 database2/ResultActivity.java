package com.example.sk.lab6;

import android.app.ListActivity;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.Toast;

public class ResultActivity extends ListActivity {

    private Database db;
    private Cursor cursor;
    private String[] columns = new String[] {"task_name", "task_desc", "complete_status"};
    private int[] rowIDs = new int[] {R.id.lv_taskName, R.id.lv_taskDesc};
    private SimpleCursorAdapter mAdapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);
        db = new Database(this);
        db.open();

        // Q1 - 3
        //cursor = db.getAllTasks();
        cursor = db.getCompletedTask();
        mAdapter = new SimpleCursorAdapter(this, R.layout.row, cursor, columns, rowIDs, 0);
        setListAdapter(mAdapter);
        db.close();
    }

    @Override
    public void onListItemClick(ListView parent, View v, int position, long id) {
        super.onListItemClick(parent, v, position, id);
        // Get the item that been clicked from list
        cursor = (Cursor) mAdapter.getItem(position);

        // Get status from cursor object that been clicked
        String status = cursor.getString(3);
        // its 3 because 0 is _id, 1 is name, 2 is desc...
        //Log.i("status", status);

        // Operations when clicked
        if (status.equals("1")) {
            // Show task complete when complete_status is "1"
            Toast.makeText(getApplicationContext(), "Task is completed", Toast.LENGTH_LONG).show();
        }

        if (status.equals("0")) {
            // Show task incomplete when complete_status is "0"
            Toast.makeText(getApplicationContext(), "Task is not completed", Toast.LENGTH_LONG).show();
        }

    }

    public void goBack(View v) {
        finish();
    }
}
