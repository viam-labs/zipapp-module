# wifi_sensor

Example using built-in python [zipapp](https://docs.python.org/3.11/library/zipapp.html) to deploy module to pi.

This follows the [sensor example](https://python.viam.dev/examples/example.html#create-custom-modules) on python.viam.dev.

## instructions

Assuming you have a pi set up with viam-server, run these commands on your laptop:

```sh
# 1. install dependencies
make deps
# 2. deploy to pi (edit makefile with your pi's hostname first)
make scp
```

3. Start the module in webapp (executable path is `/home/pi/wifi_sensor.pyz`).
4. Look for issues in the webapp logs
5. Copy the `acme:wifi_sensor:linux` component from [here](https://python.viam.dev/examples/example.html#create-custom-modules) into your robot's config in the webapp
6. Go to the control page
	- find 'my-sensor' under sensors
	- hit 'get readings'

## decisions

I installed viam-sdk globally rather than bundling it. notes on this:

1. you have to `sudo pip install` this or else it will be in ~/.local, inaccessible
1. C extensions can't bundle in zipapp!
1. I added more-itertools (picked randomly) to confirm that we *can* bundle dependencies
