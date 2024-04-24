---
hide:
  - toc
---
From Fluidd or Mainsail it's possible to classify your Gcode in folders but by default it's not possible to start a print from a folder.

This returns **_code:"key514", "msg":"Malformed command args..._** error. This fix allows that.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings or if you update the firmware.**


## How to fix that
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Tools] Menu` by typing ++"5"++ , validate with ++"Enter"++ and select `Fix printing Gode files from folder`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Tools_Menu.png">

- Once fix installed, you can now print Gcode files from a folder.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
