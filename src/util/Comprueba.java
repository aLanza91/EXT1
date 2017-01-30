package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import beans.Persona;

public class Comprueba {

	public static boolean compruebaString (String palabra){
		boolean correcto = true;
		if(palabra==null){
			correcto = false;
		}
		
		if(palabra!=null){
			if(palabra.equals("")){
				correcto = false;
			}
		}
		return correcto;
	}
	public static boolean compruebaMayorDeEdad(int edad){
		boolean res = true;
			if(edad<18){
				res = false;
			}
		return res;
	}
	public static boolean compruebaFormatoEmail(String email){
		
		boolean valido = true;
		if (email.indexOf("@")>0 ){
			valido = false;
		}
		
		return valido;
	}
	public static boolean compruebaEmailRepetido(String email, Archivo archivo) throws ClassNotFoundException, FileNotFoundException, IOException{
		
		boolean valido = false;
		
		ArrayList<Persona> listaPersonas = new ArrayList<Persona>();
		listaPersonas = archivo.leeListaPersonas();
			
			if (listaPersonas.isEmpty()){
				valido = false;
			}else{
				for(Persona p:listaPersonas){
					if (p.getEmail().equals(email)){
						valido = true;
					}
				}
			}
			return valido;
	}
	
}
