This allows to use `M600` command in your slicer to change filament.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `M600 Support`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">

- You can now use `M600` command in your Slicer to trigger a filament change.


## How M600 works
<hr>

Unlike a classic pause which just parks the hotend on the right side and does not stop hotend heating and part fan, `M600` command works as follows:

  **1.** When an M600 is detected in Gcode or if the filament sensor has a runout detection, the hotend is parked at the front of the build plate.
  **2.** Filament is automatically unloaded from the hotend and the fans are stopped.
  **3.** At this point, action on your part is required, a prompt window is displayed on the Fluidd or Mainsail Web interface:
      
       <img width="600" src="../../assets/img/M600-Support/M600_Support.png">   
      
    !!! Note
        If you don't take any action, the heating of the hotend is stopped after 15 min to avoid thermal runaway. The bed remains heated to avoid detachment of the model.

  **4.** You must remove old filament and replace the new one by placing it at the extruder inlet and press the `LOAD FILAMENT` button.
  **5.** If necessary, the filament can be further purged with the `PURGE MORE FILAMENT` button.
  **6.** When all is done, you can restart print with `RESUME` button.
    
    !!! Note
        **Remember to remove excess purge from the hotend before resuming printing.**

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
