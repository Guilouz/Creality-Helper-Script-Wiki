This allows to install Klipper Adaptive Meshing & Purging modified build to works with K1 Series.

Klipper Adaptive Meshing & Purging is an extension that allows you to generate a mesh only in the area you really need it.

More info about KAMP here: :material-github: [GitHub](https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging)

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**

!!! Note
    This feature is not available for KE Series.

## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `Klipper Adaptive Meshing & Purging`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">


## Configuration
<hr>

All settings for KAMP are configured by Helper Script, you just need to make sure that `Label Objects` setting is enabled in your slicer.

  - **OrcaSlicer**: In `Others` tab, check `Exclude objets` setting
  - **Creality Print**: Under `Parameter Config`, check `Exclude Objects` setting in `Experimental` tab
  - **PrusaSlicer**: Make sure G-code flavor is set to `Klipper` in `Printer Settings > General > Firmware > G-code flavor` and change the `Label Objects` setting to `Firmware-specific` in `Print Settings > Output options > Output file > Label objects`

## Use
<hr>

Two buttons are available on Web interface to control KAMP:

  - `KAMP` button to enable/disable KAMP features.<br />
     When KAMP is enabled, a bed mesh named "kamp" is created and loaded to use adaptative bed mesh.<br />
     When KAMP is disabled, a bed mesh named "default" is created and loaded to use classic calibration (full bed mesh).
  - `BED_LEVELING` button to enable/disable classic calibration (full bed mesh) when KAMP is disabled (it have no effect when KAMP is enabled).

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
