package app.bootstrap;

public class Config {

    private static final Config INSTANCE = new Config();

    // Config data
    public long loginExpirationTime = 60000;

    private Config(){}

    public static Config getInstance() {
        return INSTANCE;
    }

}