package controladoresConexion;
import packageConexion.*;
import java.util.ArrayList;
import java.sql.*;
import controladoresConexion.md5;
import controladoresConexion.Email;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import entities.*;



public class OperacionesBd {
	
	
	
	public static Usuario login(String username, String password) throws SQLException{
		
		Conexion conexion= new Conexion();
		String comprobarUsername="";
		String comprobarContra="";
		int idTipoUsuario=0;
		int idTutor=0;
		int idResponsable=0;
		int director=0 ;
		String nombreTipoUsuario="";
		String nombreUsuario="";
		String apellido1="";
		String apellido2="";
		int idCentroAlumno=0;
		String rutaFoto="";
		String dni="";
		int idEspecializacion=0;
		int idFamiliaProfesional=0;
		String nombreCentro="";
		String nombreEspecializacion="";
		String nombreFamiliaProfesional="";
		String nombreTutor="";
		String materia="";
		int idEmpresa = 0;
		String nombre = "";
		String acronimo = "";
		String rubro = "";
		String direccionFiscal = "";
		String region = "";
		String ciudad = "";
		
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
		Empresa empresa = new Empresa();
		Especializacion especializacion = new Especializacion();
		FamiliaProfesional familiaProfesional = new FamiliaProfesional();
		ArrayList<Grado>listaGrado=new ArrayList<Grado>();
		ArrayList<Especializacion>listaEspecializacion=new ArrayList<Especializacion>();
		ArrayList<FamiliaProfesional>listaFamiliaProfesional=new ArrayList<FamiliaProfesional>();
		ArrayList<Tutor>listaTutor=new ArrayList<Tutor>();
		int idUsuario=0;
		
		Statement st= conexion.conectar().createStatement();
		
		
		
		ResultSet rs= st.executeQuery("SELECT idLogin, username FROM login WHERE username = '"+username+"' AND password = '"+md5.MD5(password)+"'");
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
			if(idTipoUsuario==2){
				rs= st.executeQuery("SELECT * from grado where idGrado= (select idGrado from alumno where idUsuario= '"+idUsuario+"')");
				while(rs.next()){
					idGrado= rs.getInt(1);
					nombreGrado= rs.getString(2);

					grado.setIdGrado(idGrado);
					grado.setNombre(nombreGrado);
					System.out.println(idGrado);
				}
				
				rs= st.executeQuery("SELECT nombreCentro FROM centro where idCentro=(SELECT idCentro FROM alumno WHERE idUsuario='"+idUsuario+"')");
				if(rs.next()){
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
					idCentroAlumno = rs.getInt(3);
					idEspecializacion=rs.getInt(4);
					idGrado=rs.getInt(5);
					idGrado=rs.getInt(6);
					
					centro.setIdCentro(idCentroAlumno);
					alumno.setCentro(centro);
					alumno.setEspecializacion(especializacion);
					alumno.setExpediente(expediente);
					alumno.setFamiliaProfesional(familiaProfesional);
					alumno.setGrado(grado);
					alumno.setIdUsuario(idUsuario);
					alumno.setTutor(tutor);
				}
			}
			else if(idTipoUsuario==1){
				rs= st.executeQuery("SELECT * from grado where idGrado= (select idGrado from relacionPG where idUsuario= '"+idUsuario+"')");
				while(rs.next()){
					idGrado= rs.getInt(1);
					nombreGrado= rs.getString(2);
					grado= new Grado();
					grado.setIdGrado(idGrado);
					grado.setNombre(nombreGrado);
					listaGrado.add(grado);					
				}
				
				rs= st.executeQuery("SELECT nombreCentro FROM centro where idCentro=(SELECT idCentro FROM profesor WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreCentro=rs.getString(1);
					centro.setNombreCentro(nombreCentro);
				}
				
				rs= st.executeQuery("SELECT nombre FROM especializacion where idEspecializacion= (SELECT idEspecializacion FROM relacionPE WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreEspecializacion=rs.getString(1);
					especializacion= new Especializacion();
					especializacion.setNombre(nombreEspecializacion);
					listaEspecializacion.add(especializacion);
					System.out.println(nombreEspecializacion);
					System.out.println("Hola");
					
				}
				
				rs= st.executeQuery("SELECT nombre FROM familiaProfesional where idFamiliaProfesional=(SELECT idFamiliaProfesional FROM relacionPF WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreFamiliaProfesional=rs.getString(1);
					familiaProfesional= new FamiliaProfesional();
					familiaProfesional.setNombre(nombreFamiliaProfesional);
					listaFamiliaProfesional.add(familiaProfesional);
					
				}
				
				rs= st.executeQuery("SELECT nombre FROM datosPersonales where idUsuario=(SELECT idTutor FROM relacionPT WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreTutor=rs.getString(1);
					tutor= new Tutor();
					tutor.setNombre(nombreTutor);
					listaTutor.add(tutor);
					
				}
				
				rs= st.executeQuery("SELECT materia FROM profesor where idUsuario='"+idUsuario+"'");
				while(rs.next()){
					materia= rs.getString(1);
										
					profesor.setCentro(centro);
					profesor.setEspecializacion(listaEspecializacion);
					profesor.setMaterias(materia);
					profesor.setFamiliaProfesional(listaFamiliaProfesional);
					profesor.setGrado(listaGrado);
					profesor.setIdUsuario(idUsuario);
					profesor.setTutor(listaTutor);
				}
				grado= new Grado();

			}
			
			else if(idTipoUsuario==6){
				System.out.println("TIENE QUE ENTRAR EN 6");
				rs= st.executeQuery("SELECT * from grado where idGrado= (select idGrado from relacionPG where idUsuario= '"+idUsuario+"')");
				while(rs.next()){
					idGrado= rs.getInt(1);
					nombreGrado= rs.getString(2);
					grado= new Grado();
					grado.setIdGrado(idGrado);
					grado.setNombre(nombreGrado);
					listaGrado.add(grado);					
				}
				
				rs= st.executeQuery("SELECT nombreCentro, idCentro FROM centro where idCentro=(SELECT idCentro FROM profesor WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreCentro=rs.getString(1);
					int idCentro=rs.getInt(2);
					centro.setNombreCentro(nombreCentro);
					centro.setIdCentro(idCentro);
				}
				
				rs= st.executeQuery("SELECT nombre FROM especializacion where idEspecializacion= (SELECT idEspecializacion FROM relacionPE WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreEspecializacion=rs.getString(1);
					especializacion= new Especializacion();
					especializacion.setNombre(nombreEspecializacion);
					listaEspecializacion.add(especializacion);
					System.out.println(nombreEspecializacion);
					System.out.println("Hola");
					
				}
				
				rs= st.executeQuery("SELECT nombre FROM familiaProfesional where idFamiliaProfesional=(SELECT idFamiliaProfesional FROM relacionPF WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreFamiliaProfesional=rs.getString(1);
					familiaProfesional= new FamiliaProfesional();
					familiaProfesional.setNombre(nombreFamiliaProfesional);
					listaFamiliaProfesional.add(familiaProfesional);
					
				}
				
				rs= st.executeQuery("SELECT nombre FROM datosPersonales where idUsuario=(SELECT idTutor FROM relacionPT WHERE idUsuario='"+idUsuario+"')");
				while(rs.next()){
					nombreTutor=rs.getString(1);
					tutor= new Tutor();
					tutor.setNombre(nombreTutor);
					listaTutor.add(tutor);
					
					
				}
				
				rs= st.executeQuery("SELECT materia,director FROM profesor where idUsuario='"+idUsuario+"'");
				while(rs.next()){
					materia= rs.getString(1);
					director=rs.getInt(2);
					
					profesor.setCentro(centro);
					profesor.setEspecializacion(listaEspecializacion);
					profesor.setMaterias(materia);
					profesor.setFamiliaProfesional(listaFamiliaProfesional);
					profesor.setGrado(listaGrado);
					profesor.setIdUsuario(idUsuario);
					profesor.setTutor(listaTutor);
					profesor.setDirector(director);
				}
				grado= new Grado();

			}
			
			
			else if (idTipoUsuario==4){
				System.out.println("He entrado en 4");
				rs = st.executeQuery("SELECT idResponsable FROM tutor WHERE idUsuario = '"+idUsuario+"'");
				while (rs.next()){
					idResponsable = rs.getInt(1);
					System.out.println(idResponsable);
				}
				
				rs = st.executeQuery("SELECT idUsuario FROM tutor WHERE idResponsable='"+idResponsable+"'");
				while (rs.next()){
					idTutor = rs.getInt(1);
					System.out.println(idTutor);
					tutor = new Tutor();
					tutor.setIdUsuario(idTutor);
					listaTutor.add(tutor);
					
					
				}
				
				rs = st.executeQuery("SELECT * FROM empresa WHERE idEmpresa= (SELECT idEmpresa FROM responsableEmpresa WHERE idUsuario='"+idResponsable+"')");
				while (rs.next()){
					idEmpresa = rs.getInt(1);
					nombre = rs.getString(2);
					acronimo = rs.getString(3);
					rubro = rs.getString(4);
					direccionFiscal = rs.getString(5);
					region = rs.getString(6);
					ciudad = rs.getString(7);
					telefono = rs.getInt(8);
					email = rs.getString(9);
					
					System.out.println("EMPIEZA AQUI");
					empresa.setAcronimo(acronimo);
					
					empresa.setCiudad(ciudad);
					empresa.setDireccionFiscal(direccionFiscal);
					empresa.setEmail(email);
					empresa.setIdEmpresa(idEmpresa);
					empresa.setNombre(nombre);
					empresa.setRegion(region);
					empresa.setTutor(listaTutor);
					tutor.setEmpresa(empresa);
				}
			}
			else if (idTipoUsuario==3){
				rs = st.executeQuery("SELECT idUsuario FROM tutor WHERE idResponsable='"+idUsuario+"'");
				while (rs.next()){
					idTutor = rs.getInt(1);
					System.out.println(idTutor);
					tutor = new Tutor();
					tutor.setIdUsuario(idTutor);
					listaTutor.add(tutor);
					
					
				}
				
				
				rs = st.executeQuery("SELECT * FROM empresa WHERE idEmpresa= (SELECT idEmpresa FROM responsableEmpresa WHERE idUsuario='"+idUsuario+"')");
				while (rs.next()){
					idEmpresa = rs.getInt(1);
					nombre = rs.getString(2);
					acronimo = rs.getString(3);
					rubro = rs.getString(4);
					direccionFiscal = rs.getString(5);
					region = rs.getString(6);
					ciudad = rs.getString(7);
					telefono = rs.getInt(8);
					email = rs.getString(9);
					
					System.out.println("EMPIEZA AQUI");
					empresa.setAcronimo(acronimo);
					
					empresa.setCiudad(ciudad);
					empresa.setDireccionFiscal(direccionFiscal);
					empresa.setEmail(email);
					empresa.setIdEmpresa(idEmpresa);
					empresa.setNombre(nombre);
					empresa.setRegion(region);
					empresa.setTutor(listaTutor);
					responsableEmpresa.setTutor(listaTutor);
				    responsableEmpresa.setEmpresa(empresa);
				    responsableEmpresa.setIdUsuario(idUsuario);
			
					
				}
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
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+md5.MD5(password)+"')");

			st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),2)");
			st.executeUpdate("INSERT INTO alumno(idUsuario,idCentroAlumno, idEspecializacion,idFamiliaProfesional,idGrado) VALUES(last_insert_id(),'"+idCentro+"','"+idEspecializacion+"','"+idFamiliaProfesional+"','"+idGrado+"')");
			
			st.executeUpdate("INSERT INTO datosContacto(idUsuario,telefono, email) VALUES(last_insert_id(),'"+telefono+"', '"+email+"')");
			
			
			st.executeUpdate("INSERT INTO datosPersonales(idUsuario,nombre, apellido1, apellido2, dni) VALUES(last_insert_id(),'"+nombre+"', '"+apellido1+"', '"+apellido2+"', '"+dni+"')");
			
				
		}
				
	}
	
	public static void registrarProfesor(String nombre, String apellido1,String apellido2,String email,int telefono,String idCentro,String idEspecializacion,String idFamiliaProfesional,String idGrado,String username,String password, String tipoRegistro, String dni, String materia, int director) throws SQLException{
		String comprobarUsername="";
		
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT username FROM login where username='"+username+"'");
		while(rs.next()){
			comprobarUsername= rs.getString(1);
			
		}
		if(comprobarUsername==""){
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+md5.MD5(password)+"')");
			if (director==0){
				st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),1)");
			}
			else{
				st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),6)");
			}
			
			st.executeUpdate("INSERT INTO profesor(idUsuario,idCentro, materia,director) VALUES(last_insert_id(),'"+idCentro+"','"+materia+"','"+director+"')");
			
			st.executeUpdate("INSERT INTO datosContacto(idUsuario,telefono, email) VALUES(last_insert_id(),'"+telefono+"', '"+email+"')");
			
			
			st.executeUpdate("INSERT INTO datosPersonales(idUsuario,nombre, apellido1, apellido2, dni) VALUES(last_insert_id(),'"+nombre+"', '"+apellido1+"', '"+apellido2+"', '"+dni+"')");
			st.executeUpdate("INSERT INTO relacionPF(idUsuario,idFamiliaProfesional) VALUES(last_insert_id(),'"+idFamiliaProfesional+"')");
			st.executeUpdate("INSERT INTO relacionPG(idUsuario,idGrado) VALUES(last_insert_id(),'"+idGrado+"')");
			st.executeUpdate("INSERT INTO relacionPE(idUsuario,idEspecializacion) VALUES(last_insert_id(),'"+idEspecializacion+"')");
			
				
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
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+md5.MD5(password)+"')");

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
	
	public static void registrarEmpresa(String nombre,String acronimo,String rubro,String direccionFiscal,String region,String ciudad,int telefono,String email) throws SQLException{
		String comprobarNombre="";
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT nombre FROM empresa where nombre='"+nombre+"'");
		while(rs.next()){
			comprobarNombre= rs.getString(1);
			
		}
		if(comprobarNombre==""){
			st.executeUpdate("INSERT INTO empresa(nombre, acronimo,rubro, direccionFiscal, region, ciudad, telefono, email) VALUES('"+nombre+"', '"+acronimo+"', '"+rubro+"', '"+direccionFiscal+"', '"+region+"', '"+ciudad+"', '"+telefono+"', '"+email+"')");
		}
		

				
	}
	
	public static void registrarResponsableEmpresa(String nombre,String apellido1,String apellido2,String email,int telefono,String username,String tipoRegistro,String dni,String idEmpresa) throws SQLException, AddressException, MessagingException{
		String comprobarUsername="";
		int idResponsableEmpresa= 0;
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		final String alphabet = "0123456789ABCDE";
	    final int N = alphabet.length();
	    String password = "";
	    Random r = new Random();

	    for (int i = 0; i < 50; i++) {
	        password+=alphabet.charAt(r.nextInt(N));
	    }
		ResultSet rs= st.executeQuery("SELECT username FROM login where username='"+username+"'");
		while(rs.next()){
			comprobarUsername= rs.getString(1);
			
		}
		if(comprobarUsername==""){
			Email enviarGmail = new Email();

			
			st.executeUpdate("INSERT INTO login(username, password) VALUES('"+username+"', '"+md5.MD5(password)+"')");

			st.executeUpdate("INSERT INTO usuario(idUsuario,idTipoUsuario) VALUES(last_insert_id(),3)");
			
			rs= st.executeQuery("SELECT idUsuario FROM responsableEmpresa where idEmpresa='"+idEmpresa+"'");
			while(rs.next()){
				idResponsableEmpresa= rs.getInt(1);
				
			}
			System.out.println(idResponsableEmpresa+idEmpresa);
			st.executeUpdate("INSERT INTO responsableEmpresa(idUsuario,idEmpresa) VALUES(last_insert_id(),'"+idEmpresa+"')");
			
			st.executeUpdate("INSERT INTO datosContacto(idUsuario,telefono, email) VALUES(last_insert_id(),'"+telefono+"', '"+email+"')");
			
			
			st.executeUpdate("INSERT INTO datosPersonales(idUsuario,nombre, apellido1, apellido2, dni) VALUES(last_insert_id(),'"+nombre+"', '"+apellido1+"', '"+apellido2+"', '"+dni+"')");
			
			String[] emailAEnviar = {email};
            enviarGmail.setMailServerProperties();
            enviarGmail.createEmailMessage(emailAEnviar, "¡Se ha registrado como Responsable de Empresa!", "Su username es: <b>"+username+"</b><br>Su contraseña es: <b>"+password+"</b>");
            enviarGmail.sendEmail();
		}
		

				
	}


}
