package entities;
// Generated 18-may-2016 15:38:58 by Hibernate Tools 4.3.1.Final

import java.util.ArrayList;
import entities.Usuario.*;
import entities.Alumno.*;
import entities.FamiliaProfesional.*;
import entities.Especializacion.*;

/**
 * Grado generated by hbm2java
 */
public class Grado implements java.io.Serializable {

	private Integer idGrado;
	private String nombre;
	private ArrayList<Usuario> usuario = new ArrayList<Usuario>();
	private ArrayList<Alumno> alumno = new ArrayList<Alumno>();
	private ArrayList<FamiliaProfesional> familiaProfesional = new ArrayList<FamiliaProfesional>();
	private ArrayList<Especializacion> especializacion = new ArrayList<Especializacion>();

	public Grado() {
	}

	public Grado(String nombre) {
		this.nombre = nombre;
	}

	public Grado(String nombre, ArrayList<Usuario> usuario, ArrayList<Alumno> alumno, ArrayList<FamiliaProfesional> familiaProfesional,
			ArrayList<Especializacion> especializacion) {
		this.nombre = nombre;
		this.usuario = usuario;
		this.alumno = alumno;
		this.familiaProfesional = familiaProfesional;
		this.especializacion = especializacion;
	}

	public Integer getIdGrado() {
		return this.idGrado;
	}

	public void setIdGrado(Integer idGrado) {
		this.idGrado = idGrado;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public ArrayList<Usuario> getUsuario() {
		return this.usuario;
	}

	public void setUsuario(ArrayList<Usuario> usuario) {
		this.usuario = usuario;
	}

	public ArrayList<Alumno> getAlumno() {
		return this.alumno;
	}

	public void setAlumno(ArrayList<Alumno> alumno) {
		this.alumno = alumno;
	}

	public ArrayList<FamiliaProfesional> getFamiliaProfesional() {
		return this.familiaProfesional;
	}

	public void setFamiliaProfesional(ArrayList<FamiliaProfesional> familiaProfesional) {
		this.familiaProfesional = familiaProfesional;
	}

	public ArrayList<Especializacion> getEspecializacion() {
		return this.especializacion;
	}

	public void setEspecializacion(ArrayList<Especializacion> especializacion) {
		this.especializacion = especializacion;
	}

}