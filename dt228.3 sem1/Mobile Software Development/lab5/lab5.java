package com.example.jianyu.lab5;

import android.app.ListActivity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.view.View;




public class lab5 extends ListActivity {




    String[] country = {"South Africa", "France", "Spain",
            "Samoa", "Germany", "Finland", "Ireland", "England"};


    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


       /* setListAdapter(
                new ArrayAdapter<String>
                        (this, android.R.layout.simple_list_item_1, countries));
        setListAdapter(
                new ArrayAdapter<String>
                        (this, R.layout.row,R.id.countries, country));*/
        setListAdapter(
                new MyCustomAdapter
                        (lab5.this, R.layout.row,country));
    }

    public void onListItemClick(ListView l, View v, int position, long id)
    {
        String selection = l.getItemAtPosition(position).toString();

        Toast.makeText(getApplicationContext(),
                selection + " is clicked",
                Toast.LENGTH_LONG).show();
    }

    public class MyCustomAdapter extends ArrayAdapter<String>
    {
        // Constructor
        public MyCustomAdapter(Context context, int rowLayoutId,
                               String[] myArrayData)
        {
            super(context, rowLayoutId, myArrayData);
        }
        @Override
        public View getView(int position, View convertView,
                            ViewGroup parent)
        {
            LayoutInflater inflater=getLayoutInflater();
            View row=inflater.inflate(R.layout.row, parent, false);
            TextView label=(TextView)row.findViewById(R.id.countries);
            label.setText(country[position]);
            ImageView icon=(ImageView)row.findViewById(R.id.icon);
            if (country[position] == "South Africa")
            {
                icon.setImageResource(R.drawable.ok);
            }
            else {
                icon.setImageResource(R.drawable.xmark);
            }

            return row;

        }
    }


}
