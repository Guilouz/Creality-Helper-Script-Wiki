This allows to use the buzzer integrated into the motherboard to play a sound during certain actions.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `Buzzer Support`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">

- Then reboot your printer.


## Configuration
<hr>

- You can use `BEEP` command where you want in macros to play a sound.

    !!! Example
        Here is an example to play a sound when printing is complete:<br />
        ``` title="gcode_macro.cfg" hl_lines="12"
        [gcode_macro END_PRINT]
        gcode:
          Qmode_exit
          EXCLUDE_OBJECT_RESET
          PRINT_PREPARE_CLEAR
          M220 S100
          SET_VELOCITY_LIMIT ACCEL=5000 ACCEL_TO_DECEL=2500
          TURN_OFF_HEATERS
          M107 P1
          M107 P2
          END_PRINT_POINT
          BEEP
          WAIT_TEMP_START
          M84
        ```
<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
