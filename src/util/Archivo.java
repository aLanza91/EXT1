package util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import beans.Persona;


public class Archivo {
	private File archivo;
	
	
	public Archivo (ServletContext contexto) throws FileNotFoundException, IOException{
		this.archivo = new File(contexto.getRealPath("/WEB-INF/datosper.dat"));
		if (archivo.length()==0){
			ArrayList <Persona> listaPersonas = new ArrayList<Persona>();
			grabaListaPersonas(listaPersonas);
		}
		
	}
	
    public void grabaListaPersonas(ArrayList<Persona> personas) throws FileNotFoundException, IOException {
        ObjectOutputStream oos = null;
        if (archivo.exists()) {
            if (archivo.canWrite()) {
                oos = new ObjectOutputStream(new FileOutputStream(archivo));
                oos.writeObject(personas);
            } else {
            	throw new IOException();
            }
        } else {
        	throw new FileNotFoundException();
        }
        if (oos != null) {
            oos.close();
        }
    }
    
    public ArrayList<Persona> leeListaPersonas() throws ClassNotFoundException, FileNotFoundException, IOException {
        ArrayList<Persona> personas = new ArrayList<Persona>();
        ObjectInputStream ois = null;
        if (archivo.exists()) {
            if (archivo.canRead()) {
                ois = new ObjectInputStream(new FileInputStream(archivo));
                personas = (ArrayList<Persona>) ois.readObject();
            } else {
            	throw new IOException();
            }
        } else {
        	throw new FileNotFoundException();
        }
        if (ois != null) {
            ois.close();
        }
        return personas;
    }

}
