package app.controllers.device;

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

    /* Switch on and off */
    public void switchState(int id, boolean state){
        Device device = Device.findById(id);

        device.set("on", state);
        device.saveIt();
    }

    @GET public void on()  { 
        switchState(param("id") ,true);
    }

    @GET public void off() { 
        switchState(param("id") ,false);
    }


    /* Set time to switch on and off */
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

    public void verifyTime() {
        User user = (User) session("loggedUser");
        List<Device> userDevices = user.get("devices");
        List<Integer> devices2SwitchOn = new ArrayList<>();

        Calendar calendar = Calendar.getInstance();
        int currentMillis = calendar.get(Calendar.MILLISECOND);
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        
        for (Device device : userDevices) {
            List<DeviceCron> deviceCrons = device.get("crons");

            for (DeviceCron cron : deviceCrons) {
                calendar.setTime(dateFormat.parse(cron.get("time"));
                int cronMillis = calendar.get(Calendar.MILLISECOND);

                if (currentMillis >= cronMillis) {
                    switchState(device.get("id"), true);
                    break;
                }

                if(((boolean) device.get("on"))) {
                    devices2SwitchOn.add(device.get("id"));
                }
            }
        }

        respond(devices2SwitchOn);
    }

}