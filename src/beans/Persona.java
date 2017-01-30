package beans;

import java.io.Serializable;

public class Persona implements Serializable,Comparable<Persona>{
	private String nombre;
	private String apellidos;
	private String email;
	private int edad;
	
	public Persona(){
		this.nombre="";
		this.apellidos="";
		this.email="";
		this.edad=0;
	}
	public Persona(String nombre, String apellidos, String email, int edad){
		this.nombre=nombre;
		this.apellidos=apellidos;
		this.email=email;
		this.edad=edad;
	}
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}
	
    public int compareTo(Persona o) {
        int resultado=0;
        if (this.edad<o.edad) {  
        	resultado = -1;      
        }else if (this.edad>o.edad) {  
        		resultado = 1;     
       
        }
        return resultado;
    }
}
