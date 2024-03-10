This allows usage of virtual (simulated) pins in Klipper configurations.

More info about Klipper Virtual Pins here: :material-github: [GitHub](https://github.com/pedrolamas/klipper-virtual-pins)

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `Virtual Pins Support`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">

## Usage
<hr>

!!! Note
    Helper Script automatically adds the necessary function to the `printer.cfg` file, so there is no need to add it:

    ``` title="printer.cfg"
    [virtual_pins]
    ```

- `Use virtual_pin:` prefix followed by a random identifier (example `virtual_pin:test`)
  
    !!! Example
        Here's a fully working printer.cfg snippet:<br />

        ``` title="printer.cfg"
        [output_pin test]
        pin: virtual_pin:test_pin
        pwm: True
        cycle_time: 0.1
        ```
  
    This module allows configurable pins to be set to `virtual_pin:<id>` as a way to mitigate the limited number of available pins provided by the MCUs.

    !!! Note
        `virtual_pins` will be able to simulate most pins, with the major exception of steppers `step_pin` and `dir_pin` (please use MCU pins for these).

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
