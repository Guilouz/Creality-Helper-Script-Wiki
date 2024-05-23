This allows to install Klipper Adaptive Meshing & Purging modified build to works with K1 Series and Ender-3 V3 Series.

Klipper Adaptive Meshing & Purging is an extension that allows you to generate a mesh and purge line only in the area of the bed used by the objects being printed.<br />
When used, the method will automatically adjust the mesh parameters based on the area occupied by the defined print objects.

More info about KAMP here: :material-github: [GitHub](https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging)

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**

## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `Klipper Adaptive Meshing & Purging`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">


## Configuration
<hr>

All settings for KAMP are configured by Helper Script, you just need to make sure that `Exclude Objects` setting is enabled in your slicer.

  - **OrcaSlicer**: In `Others` tab, check `Label Objets` and `Exclude objets` settings
  - **Creality Print**: Under `Parameter Config`, check `Exclude Objects` setting in `Experimental` tab
  - **PrusaSlicer**: Make sure G-code flavor is set to `Klipper` in `Printer Settings > General > Firmware > G-code flavor` and change the `Label Objects` setting to `Firmware-specific` in `Print Settings > Output options > Output file > Label objects`

<br />

You can also edit some settings in `KAMP_Settings.cfg` file located in `Helper-Script/KAMP` folder.

- <u>The following variables are for adjusting Adaptive Meshing settings:</u>

    - **variable_mesh_margin**: This is the space (in millimeters) beyond your print area to further increase the size of the adaptive mesh. This can be useful for those who commonly use brims when printing. By default, this value is `0`.
    - **variable_fuzz_amount**: This is the maximum value (in millimeters) to which the mesh boundaries can be randomly increased. This will slightly randomize the bed mesh boundaries, which will help to spread out wear your bed surface when printing the same model multiple times. By default, this value is `0`. The maximum recommended value is `3`.

- <u>The following variables are for adjusting Adaptive Bed Mesh settings:</u>

    - **variable_purge_height**: This is the height (in millimeters) above the bed at which the nozzle will be when the purge is carried out. This shouldn't require much adjustment unless you're using a large diameter nozzle or purging a very small amount. By default, this value is `0.8`.
    - **variable_tip_distance**: This is the distance that the very tip of your loaded filament is away from the opening of your nozzle. It's a good idea to tune this value so that your purge is nice and consistent, rather than spotty or blown out at the beginning.
    - **variable_purge_margin**: This is the space you wish to have between your purge and your actual print area. Helpful for those who print using brims or skirts. By default, this value is `10`.
    - **variable_purge_amount**: This is the amount (in millimeters) of filament material you wish to purge prior to a print beginning. By default, this value is `50`.
    - **variable_flow_rate**: This is the desired flow rate you wish to purge at. You should set this value to be close to the flow limit of your hotend. By default, this value is `12`.

- <u>The following variables are for adjusting Smart Park settings, which will park the printhead near the print area:</u>

    - **variable_smart_park_height**: This is the height (in millimeters) at which your print head will be positioned when thewhen calling the `_SMART_PARK` macro. By default, this value is `10`.


## Use
<hr>

- To configure the bed mesh type, use the `KAMP_BED_MESH_SETTINGS` macro:

    <img width="600" src="../../assets/img/KAMP/Bed_Mesh_Settings.png">

    - When `ADAPTIVE BED MESH` is selected, a bed mesh named `adaptive` is done to use adaptative bed mesh when starting a print.

    - When `FULL BED MESH` is selected, a bed mesh named `default` is done to use adaptative bed mesh when starting a print.

    - When `NONE` is selected, no bed mesh is performed when starting a print (make sure you have already saved a mesh before).

- To configure the purge line type, use the `KAMP_PURGE_LINE_SETTINGS` macro:

    <img width="600" src="../../assets/img/KAMP/Purge_Line_Settings.png">

    - When `ADAPTIVE PUGE LINE` is selected, a adaptive purge line near the print area is done when starting a print.

    - When `CLASSIC PURGE LINE` is selected, a classic purge line is done when starting a print.

!!! Note
    Adaptive Bed Mesh and Adaptive Purge Line configuration changes made using these macros will only
    be active while your printer is running.   If you restart your printer or Restart Klipper from Fluidd
    or Mainsail, or even by using `SAVE_CONFIG`, these settings will be lost and your printer will revert
    to doing an `ADAPTIVE BED MESH` and `ADAPTIVE PUGE LINE` by default.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
