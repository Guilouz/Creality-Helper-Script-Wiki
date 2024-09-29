---
hide:
  - toc
---
By default at the end of a print, the hotend is cooled by its fan which runs at 100%.

By making this change, the hotend fan speed will be reduced to 80% and the side fan will also be enabled at 40%. This allows faster and quieter cooling.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Configuration
<hr>

- Open `gcode_macro.cfg` file:

    - On original Fluidd Web Interface go to `Configuration` icon on the left side.
    - On original Mainsail Web Interface go to `Machine` tab on the left side.

- Search macro named `[gcode_macro WAIT_TEMP_START]` and replace it by this one:

    ```
    [gcode_macro WAIT_TEMP_START]
    gcode:
      UPDATE_DELAYED_GCODE ID=wait_temp DURATION=1
      SET_PIN PIN=fan0 VALUE=210
      SET_PIN PIN=fan2 VALUE=210
    ```

- Then, search macro named `[gcode_macro WAIT_TEMP_END]` and replace it by this one:

    ```
    [gcode_macro WAIT_TEMP_END]
    gcode:
      UPDATE_DELAYED_GCODE ID=wait_temp DURATION=0
      M106 P0 S0
      M106 P2 S0
    ```

- Then, click on `SAVE & RESTART` button in the top right corner.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
