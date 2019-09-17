package com.example.minhuichen.lab8_2;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.List;
import java.util.Locale;


public class MainActivity extends Activity implements LocationListener {

    private TextView locationText;
    private TextView geocoderText;
    private LocationManager locationManager;
    private long minTime = 500;
    private float minDistance = 1;
    private static final int MY_PERMISSION_GPS = 1;
    String addressName;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        locationText = (TextView) findViewById(R.id.location);
        geocoderText = findViewById(R.id.geocoder);
        setUpLocation();
        onPause();
    }
    // Switch on Location tracking
    private void setUpLocation()
    {
        locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        // Check if there is permission for location tracking already stored
        if (ContextCompat.checkSelfPermission(MainActivity.this,
                Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED)
        {
            // If not, display a dialog box to the users to request permission
            ActivityCompat.requestPermissions(MainActivity.this,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    MY_PERMISSION_GPS);
        } else {
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, minTime, minDistance, this);
        }
    }
    // call back method when location listener detect a "change of location"
    public void onLocationChanged(Location location) {
        try {
            // get a geocoder object
            Geocoder geo = new Geocoder(MainActivity.this.getApplicationContext(), Locale.getDefault());
            // call the method to translate GPS to address(es)
            List<Address> addresses = geo.getFromLocation(location.getLatitude(), location.getLongitude(), 1);
            if (addresses.size() > 0)
            {
                addressName = addresses.get(0).getFeatureName() + ", " +
                        addresses.get(0).getLocality() + ", " +
                        addresses.get(0).getAdminArea() + ", " +
                        addresses.get(0).getCountryName();
                geocoderText.setText(addressName);
            }
            else
            {
                geocoderText.setText("address Not found!");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        String latestLocation = "";
        if (location != null) {
            latestLocation = String.format(
                    "Current Location: Latitude %1$s Longitude : %2$s",
                    Math.round(location.getLatitude()), Math.round(location.getLongitude()));
        }
        locationText.setText("GPS Location" + "\n" + latestLocation);
    } // end onLocationChanged

    public void onProviderDisabled(String provider)  {  }
    public void onProviderEnabled(String provider) { }
    public void onStatusChanged(String provider, int status, Bundle extras) {  }

    // callback method triggered when user responds to the request permissions dialog
    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case MY_PERMISSION_GPS:
                // if permission grand, fine.
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // All good!
                } else {
                    Toast.makeText(this, "Need your location!", Toast.LENGTH_SHORT).show();
                }
                break;
        }
    }
    // life cycle method: restart location tracking when Activity resumes
    @Override
    protected void onResume() {
        // switch on location tracking again
        super.onResume();
        if (ContextCompat.checkSelfPermission(MainActivity.this,
                Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED)
        {
            ActivityCompat.requestPermissions(MainActivity.this,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    MY_PERMISSION_GPS);
        } else {
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, minTime, minDistance, this);
        }
        Log.d("AppTest", "Application  has been resumed");
    }
    // life cycle method: switch off location tracking if activity is paused
    // @Override
    protected void onPause()
    {
        super.onPause();
        // switch off location tracking
        locationManager.removeUpdates(this);
        Log.d("AppTest", "Application  has been Paused");
    }
}
