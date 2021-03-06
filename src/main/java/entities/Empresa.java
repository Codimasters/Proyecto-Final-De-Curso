package entities;
// Generated 18-may-2016 15:38:58 by Hibernate Tools 4.3.1.Final

import java.util.ArrayList;
import entities.ResponsableEmpresa.*;
import entities.Tutor.*;

/**
 * Empresa generated by hbm2java
 */
public class Empresa implements java.io.Serializable {

	private int idEmpresa;
	private String nombre;
	private String acronimo;
	private String rubro;
	private String direccionFiscal;
	private String region;
	private String ciudad;
	private Integer telefono;
	private String email;
	private ArrayList<ResponsableEmpresa> responsableEmpresa = new ArrayList<ResponsableEmpresa>();
	private ArrayList<Tutor> tutor = new ArrayList<Tutor>();

	public Empresa() {
	}

	public Empresa(int idEmpresa, String nombre, String acronimo, String rubro, String direccionFiscal, String region,
			String ciudad, Integer telefono, String email,
			ArrayList<Tutor> tutor) {
		this.idEmpresa = idEmpresa;
		this.nombre = nombre;
		this.acronimo = acronimo;
		this.rubro = rubro;
		this.direccionFiscal = direccionFiscal;
		this.region = region;
		this.ciudad = ciudad;
		this.telefono = telefono;
		this.email = email;
		this.tutor = tutor;
	}

	public Empresa(int idEmpresa, String nombre, String acronimo, String rubro, String direccionFiscal, String region,
			String ciudad, Integer telefono, String email, ArrayList<ResponsableEmpresa> responsableEmpresa,
			ArrayList<Tutor> tutor) {
		this.idEmpresa = idEmpresa;
		this.nombre = nombre;
		this.acronimo = acronimo;
		this.rubro = rubro;
		this.direccionFiscal = direccionFiscal;
		this.region = region;
		this.ciudad = ciudad;
		this.telefono = telefono;
		this.email = email;
		this.responsableEmpresa = responsableEmpresa;
		this.tutor = tutor;
	}

	public int getIdEmpresa() {
		return this.idEmpresa;
	}

	public void setIdEmpresa(int idEmpresa) {
		this.idEmpresa = idEmpresa;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAcronimo() {
		return this.acronimo;
	}

	public void setAcronimo(String acronimo) {
		this.acronimo = acronimo;
	}

	public String getRubro() {
		return this.rubro;
	}

	public void setRubro(String rubro) {
		this.rubro = rubro;
	}

	public String getDireccionFiscal() {
		return this.direccionFiscal;
	}

	public void setDireccionFiscal(String direccionFiscal) {
		this.direccionFiscal = direccionFiscal;
	}

	public String getRegion() {
		return this.region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCiudad() {
		return this.ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public Integer getTelefono() {
		return this.telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ArrayList<ResponsableEmpresa> getResponsableEmpresa() {
		return this.responsableEmpresa;
	}

	public void setResponsableEmpresa(ArrayList<ResponsableEmpresa> responsableEmpresa) {
		this.responsableEmpresa = responsableEmpresa;
	}

	public ArrayList<Tutor> getTutor() {
		return this.tutor;
	}

	public void setTutor(ArrayList<Tutor> tutor) {
		this.tutor = tutor;
	}

}
