package app.controllers.device;

/* import google GSON*/

/**
 * @author Vitor "Pliavi" Silverio
 */
public class DevicesController extends AppController {

    @GET 
    public void index() {
        view("devices", Device.findAll());
    }

    @GET
    public void create() { /* it's empty just to create the route to view */ }

    @POST
    public void save() {
        Device.createIt(
            "name", param("name"),
            "type", param("type"),
            "on"  , false
        );
    }

    @GET 
    public void edit() {
        view("device", Device.findById(param("id")));
    }

    @POST 
    public void update() {
        Device device = Device.findById(param("id"));

        params().forEach((key, value) -> device.set(key, value));
        device.saveIt();
    }

    @GET 
    public void delete() {
        Device.findById(param("id")).delete();
    }

    @GET 
    public void on()  { 
        this.switchState(param("id") ,true);
    }

    @GET 
    public void off() { 
        this.switchState(param("id") ,false);
    }

    /**
     * Receive the cron times to be set on unique device
     * @param crons The time to set a cron to swtich on the device
     */
    @GET
    public void setTimes() {
        List<DeviceCron> crons = DeviceCron.where("device_id = ?", param("deviceId"));
        List<String> cronsAssigned = params("crons");
        int existingCronsCount = crons.size();

        for(int i = 0; i < cronsAssigned.size(); i++) {
            if(i <= existingCronsCount) { 
                // Update existing ones
                DeviceCron cron = crons.get(i);

                cron.set("time", cronsAssigned.get(i));
                crons.set(i, cron);
            } else { 
                // Create new ones
                DeviceCron cron = new DeviceCron();

                cron.set("time", cronsAssigned.get(i));
                crons.add(cron);
            }

            crons.get(i).saveIt();
        }

        device.set("time", param(time));
    }

    /**
     * Verify if there is any device to be switched on
     * 
     * @return a list of devices to be switched on
     */
    @GET
    public void verifyTime() {
        User user = (User) session("loggedUser");
        List<Device> userDevices = user.getAll(Device.class);
        List<Integer> devices2SwitchOn = new ArrayList<>();

        Calendar calendar = Calendar.getInstance();
        int currentMillis = calendar.get(Calendar.MILLISECOND);
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        
        for (Device device : userDevices) {
            List<DeviceCron> deviceCrons = device.getAll(DeviceCron.class);

            for (DeviceCron cron : deviceCrons) {
                calendar.setTime(dateFormat.parse(cron.get("time"));
                int cronMillis = calendar.get(Calendar.MILLISECOND);

                if (currentMillis >= cronMillis) {
                    this.switchState((int) device.get("id"), true);
                    break;
                }
            }

            if(((boolean) device.get("on"))) {
                devices2SwitchOn.add((int) device.get("id"));
            }
        }

        String json = (new Gson()).toJson(devices2SwitchOn.toArray());
        respond(json).contentType("text/json").status(200);
    }

    /*=== NON ROUTED FUNCTIONS ===*/
    /* Switch on and off */
    public void switchState(int id, boolean state){
        Device device = Device.findById(id);

        device.set("on", state);
        device.saveIt();
    }

}