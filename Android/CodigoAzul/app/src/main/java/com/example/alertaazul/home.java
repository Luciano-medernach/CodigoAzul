package com.example.alertaazul;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.content.ContextCompat;

import com.loopj.android.http.*;

import android.Manifest;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.os.Bundle;

import android.os.Handler;
import android.provider.CallLog;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Magnifier;
import android.widget.RelativeLayout;

import org.json.JSONArray;

import java.util.ArrayList;
import java.util.Locale;

import cz.msebera.android.httpclient.Header;

public class home extends AppCompatActivity {

    private ListView emerImportanteNA;
    private ListView emerImportanteA;
    private ListView emerComunNA;
    private ListView emerComunA;
    private AsyncHttpClient cliente;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);


        emerComunNA = (ListView) findViewById(R.id.emerComunNA);
        emerImportanteNA = (ListView) findViewById(R.id.emerImportanteNA);
        emerImportanteA = (ListView) findViewById(R.id.emerImportanteA);
        emerComunA = (ListView) findViewById(R.id.emerComunA);
        cliente = new AsyncHttpClient();

        ArrayList<String> arrayList = new ArrayList<>();
        ArrayAdapter adapter = new ArrayAdapter<String>(getApplicationContext(),R.layout.llamadasnoatendidas, arrayList);


        emerImportanteNA.setAdapter(adapter);


                mostrarLlamadas();
                content();
    }
    private void mostrarLlamadas() {
        String url = "http://192.168.2.105/login_/obtenerLlamadas.php";
        cliente.post(url, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode == 200) {
                    listarLlamadas(new String(responseBody));
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {

            }
        });
    }

    private void listarLlamadas(String respuesta) {
        ArrayList<Calls> listaUNA = new ArrayList<Calls>();
        ArrayList<Calls> listaCNA = new ArrayList<Calls>();
        ArrayList<Calls> listaUA = new ArrayList<Calls>();
        ArrayList<Calls> listaCA = new ArrayList<Calls>();
        try {
            JSONArray jsonArreglo = new JSONArray(respuesta);
            int contUNA = 0;
            int contUA = 0;
            int contCNA = 0;
            int contCA = 0;

            for (int i = 0; i < jsonArreglo.length(); i++) {
                int id = jsonArreglo.getJSONObject(i).getInt("id");
                String type = jsonArreglo.getJSONObject(i).getString("type");
                String area = jsonArreglo.getJSONObject(i).getString("area");
                String origin = jsonArreglo.getJSONObject(i).getString("origin");
                String date = jsonArreglo.getJSONObject(i).getString("date");
                String hour = jsonArreglo.getJSONObject(i).getString("hour");
                String attended = jsonArreglo.getJSONObject(i).getString("attended");
                String time = jsonArreglo.getJSONObject(i).getString("time");
                if (attended.equals("0")){
                    attended = "NO ATENDIDA";
                }else{
                    attended = "ATENDIDA";
                }
                type = type.toString().toUpperCase();
                area = area.toString().toUpperCase();
                origin = origin.toString().toUpperCase();

                Calls c = new Calls(id, type, area, origin, date,hour, attended, time);


                LinearLayout.LayoutParams paramsCNA = (LinearLayout.LayoutParams) emerComunNA.getLayoutParams();
                LinearLayout.LayoutParams paramsCA = (LinearLayout.LayoutParams) emerComunA.getLayoutParams();
                LinearLayout.LayoutParams paramsUNA = (LinearLayout.LayoutParams) emerImportanteNA.getLayoutParams();
                LinearLayout.LayoutParams paramsUA = (LinearLayout.LayoutParams) emerImportanteA.getLayoutParams();

                if(c.getType().equals("URGENTE")){
                    if (c.getAttended().equals("NO ATENDIDA")){
                        contUNA++;

                        listaUNA.add(c);
                    }else{
                        contUA++;

                        listaUA.add(c);
                    }
                }else {
                    if (c.getAttended().equals("NO ATENDIDA")) {
                        contCNA++;

                        listaCNA.add(c);
                    } else {
                        contCA++;

                        listaCA.add(c);
                    }
                }

                /*
                paramsUA.height = 160 * contUA;
                paramsUA.bottomMargin = 0;
                paramsCNA.height = 160 * contCNA;
                paramsCNA.bottomMargin = 0;
                paramsCA.height = 160 * contCA;
                paramsCA.bottomMargin = 0;
                paramsUNA.height = 160 * contUNA;
                paramsUNA.bottomMargin = 0;
                                 */

                emerImportanteNA.setLayoutParams(paramsUNA);
                emerComunNA.setLayoutParams(paramsCNA);
                emerImportanteA.setLayoutParams(paramsUA);
                emerComunA.setLayoutParams(paramsCA);

            }

            ArrayAdapter<Calls> lUNA = new ArrayAdapter(this, android.R.layout.simple_list_item_1, listaUNA);
            ArrayAdapter<Calls> lCNA = new ArrayAdapter(this, android.R.layout.simple_list_item_1, listaCNA);
            ArrayAdapter<Calls> lUA = new ArrayAdapter(this, android.R.layout.simple_list_item_1, listaUA);
            ArrayAdapter<Calls> lCA = new ArrayAdapter(this, android.R.layout.simple_list_item_1, listaCA);
            emerImportanteNA.setAdapter(lUNA);
            emerComunNA.setAdapter(lCNA);
            emerImportanteA.setAdapter(lUA);
            emerComunA.setAdapter(lCA);

        } catch (Exception e1) {
            e1.printStackTrace();
        }
    }

    private void content(){
        mostrarLlamadas();
        refresh(1000);
    }
    private void refresh(int millisecons){
        final Handler handler = new Handler();

        final Runnable runnable = new Runnable() {
            @Override
            public void run() {
            content();
            }
        };
        handler.postDelayed(runnable,millisecons);
    }

}
