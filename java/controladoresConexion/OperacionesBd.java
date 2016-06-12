package controladoresConexion;
import packageConexion.*;
import java.util.ArrayList;
import java.sql.*;
import java.util.HashSet;

import entities.*;



public class OperacionesBd {
	
	
	
	public static Usuario login(String username, String password) throws SQLException{
		Conexion conexion= new Conexion();
		String comprobarUsername="";
		String comprobarContra="";
		int idTipoUsuario=0;
		String nombreTipoUsuario="";
		String nombreUsuario="";
		String apellido1="";
		String apellido2="";
		String idCentroAlumno="";
		String rutaFoto="";
		String dni="";
		int idEspecializacion=0;
		int idFamiliaProfesional=0;
		String nombreCentro="";
		String nombreEspecializacion="";
		String nombreFamiliaProfesional="";
		
		int idGrado=0;
		String nombreGrado="";
		int telefono=0;
		String email="";
		int expediente=0;
		Usuario usuario= new Usuario();
		TipoUsuario tipoUsuario=new TipoUsuario();
		DatosPersonales datosPersonales= new DatosPersonales();
		DatosContacto datosContacto= new DatosContacto();
		ResponsableEmpresa responsableEmpresa= new ResponsableEmpresa();
		Grado grado= new Grado();
		Profesor profesor= new Profesor();
		Alumno alumno= new Alumno();
		Tutor tutor= new Tutor();
		Centro centro = new Centro();
		Especializacion especializacion = new Especializacion();
		FamiliaProfesional familiaProfesional = new FamiliaProfesional();
		int idUsuario=0;
		
		Statement st= conexion.conectar().createStatement();
		
		
		
		ResultSet rs= st.executeQuery("SELECT idLogin, username FROM login WHERE username = '"+username+"' AND password = '"+password+"'");
		while(rs.next()){
			idUsuario= rs.getInt(1);
			comprobarUsername= rs.getString(2);
		}
		
		if(idUsuario!=0){
			Login login= new Login(username,password);
			login.setIdLogin(idUsuario);
			
			
			rs= st.executeQuery("SELECT * from tipoUsuario where idTipoUsuario= (select idTipoUsuario from usuario where idUsuario= '"+idUsuario+"')");
			while(rs.next()){
				idTipoUsuario= rs.getInt(1);
				nombreTipoUsuario= rs.getString(2);
				tipoUsuario.setNombre(nombreTipoUsuario);
				tipoUsuario.setIdTipoUsuario(idTipoUsuario);
				
			}
			
			rs= st.executeQuery("SELECT * from datosPersonales where idUsuario= '"+idUsuario+"'");
			while(rs.next()){
				nombreUsuario= rs.getString(2);
				apellido1= rs.getString(3);
				apellido2= rs.getString(4);
				rutaFoto=rs.getString(5);
				dni=rs.getString(6);

				datosPersonales.setNombre(nombreUsuario);
				datosPersonales.setApellido1(apellido1);
				datosPersonales.setApellido2(apellido2);
				datosPersonales.setRutaFoto(rutaFoto);
				datosPersonales.setDni(dni);
				
				
			}
			
			rs= st.executeQuery("SELECT * from datosContacto where idUsuario='"+idUsuario+"'");
			while(rs.next()){
			
				telefono= rs.getInt(2);
				email= rs.getString(3);
				datosContacto.setIdUsuario(idUsuario);

				datosContacto.setTelefono(telefono);
				datosContacto.setEmail(email);
				
			}
			
			rs= st.executeQuery("SELECT * from grado where idGrado= (select idGrado from alumno where idUsuario= '"+idUsuario+"')");
			while(rs.next()){
				idGrado= rs.getInt(1);
				nombreGrado= rs.getString(2);

				grado.setIdGrado(idGrado);
				grado.setNombre(nombreGrado);
				System.out.println(idGrado);
			}
			
			rs= st.executeQuery("SELECT nombreCentro FROM centro where idCentro=(SELECT idCentro FROM alumno WHERE idUsuario='"+idUsuario+"')");
			while(rs.next()){
				nombreCentro=rs.getString(1);
				centro.setNombreCentro(nombreCentro);
			}
			
			rs= st.executeQuery("SELECT nombre FROM especializacion where idEspecializacion=(SELECT idEspecializacion FROM alumno WHERE idUsuario='"+idUsuario+"')");
			while(rs.next()){
				nombreEspecializacion=rs.getString(1);
				especializacion.setNombre(nombreEspecializacion);
				System.out.println(nombreEspecializacion);
				
			}
			
			rs= st.executeQuery("SELECT nombre FROM familiaProfesional where idFamiliaProfesional=(SELECT idFamiliaProfesional FROM alumno WHERE idUsuario='"+idUsuario+"')");
			while(rs.next()){
				nombreFamiliaProfesional=rs.getString(1);
				familiaProfesional.setNombre(nombreFamiliaProfesional);
				
			}
			
			rs= st.executeQuery("SELECT * FROM alumno where idUsuario='"+idUsuario+"'");
			while(rs.next()){
				expediente= rs.getInt(2);
				idCentroAlumno = rs.getString(3);
				idEspecializacion=rs.getInt(4);
				idGrado=rs.getInt(5);
				idGrado=rs.getInt(6);
				
				alumno.setCentro(centro);
				alumno.setEspecializacion(especializacion);
				alumno.setExpediente(expediente);
				alumno.setFamiliaProfesional(familiaProfesional);
				alumno.setGrado(grado);
				alumno.setIdUsuario(idUsuario);
				alumno.setTutor(tutor);
			}
			
			usuario.setAlumno(alumno);
			usuario.setDatosContacto(datosContacto);
			usuario.setDatosPersonales(datosPersonales);
			usuario.setGrados(grado);
			usuario.setIdUsuario(idUsuario);
			usuario.setLogin(login);
			usuario.setProfesor(profesor);
			usuario.setResponsableEmpresa(responsableEmpresa);
			usuario.setTipoUsuario(tipoUsuario);
			usuario.setTutor(tutor);
			
			
			
		
		}
		return usuario;
	}
	
	
	public static void registrarAlumno(String nombre, String apellido1,String apellido2,String email,int telefono,String idCentro,String idEspecializacion,String idFamiliaProfesional,String idGrado,String username,String password, String tipoRegistro, String dni) throws SQLException{
		String comprobarUsername="";
		
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT username FROM login where username='"+username+"'");
		while(rs.next()){
			comprobarUsername= rs.getString(1);
			
		}
		if(comprobarUsername==""){
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+password+"')");

			st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),2)");
			st.executeUpdate("INSERT INTO alumno(idUsuario,idCentroAlumno, idEspecializacion,idFamiliaProfesional,idGrado) VALUES(last_insert_id(),'"+idCentro+"','"+idEspecializacion+"','"+idFamiliaProfesional+"','"+idGrado+"')");
			
			st.executeUpdate("INSERT INTO datosContacto(idUsuario,telefono, email) VALUES(last_insert_id(),'"+telefono+"', '"+email+"')");
			
			
			st.executeUpdate("INSERT INTO datosPersonales(idUsuario,nombre, apellido1, apellido2, dni) VALUES(last_insert_id(),'"+nombre+"', '"+apellido1+"', '"+apellido2+"', '"+dni+"')");
			
				
		}
				
	}
	
	public static void registrarProfesor(String nombre, String apellido1,String apellido2,String email,int telefono,String idCentro,String idEspecializacion,String idFamiliaProfesional,String idGrado,String username,String password, String tipoRegistro, String dni, String materia) throws SQLException{
		String comprobarUsername="";
		
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT username FROM login where username='"+username+"'");
		while(rs.next()){
			comprobarUsername= rs.getString(1);
			
		}
		if(comprobarUsername==""){
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+password+"')");

			st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),1)");
			st.executeUpdate("INSERT INTO profesor(idUsuario,idCentro, materia) VALUES(last_insert_id(),'"+idCentro+"','"+materia+"')");
			
			st.executeUpdate("INSERT INTO datosContacto(idUsuario,telefono, email) VALUES(last_insert_id(),'"+telefono+"', '"+email+"')");
			
			
			st.executeUpdate("INSERT INTO datosPersonales(idUsuario,nombre, apellido1, apellido2, dni) VALUES(last_insert_id(),'"+nombre+"', '"+apellido1+"', '"+apellido2+"', '"+dni+"')");
			
				
		}
				
	}
	
	public static void registrarTutor(String nombre,String apellido1,String apellido2,String email,int telefono,String username,String password,String tipoRegistro,String dni,String idEmpresa) throws SQLException{
		String comprobarUsername="";
		int idResponsableEmpresa= 0;
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT username FROM login where username='"+username+"'");
		while(rs.next()){
			comprobarUsername= rs.getString(1);
			
		}
		if(comprobarUsername==""){
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+password+"')");

			st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),4)");
			
			rs= st.executeQuery("SELECT idUsuario FROM responsableEmpresa where idEmpresa='"+idEmpresa+"'");
			while(rs.next()){
				idResponsableEmpresa= rs.getInt(1);
				
			}
			System.out.println(idResponsableEmpresa+idEmpresa);
			st.executeUpdate("INSERT INTO tutor(idUsuario,idEmpresa, idResponsable) VALUES(last_insert_id(),'"+idEmpresa+"','"+idResponsableEmpresa+"')");
			
			st.executeUpdate("INSERT INTO datosContacto(idUsuario,telefono, email) VALUES(last_insert_id(),'"+telefono+"', '"+email+"')");
			
			
			st.executeUpdate("INSERT INTO datosPersonales(idUsuario,nombre, apellido1, apellido2, dni) VALUES(last_insert_id(),'"+nombre+"', '"+apellido1+"', '"+apellido2+"', '"+dni+"')");
			
			
		}
		

				
	}

}
