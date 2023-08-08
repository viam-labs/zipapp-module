wifi_sensor.pyz: wifi_sensor
	# create an executable zipapp (still relies on system python though)
	python3 -m zipapp -p "/usr/bin/env python3" $< -m "wifi_sensor:syncmain"

deps:
	# install requirements inside the deploy folder. run this before wifi_sensor.pyz please
	python3 -m pip install -r requirements.txt --target wifi_sensor

scp: wifi_sensor.pyz
	# scp pyz zipapp bundle to device
	scp -o PubkeyAuthentication=no $< pi@aw-pi-modreg.local:
