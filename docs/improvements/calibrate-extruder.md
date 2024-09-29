On an extruder, the rotation_distance is the amount of distance the filament travels for one full rotation of the stepper motor. The best way to get an accurate value for this setting is to use a "measure and trim" procedure.

## Procedure
<hr>

- Remove PTFE tube from the Extruder for the measure.

- Heat the Hotend to an appropriate temperature and insert filament in it.

- Use a marker to place a mark on the filament 120mm from the inlet of the extruder.

- Then use a digital caliper to measure the actual distance from that mark as accurately as possible.

    Note this value of 120mm as the `<initial_mark_distance>`.

- Via the console section of Fluidd, extrude 100mm of filament with the following command sequence.

    Note this value of 100mm as the `<requested_extrude_distance>`:

    ```
    G91
    ```

    ```
    G1 E100 F100
    ```

- Wait for extruder to complete the movement (this will take several seconds). It's important to use a slow extrusion speed for this test, as a faster speed can cause high pressure in the extruder which will skew the results. So don't use the EXTRUDE button from Fluidd or the screen for this test as they extrude at a fast rate.

- Then use a digital caliper to measure the new distance from the inlet of the extruder to the mark on the filament.

    Note this value as `<measured_distance>`.

- Then calculate:

    `<initial_mark_distance>` :fontawesome-solid-minus: `<measured_distance>` :fontawesome-solid-arrow-right-long: `<extrusion_distance>`

- Then retrieve the current rotation_distance value from the `printer.cfg` file at the `rotation_distance:` line of the `[extruder]` section:

    ```
    [extruder]
    max_extrude_only_distance: 1000.0
    max_extrude_cross_section: 80
    step_pin: nozzle_mcu:PB1
    dir_pin: nozzle_mcu:PB0
    enable_pin: !nozzle_mcu:PB2
    microsteps: 16
    rotation_distance: 6.9
    ```

    Note this value as `<current_rotation_distance>`.

- Calculate the rotation_distance as follows:

    `<current_rotation_distance>` :fontawesome-solid-xmark: `<extrusion_distance>` :fontawesome-solid-divide: `<requested_extrude_distance>` :fontawesome-solid-arrow-right-long: `<rotation_distance>`

- Then replace the new value in the `printer.cfg` file by rounding the new `rotation_distance` to three decimal places.

- You can now retract filament and replace your PTFE tube in its place, your extruder is calibrated.


## Example
<hr>

- After extruding 100mm, I measure a distance of 18 mm between the inlet of my extruder and the mark on the filament.

- So I have :

    - My `<initial_mark_distance>` value of 120mm.
    - My `<requested_extrude_distance>` value of 100mm.
    - My `<measured_distance>` value of 18mm.

- So I calculate my current `<extrusion_distance>` for 100mm requested:

    `<initial_mark_distance>` :fontawesome-solid-minus: `<measured_distance>` :fontawesome-solid-arrow-right-long: `<extrusion_distance>`

    120mm :fontawesome-solid-minus: 18mm :fontawesome-solid-arrow-right-long: **102mm**

- I get the `<current_rotation_distance>` value from the `printer.cfg` file which is **6.9**.

- So I then calculate my new `<rotation_distance>` value:

    `<current_rotation_distance>` :fontawesome-solid-xmark: `<extrusion_distance>` :fontawesome-solid-divide: `<requested_extrude_distance>` :fontawesome-solid-arrow-right-long: `<rotation_distance>`

    6.9 :fontawesome-solid-xmark: 102mm :fontawesome-solid-divide: 100mm :fontawesome-solid-arrow-right-long: **7.038**

- I replace the **rotation_distance: 6.9** line in the `printer.cfg` file with:<br />
  **rotation_distance: 7.038**:

    ```
    [extruder]
    max_extrude_only_distance: 1000.0
    max_extrude_cross_section: 80
    step_pin: nozzle_mcu:PB1
    dir_pin: nozzle_mcu:PB0
    enable_pin: !nozzle_mcu:PB2
    microsteps: 16
    rotation_distance: 7.038
    ```

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
