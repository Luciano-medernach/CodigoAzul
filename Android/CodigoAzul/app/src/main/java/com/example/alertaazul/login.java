package com.example.alertaazul;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class login extends AppCompatActivity {

    EditText nombre, contraseña;

    String str_nombre,str_password;
    String url = "http://192.168.2.105/login_/login.php";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        nombre = findViewById(R.id.etnombre);
        contraseña = findViewById(R.id.etcontraseña);


    }

    public void Login(View view) {

        if(nombre.getText().toString().equals("")){
            Toast.makeText(this, "Ingresar Nombre de usuario", Toast.LENGTH_SHORT).show();
        }
        else if(contraseña.getText().toString().equals("")){
            Toast.makeText(this, "Ingresar Password", Toast.LENGTH_SHORT).show();
        }
        else{

            final ProgressDialog progressDialog = new ProgressDialog(this);
            progressDialog.setMessage("Por favor espera...");

            progressDialog.show();

            str_nombre = nombre.getText().toString().trim();
            str_password = contraseña.getText().toString().trim();


            StringRequest request = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    progressDialog.dismiss();

                    if(response.equalsIgnoreCase("ingreso correctamente")){

                        nombre.setText("");
                        contraseña.setText("");
                        startActivity(new Intent(getApplicationContext(),home.class));
                        Toast.makeText(login.this, response, Toast.LENGTH_SHORT).show();
                    }
                    else{
                        Toast.makeText(login.this, response, Toast.LENGTH_SHORT).show();
                    }

                }
            },new Response.ErrorListener(){

                @Override
                public void onErrorResponse(VolleyError error) {
                    progressDialog.dismiss();
                    Toast.makeText(login.this, "No se encontro conexion a internet", Toast.LENGTH_SHORT).show();
                }
            }

            ){
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {
                    Map<String,String> params = new HashMap<String, String>();
                    params.put("nombre",str_nombre);
                    params.put("password",str_password);
                    return params;

                }
            };

            RequestQueue requestQueue = Volley.newRequestQueue(login.this);
            requestQueue.add(request);




        }
    }



}