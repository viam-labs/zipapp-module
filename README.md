[![.github/workflows/publish.yml](https://github.com/viamrobotics/zipapp-module/actions/workflows/publish.yml/badge.svg)](https://github.com/viamrobotics/zipapp-module/actions/workflows/publish.yml)

> [!WARNING]
> This pattern may not work for your project -- zipapp can't bundle C extension modules

# wifi_sensor

Example using built-in python [zipapp](https://docs.python.org/3.11/library/zipapp.html) to deploy module to pi.

This follows the [sensor example](https://python.viam.dev/examples/example.html#create-custom-modules) on python.viam.dev.

## instructions for direct deploy

Assuming you have a pi set up with viam-server, run these commands on your laptop. (You can also use your laptop instead of a raspberry pi).

1. Edit `Makefile` with your pi's hostname
1. Run `make scp` to build the `pyz` bundle and deploy to your pi
1. Install the python viam-sdk globally on your pi:
	- `sudo pip install viam-sdk`
	- sudo is necessary because it needs to be available for our server process, not just for your user account
	- installing the SDK separately is necessary because zipapp can't bundle C extensions
1. Go to config/modules for your robot in app.viam.com, and add the new module (executable path is `/home/pi/wifi_sensor.pyz`)
1. Go to config, switch from 'builder' to 'raw json', and use the config [below](#config). If you run into trouble, also check out the config docs [here](https://python.viam.dev/examples/example.html#configure-a-modular-resource)
1. Look for issues in the Logs tabs for your robot on app.viam.com
1. Go to the control page
	- find 'my-sensor' under sensors
	- hit 'get readings'

## config

- Go to the 'Config' tab on the Viam webapp
- Switch from 'Builder' to 'Raw JSON' in the 'mode' toggle switch
- Replace the all-caps with your values

```json
{
  "modules": [
    {
      "version": "DESIRED_VERSION",
      "type": "registry",
      "name": "ANY_NAME",
      "module_id": "NAME_FROM_META.JSON"
    }
  ],
  "components": [
    {
      "name": "my-sensor",
      "type": "sensor",
      "attributes": {},
      "model": "MODEL_FROM_META.JSON",
      "depends_on": []
    }
  ]
}
```
