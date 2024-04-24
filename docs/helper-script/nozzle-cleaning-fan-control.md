---
hide:
  - toc
---
This allows to control hotend and side fans during nozzle cleaning process to have quieter cooling.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `Nozzle Cleaning Fan Control`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">

- You can change the fan speed, open `nozzle-cleaning-fan-control.cfg` file located in `Helper-Script` folder:

    - On original Fluidd Web Interface go to `Configuration` icon on the left side.
    - On original Mainsail Web Interface go to `Machine` tab on the left side.

- And change the `max_speed` value knowing that the max value is 1.0 (which corresponds to a speed of 100%).

    ``` title="nozzle-cleaning-fan-control.cfg" hl_lines="2"
    [prtouch_v2_fan]
    max_speed: 0.5
    ```

- Then, click on `SAVE & RESTART` button in the top right corner.

- During the nozzle cleaning process, the fans will now operate at the defined value.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>

