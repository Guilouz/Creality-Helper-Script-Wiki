# Slicer discovery on the local network

On a K1 series printer with Moonraker and Nginx installed, Helper Script can advertise the OctoPrint-compatible upload endpoint on port `4408`. OrcaSlicer can then find the printer by name on the same local network. This feature requires the firmware's `/usr/bin/mdns` service and has been tested on the K1C.

1. Install [Moonraker and Nginx](moonraker-k1.md) if needed.
2. Open Helper Script on the printer. Select **5 · Tools**, then **14 · Enable slicer discovery on port 4408**.
3. In OrcaSlicer, click the **Connection** icon beside the printer preset. Set **Host Type** to **Octo/Klipper** and click **Browse** beside **Hostname, IP or URL**.
4. Select the row with your printer's hostname and port `4408`, then click **OK**. Click **Test** to check the connection and **OK** to save it.

To stop advertising the endpoint and remove it from startup, select **Tools → 15 · Disable slicer discovery on port 4408**. The printer's built-in Creality announcement stays active.

If **Browse** shows an empty list, check that the computer and printer are on the same network and that multicast DNS (mDNS) can pass between them. You can also [enter the address manually in OrcaSlicer](../slicers/orcaslicer.md#upload-gcode-files-to-printer). If **Test** returns HTTP `401`, enter your Moonraker API key in **API Key / Password** and test again.
