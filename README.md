# wifi_sensor

Example using built-in python [zipapp](https://docs.python.org/3.11/library/zipapp.html) to deploy module to pi.

## decisions

I installed viam-sdk globally rather than bundling it. notes on this:

1. you have to `sudo pip install` this or else it will be in ~/.local, inaccessible
1. C extensions can't bundle in zipapp!
1. I added more-itertools (picked randomly) to confirm that we *can* bundle dependencies
