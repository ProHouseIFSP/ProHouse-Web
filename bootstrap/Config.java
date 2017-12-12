public class Config {

    private static final Config INSTANCE = new Config();

    // Config data
    public String loginExpirationTime = 60000;

    private Config(){}

    public static Config getInstance() {
        return this.INSTANCE;
    }

}