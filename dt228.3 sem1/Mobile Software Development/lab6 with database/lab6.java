package com.example.jianyu.lab6;

import android.app.Activity;
import android.os.Bundle;

import android.os.Message;
import android.widget.EditText;
import android.view.View;
import android.widget.Toast;

public class lab6 extends Activity {
    EditText firstname, surname, city;
    DatabaseExample helper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lab6);
        firstname = (EditText) findViewById(R.id.Ifirstname);
        surname = (EditText) findViewById(R.id.Isurname);
        city = (EditText) findViewById(R.id.Icity);
     helper = new DatabaseExample(this);
    }

    public void addData(View view) {
        helper.open();
        String t1 = firstname.getText().toString();
        String t2 = surname.getText().toString();
        String t3 = city.getText().toString();
        if (t1.isEmpty() || t2.isEmpty() || t3.isEmpty()) {
            Toast.makeText(getApplicationContext(),
                    " Please enter all information",
                    Toast.LENGTH_LONG).show();
        } else {
            long id = helper.insertPerson(t1, t2, t3);
            if (id <= 0) {
                Toast.makeText(getApplicationContext(),
                        " Insertion Successful",
                        Toast.LENGTH_LONG).show();

            }
            else
            {
                Toast.makeText(getApplicationContext(),
                        " Insertion Successful",
                        Toast.LENGTH_LONG).show();
            }
        }
        helper.close();
    }

    public void viewdata(View view)
    {
        helper.open();
        String data = helper.getAllPeople();
        Toast.makeText(getApplicationContext(),
                data,
                Toast.LENGTH_LONG).show();
        helper.close();
    }

}