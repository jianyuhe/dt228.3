package com.example.d17124591.myapplication;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.view.View;
import android.widget.Toast;
import android.view.View.OnClickListener;


public class MainActivity extends Activity implements View.OnClickListener {
   private Button btn1;
    private Button btn2;
   private Button btn3;
    private Button btn4;

    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn1 = (Button) findViewById(R.id.button1);
        btn1.setOnClickListener(this);

        btn2 = (Button) findViewById(R.id.button2);
        btn2.setOnClickListener(this);


        btn3 = (Button) findViewById(R.id.button3);

        btn4 = (Button) findViewById(R.id.button4);
        btn4.setOnClickListener(
                new OnClickListener() {
                    public void onClick(View v) {
                        Toast.makeText(getApplicationContext(),
                                "Button4 is clicked",
                                Toast.LENGTH_LONG).show();
                    }
                });

    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.button1:
                Toast.makeText(getApplicationContext(),
                        "Button1 is clicked",
                        Toast.LENGTH_LONG).show();

           case R.id.button2:
                Toast.makeText(getApplicationContext(),
                        "Button2 is clicked",
                        Toast.LENGTH_LONG).show();


        }


    }




    public void showToast(View v)
    {
        Toast.makeText(getApplicationContext(),
                "Button3 is clicked",
                Toast.LENGTH_LONG).show();
    }
}




