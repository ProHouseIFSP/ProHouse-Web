package app.controllers;

import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.POST;

import app.bootstrap.Config;
import app.models.User;
import app.services.Password;
import app.services.QRCodeGenerator;

public class UserController extends AppController {

    public void index(){
        if(getId() != null){
            flash("pass", Password.hashPassword(getId()));
        }
    }

    @POST
    public void commonLogin() {      
        if(blank("username", "password")){
            flash("message", "Preencha os campos de usuário e senha");
            redirect(UserController.class, "index");
        }

        String username = param("username");
        String password = param("password");
        User user = User.findFirst("usuario = ?", username);

        if (user != null && Password.checkPassword(password, (String) user.get("senha"))){
            session("user", user);
            redirect(DeviceController.class, "index");
        } else {
            flash("message","Usuário e/ou senha incorretos");
            redirect(UserController.class, "index");
        }
    }

    public void getQRCode() {
	    Config config = Config.getInstance();

        long timeToDelete = System.currentTimeMillis() + config.loginExpirationTime;
        String filename = String.valueOf(timeToDelete) + ".png";
    	
        new QRCodeGenerator().generate(filename, "login");
        session("QRCode", timeToDelete);
    }

    @POST
    public void login() {
        if((long) session("QRCode") < System.currentTimeMillis()) {
            flash("error", "O tempo de login expirou, tente novamente");
	        this.getQRCode();
        } else {
            String login = param("QRCode");
	        User user = User.first("username = ?", param("user"));

	        if (login.equals(session("QRCode"))){
	   	        session("user", user);
	        } else {
	   	        flash("error", "Não foi possível fazer o login, tente novamente");
            }
        }
    }
}
