#include <SPI.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <Temboo.h>
#include <dht.h>
#include "TembooAccount.h" // Contains Temboo account information

WiFiClient client;

dht DHT;

int calls = 1;   // Execution count, so this doesn't run forever
int maxCalls = 10;   // Maximum number of times the Choreo should be executed

const int TsensorPin = A0; //temperature

const int BsensorPin = A1;

const int HsensorPin = A2;
void setup() {
  Serial.begin(9600);
  // For debugging, wait until the serial console is connected
  delay(4000);
  while(!Serial);
  int wifiStatus = WL_IDLE_STATUS;
  // Determine if the WiFi Shield is present
  Serial.print("\n\nShield:");
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("FAIL");

    // If there's no WiFi shield, stop here
    while(true);
  }
  Serial.println("OK");
  // Try to connect to the local WiFi network
  while(wifiStatus != WL_CONNECTED) {
    Serial.print("WiFi:");
    wifiStatus = WiFi.begin(WIFI_SSID,WPA_PASSWORD);
    if (wifiStatus == WL_CONNECTED) {
      Serial.println("OK");
    } else {
      Serial.println("FAIL");
    }
    delay(5000);
  }
  Serial.println("Setup complete.\n");
}

void loop() {

  int TsensorVal = analogRead(TsensorPin);
  int BsensorVal = analogRead(BsensorPin);
  int HsensorVal = DHT.read11(HsensorPin);


  float voltage = (TsensorVal / 1024.0) * 5.0;
  float temperature = (voltage - .5) * 100;
 
  int brightness = BsensorVal/4;

  float Hsensor = DHT.humidity;
  if (calls <= maxCalls) {
    Serial.println("Running AppendRow - Run #" + String(calls++));

    TembooChoreo AppendRowChoreo(client);

    // Invoke the Temboo client
    AppendRowChoreo.begin();

    // Set Temboo account credentials
    AppendRowChoreo.setAccountName(TEMBOO_ACCOUNT);
    AppendRowChoreo.setAppKeyName(TEMBOO_APP_KEY_NAME);
    AppendRowChoreo.setAppKey(TEMBOO_APP_KEY);
    AppendRowChoreo.setDeviceType(TEMBOO_DEVICE_TYPE);

    // Set Choreo inputs
    String SpreadsheetTitleValue = "object";
    AppendRowChoreo.addInput("SpreadsheetTitle", SpreadsheetTitleValue);
    String RowDataValue = String(temperature)+","+String(brightness)+","+String(Hsensor)+"%";
    AppendRowChoreo.addInput("RowData", RowDataValue);
    String RefreshTokenValue = "1/30I8YoLYD-fXp5bx1GsTQep9iruhCPT_jbJ_7LlITPk";
    AppendRowChoreo.addInput("RefreshToken", RefreshTokenValue);
    String ClientSecretValue = "v-syD77QLBLvIBXPLKb9_h6G";
    AppendRowChoreo.addInput("ClientSecret", ClientSecretValue);
    String ClientIDValue = "930089633689-e2jjvkdip4rs5v7702ji7186sgplkchd.apps.googleusercontent.com";
    AppendRowChoreo.addInput("ClientID", ClientIDValue);

    // Identify the Choreo to run
    AppendRowChoreo.setChoreo("/Library/Google/Spreadsheets/AppendRow");

    // Run the Choreo; when results are available, print them to serial
    AppendRowChoreo.run();

    while(AppendRowChoreo.available()) {
      char c = AppendRowChoreo.read();
      Serial.print(c);
      
    }
    AppendRowChoreo.close();
  }

  Serial.println("\nWaiting...\n");
  delay(300000); // wait 30 seconds between AppendRow calls
} 
