Is your Creality K1 Max falling short? You have a way to make it much better. Improve speed, surface quality, versatility and durability.<br />
This XY-axis and Large Gears Extruder LGX Lite Pro upgrade from **Bondtech** is designed to use on the Creality K1, K1C and K1 Max.


## Links
<hr>

&nbsp;&nbsp;&nbsp;&nbsp;:material-web: <a href="https://www.bondtech.se/product/lgx-lite-pro-upgrade-kit-for-creality-k1-k1c/">LGX Lite Pro Upgrade Kit for Creality K1 and K1C</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;:material-web: <a href="https://www.bondtech.se/product/lgx-lite-pro-upgrade-kit-for-creality-k1-max/">LGX Lite Pro Upgrade Kit for Creality K1 Max</a>


## Installation
<hr>

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/01.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/02.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/03.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/04.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/05.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/06.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/07.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/08.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/09.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/10.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/11.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/12.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/13.png">

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/14.png">


## Klipper Configuration
<hr>

It’s needed to change extruder motor configuration.

- Open `printer.cfg` file:

    - On original Fluidd Web Interface go to `Configuration` icon on the left side.
    - On original Mainsail Web Interface go to `Machine` tab on the left side.

- Search section named `[extruder]` and replace this parameter:

    ``` hl_lines="2"
    [extruder]
    rotation_distance: 3.99
    ```

- Search section named `[tmc2209 extruder]` and replace this parameter:

    ``` title="printer.cfg" hl_lines="2"
    [extruder]
    run_current: 0.6
    ```

- If you have the new version of **K1** (with 20 teeth pulleys) or **K1C**, you must also change these settings:

    ``` title="printer.cfg" hl_lines="2"
    [stepper_y]
    position_max: 224 # Stock 227 - Decrease 3
    ```

    ``` title="printer.cfg" hl_lines="2"
    [prtouch_v2]
    clr_noz_start_y: 223.5 # Stock 225 - Decrease 1.5
    ```

- If you have the new version of **K1 Max** (with 20 teeth pulleys), you must also change these settings:

    ``` title="printer.cfg" hl_lines="2"
    [stepper_y]
    position_max: 303 # Stock 306 - Decrease 3
    ```

    ``` title="printer.cfg" hl_lines="2"
    [prtouch_v2]
    clr_noz_start_y: 301.5 # Stock 303 - Decrease 1.5
    ```

## Slicer Configuration
<hr>

It’s needed to change retraction settings in your slicer:

- **For 0.4mm nozzle:** 0.7mm length @ 35mm/s
- **For 0.6mm nozzle:** 0.9mm length @ 35mm/s


## Use
<hr>

<img width="900" src="../../assets/img/Bondtech-LGX-Lite-Pro-Upgrade-Kit/15.png">

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
