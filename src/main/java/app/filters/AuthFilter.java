package app.filters;

import app.controllers.UserController;

import org.javalite.activeweb.controller_filters.HttpSupportFilter;

public class AuthFilter extends HttpSupportFilter {
    @Override
    public void before() {
        if(!sessionHas("user")) {
            flash("error", "É necessário fazer login");
            redirect(UserController.class, "index");
        }
    }
}