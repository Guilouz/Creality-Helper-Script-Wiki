---
hide:
  - toc
---
In some cases date and time are not correct and defined by default to Sun Mar  1 13:29:37 CET 2020.
This guide explains how to set the correct date and time on your printer based on your time zone.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings or if you update the firmware.**

<br />

- Connect to SSH (Guide is available <a href="../../firmwares/ssh-connection">here</a>).

- Enter this command to see the current date and time defined on your printer:

    ``` title="SSH Command Prompt"
    date
    ```
    
    If date and time are correct, there is no need to continue.

- Enter this command to see the current zone defined on your printer:

    ``` title="SSH Command Prompt"
    ls -l /etc/localtime | awk '{print $6, $7, $8, $9, $10, $11}'
    ```

    By default I get this (I live in France so this is not correct):
    
    ``` title="SSH Command Prompt"
    Jan 10 16:04 /etc/localtime -> ../usr/share/zoneinfo/Asia/Shanghai
    ```

- Enter this command to delete the current defined zone:

    ``` title="SSH Command Prompt"
    rm -rf /etc/localtime
    ```

- Enter this command to display the list of available zones:

    ``` title="SSH Command Prompt"
    ls /usr/share/zoneinfo | grep '^[A-Z]'
    ```

- Enter this command to display the list of cities available in the chosen zone (by replacing the `XXX` with the zone):

    ``` title="SSH Command Prompt"
    ls /usr/share/zoneinfo/XXX | grep '^[A-Z]'
    ```

    !!! Example
        ``` title="SSH Command Prompt"
        ls /usr/share/zoneinfo/Europe | grep '^[A-Z]'
        ```

- When you have find your current time zone, enter this command to define it  (by replacing the `XXX` with the zone and `YYY` by the city):

    ``` title="SSH Command Prompt"
    ln -s /usr/share/zoneinfo/XXX/YYY /etc/localtime
    ```

    !!! Example
        ``` title="SSH Command Prompt"
        ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
        ```

- Enter this command to restart NTP server to take effect:

    ``` title="SSH Command Prompt"
    /etc/init.d/S49ntp restart
    ```

- Then enter this command again to see the changes applied:

    ``` title="SSH Command Prompt"
    date
    ```

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
