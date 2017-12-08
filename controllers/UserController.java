package app.controllers;

public class UserController extends AppController {

    @POST
    public login() {      
        if(blank("username", "password")){
            flash("message", "Preencha os campos de usuário e senha");
            redirect();
        }

        if (BlowFish.test(password, (String) user.get(password))){
            String username = param("username");
            String password = param("password");
            User user = User.findFirst("username = ?", username);
            
            if(user != null) {
                session("userLogged", user);
                redirect(DeviceController.class);
            }
        }

        flash("message","Usuário e/ou senha incorretos");
        redirect();
    }

    @GET
    public void getQRCode() {
	Config config = Config.getInstance();

        long timeToDelete = System.currentTimeInMillis() + config.LoginExpirationTime;
        String filename = String.valueOftimeToDelete + ".png";
    	
        new QRCodeGenerator().generate(filename, "login");
        session("QRCode", timeToDelete);
    }

    @POST
    public void login() {
        if(session("QRCode") < System.currentTimeInMillis()) {
            flash("error", "O tempo de login expirou, tente novamente");
	    this.getQRCode();
        } else {
           String login = param("QRCode");
	   User user = User.where("username = ?", param("user")).first();

	   if (login.equals(session("QRCode"))){
	   	session("user", user);
	   } else {
	   	flash("error", "Não foi possível fazer o login, tente novamente");
	   }
        }
    }

}
    
