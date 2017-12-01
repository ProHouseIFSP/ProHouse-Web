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
}
    