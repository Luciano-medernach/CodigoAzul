#include <SPI.h>
#include <Ethernet.h>
#include <LiquidCrystal.h>


const int rs = 8, en = 9, d4 = 4, d5 = 5, d6 = 6, d7 = 7;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);


byte mac[] = { 0x00, 0xAB, 0xBB, 0xCC, 0xDE, 0x02 }; //de la placa arduino
byte server[] = {192,168,0,230};
byte ip[] = {192,168,1,200};

EthernetClient client;

// Configuracion del arduino
String type = "urgente", origin = "puerta";
int area = 2; 

// Pin y estado de los botones
byte urgentButtonPin = 38, normalButtonPin = 39;
int lastUrgentButtonState, lastNormalButtonState;
int urgentButtonState, normalButtonState;

// Pin del buzzer
const byte pinBuzzer = 40;

// Estados urgentes y normales
bool urgentState, normalState;

// Tiempo tardado entre llamadas
int time = 0;

// Id de la llamada
String id;
String areaName = "Quirofano";

// Read
char inString[32]; // string for incoming serial data
int stringPos = 0; // string index counter
boolean startRead = false; // is reading?

boolean cantPress = false; 

void setup() {
  
  pinMode(urgentButtonPin, INPUT);
  pinMode(normalButtonPin, INPUT);

  lcd.begin(16, 2);
  lcd.clear();
  

  // define el puerto de comunicacion serial y espera que el mismo se abra
  Serial.begin(9600);
  while (!Serial);

  // comienza la conexion Ehernet:
 if (Ethernet.begin(mac) == 0) {
    Serial.println("Error configurando Ethernet usando DHCP");
    Ethernet.begin(mac, ip); 
 } else {
    Serial.println("Conectado");
 }


}


void loop() {
  // put your main code here, to run repeatedly:
  lastUrgentButtonState    = urgentButtonState;      // save the last state
  urgentButtonState = digitalRead(urgentButtonPin);
  lastNormalButtonState    = normalButtonState; 
  normalButtonState = digitalRead(normalButtonPin);

  if(lastUrgentButtonState == HIGH && urgentButtonState == LOW){
    urgentCall();
  }

  if(lastNormalButtonState == HIGH && normalButtonState == LOW){
    normalCall();
  }

  if(urgentState){
    analogWrite(pinBuzzer, 100);
  } else {
    
  }

  if(normalState){
    analogWrite(pinBuzzer, 150);
  }

}

void urgentCall(){
  if(cantPress){
    return;
  }

  urgentState = !urgentState;

  if(urgentState){
    type="urgente";
    uploadCall();

    lcd.setCursor(0,0);
    lcd.print("URGENTE! ");
    lcd.setCursor(0,1);
    lcd.print(areaName);
    lcd.print(" ");
    lcd.print(origin);

    time = millis();
    Serial.println(time);
  } else {
    cantPress = true;
    time = millis() - time;
    Serial.println(time);
    Serial.println(millis());
    
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Atendido! ");
    lcd.setCursor(0,1);
    lcd.print("Tiempo: ");
    lcd.print(time/1000);
    lcd.print(" secs.");

    updateCall();

    delay(2500);
    lcd.clear();
    cantPress = false;
  }
}

void normalCall(){
  if(urgentState || cantPress){
    return;
  }

    normalState = !normalState;

  if(normalState){
    type="normal";
    uploadCall()

    lcd.setCursor(0,0);
    lcd.print("Alerta ! ");
    lcd.setCursor(0,1);
    lcd.print(areaName);
    lcd.print(" ");
    lcd.print(origin);


    time = millis();
    Serial.println(time);
  } else {
    cantPress = true;
    time = millis() - time;
    Serial.println(time);
    Serial.println(millis());
    
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Atendido! ");
    lcd.setCursor(0,1);
    lcd.print("Tiempo: ");
    lcd.print(time/1000);
    lcd.print(" secs.");
   
    updateCall();

    delay(2500);
    lcd.clear();
    cantPress = false;

  }
  }


void uploadCall(){
  if (client.connect(server, 80))
   {
     Serial.println("Upload Call.");
      client.print("GET CodigoAzul/Arduino/insertarLlamada.php?type=");
      client.print(type);
      client.print("&area=");
      client.print(area);
      client.print("&origin=");
      client.print(origin);
      client.println(" HTTP/1.0");
      client.println();
   }
   else 
   {
      Serial.println("connection failed");
   }
  
  id = readPage();

  if (client.connect(server, 80))
   {
     Serial.println("Getting name.");
      client.print("GET /Arduino/traerNombre.php?id=");
      client.print(area);
      client.println(" HTTP/1.0");
      client.println();
   }
   else 
   {
      Serial.println("connection failed");
   }

   areaName = readPage();

  Serial.println(id);
  Serial.println(areaName);
}

void updateCall(){
  if (client.connect(server, 80))
   {
      Serial.println("Update Call.");
      client.print("GET CodigoAzul/Arduino/actualizarLlamada.php?id=");
      client.print(id);
      client.print("&time=");
      client.print(time/1000);
      client.println(" HTTP/1.0");
      client.println();

      
   }
   else 
   {
      Serial.println("connection failed");
   }
  client.stop();
}


// void getLastId(){
//   if (client.connect(server, 80))
//    {
//       client.print("GET /Arduino/obtenerId.php");
//       client.println(" HTTP/1.0");
//       client.println();
//    }
//    else 
//    {
//       Serial.println("connection failed");
//    }
// }

String readPage(){
  //read the page, and capture & return everything between '<' and '>'

  stringPos = 0;
  memset( &inString, 0, 32 ); //clear inString memory

  while(true){

    if (client.available()) {
      char c = client.read();

      if (c == '|' ) { //'<' is our begining character
        startRead = true; //Ready to start reading the part 
      }else if(startRead){

        if(c != '>'){ //'>' is our ending character
          inString[stringPos] = c;
          stringPos ++;
        }else{
          //got what we need here! We can disconnect now
          startRead = false;
          client.stop();
          client.flush();
          Serial.println("disconnecting.");
          return inString;

        }

      }
    }

  }

}
