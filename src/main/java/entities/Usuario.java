package entities;
// Generated 18-may-2016 15:38:58 by Hibernate Tools 4.3.1.Final

import java.util.ArrayList;
import entities.Grado.*;
import entities.Usuario.*;

import entities.FamiliaProfesional.*;

/**
 * Usuario generated by hbm2java
 */
public class Usuario implements java.io.Serializable {

	private Integer idUsuario;
	private Login login;
	private TipoUsuario tipoUsuario;
	private ResponsableEmpresa responsableEmpresa;
	private Grado grado;
	private Profesor profesor;
	private DatosPersonales datosPersonales;
	private Alumno alumno;
	private DatosContacto datosContacto;
	private Tutor tutor;

	public Usuario() {
	}

	public Usuario(Login login, TipoUsuario tipoUsuario) {
		this.login = login;
		this.tipoUsuario = tipoUsuario;
	
	}

	public Usuario(Login login, TipoUsuario tipoUsuario,
			ResponsableEmpresa responsableEmpresa, Grado grado, Profesor profesor,
			DatosPersonales datosPersonales, Alumno alumno, DatosContacto datosContacto,
		    Tutor tutor) {
		this.login = login;
		this.tipoUsuario = tipoUsuario;
		this.responsableEmpresa = responsableEmpresa;
		this.grado = grado;
		this.profesor = profesor;
		this.datosPersonales = datosPersonales;
		this.alumno = alumno;
		this.datosContacto = datosContacto;
		this.tutor = tutor;
	}

	public Integer getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Login getLogin() {
		return this.login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public TipoUsuario getTipoUsuario() {
		return this.tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}


	
	public ResponsableEmpresa getResponsableEmpresa() {
		return this.responsableEmpresa;
	}

	public void setResponsableEmpresa(ResponsableEmpresa responsableEmpresa) {
		this.responsableEmpresa = responsableEmpresa;
	}

	public Grado getGrados() {
		return this.grado;
	}

	public void setGrados(Grado grado) {
		this.grado = grado;
	}

	public Profesor getProfesor() {
		return this.profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

	public DatosPersonales getDatosPersonales() {
		return this.datosPersonales;
	}

	public void setDatosPersonales(DatosPersonales datosPersonales) {
		this.datosPersonales = datosPersonales;
	}

	public Alumno getAlumno() {
		return this.alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	public DatosContacto getDatosContacto() {
		return this.datosContacto;
	}

	public void setDatosContacto(DatosContacto datosContacto) {
		this.datosContacto = datosContacto;
	}


	public Tutor getTutor() {
		return this.tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}

}
