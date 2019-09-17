package com.example.jianyu.lab4;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class RedActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.red);

        Button greenButton = (Button)findViewById(R.id.green);
        greenButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent intent = new Intent(RedActivity.this, GreenActivity.class);
                startActivity(intent);
            }
        });
    }
}
