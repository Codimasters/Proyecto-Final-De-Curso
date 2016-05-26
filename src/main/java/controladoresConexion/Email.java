package controladoresConexion;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

        Properties emailProperties;
        Session mailSession;
        MimeMessage message;

        public static void main(String args[]) throws AddressException,
                        MessagingException {
        	
        		 Email javaEmail = new Email();

                 javaEmail.setMailServerProperties();
                 javaEmail.createEmailMessage();
                 javaEmail.sendEmail();
               
        	//}
        }

        public void setMailServerProperties() {

                // gmail's smtp port
                String emailPort = "587";
                
                emailProperties = System.getProperties();
                emailProperties.put("mail.smtp.port", emailPort);
                emailProperties.put("mail.smtp.auth", "true");
                emailProperties.put("mail.smtp.starttls.enable", "true");

        }

        public void createEmailMessage() throws AddressException,
                        MessagingException {
        	    //String[] toEmails = {"mohamed1bf@gmail.com"};
                String[] toEmails = {"Jlgg92@gmail.com"};
                String emailSubject = "Dionisio te ha enviado un archivo";
                String emailBody = "";

                mailSession = Session.getDefaultInstance(emailProperties, null);
                message = new MimeMessage(mailSession);
                
                for (int i = 0; i < toEmails.length; i++) {
                	System.out.println("Enviando a "+toEmails[i]+"...");
                	
                	String nombre = toEmails[i].split("@")[0];
                	emailBody = "Aqui teneis la nueva tabla de correcciones de los proyectos. <i>Muchísima suerte a todos.</i><br>-Dionisio <a href='http://"+nombre+".esgay.com/'>cursos.iesleopoldoqueipo.com/</a>";
                	message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
                }

                message.setSubject(emailSubject);
                // for a html email
                message.setContent(emailBody, "text/html");
                // emailMessage.setText(emailBody);// for a text email

        }

        public void sendEmail() throws AddressException, MessagingException {
                String emailHost = "smtp.gmail.com";

                // just the id alone without @ gmail.com
                String senderUsername = "codimastersempresa";
                String senderEmailPassword = "Proyecto";

                Transport transport = mailSession.getTransport("smtp");
                transport.connect(emailHost, senderUsername, senderEmailPassword);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                System.out.println("Email mandado correctamente.");
        }

}