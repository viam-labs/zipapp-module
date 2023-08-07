wifi_sensor.pyz: wifi_sensor
	# python -m zipapp $< -m "wifi_sensor:syncmain"
	python -m zipapp -p "/usr/bin/env python3" $< -m "wifi_sensor:syncmain"

deps:
	python -m pip install -r requirements.txt --target wifi_sensor

scp: wifi_sensor.pyz
	# todo: not sure the +x bit transfers
	scp -o PubkeyAuthentication=no $< pi@aw-pi-modreg.local:
