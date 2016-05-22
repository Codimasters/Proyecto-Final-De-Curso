package entities;
// Generated 18-may-2016 15:38:58 by Hibernate Tools 4.3.1.Final

/**
 * DatosPersonales generated by hbm2java
 */
public class DatosPersonales implements java.io.Serializable {

	private int idUsuario;
	private Usuario usuario;
	private String nombre;
	private String apellido1;
	private String apellido2;
	private String rutaFoto;
	private String dni;

	public DatosPersonales() {
	}

	public DatosPersonales(Usuario usuario, String nombre, String apellido1, String apellido2, String dni) {
		this.usuario = usuario;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.dni = dni;
	}

	public DatosPersonales(Usuario usuario, String nombre, String apellido1, String apellido2, String rutaFoto,
			String dni) {
		this.usuario = usuario;
		this.nombre = nombre;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.rutaFoto = rutaFoto;
		this.dni = dni;
	}

	public int getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido1() {
		return this.apellido1;
	}

	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}

	public String getApellido2() {
		return this.apellido2;
	}

	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}

	public String getRutaFoto() {
		return this.rutaFoto;
	}

	public void setRutaFoto(String rutaFoto) {
		this.rutaFoto = rutaFoto;
	}

	public String getDni() {
		return this.dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

}
