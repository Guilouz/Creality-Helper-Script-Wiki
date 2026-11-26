# Slicer discovery on the local network

On a K1 series printer with Moonraker and Nginx installed, Helper Script can advertise the printer to OrcaSlicer on the local network. The native Moonraker discovery extension adds a second announcement.

| Client | mDNS service | Port |
| --- | --- | --- |
| OrcaSlicer **Octo/Klipper → Browse** | `_octoprint._tcp.local.` | `4408`, the OctoPrint-compatible API through Nginx |
| Clients with native Moonraker discovery | `_moonraker._tcp.local.` | The port configured in Moonraker's `[server]` section (default `7125`) |

The first announcement uses the K1 firmware's `/usr/bin/mdns`. Moonraker publishes the second through its own `[zeroconf]` component.

1. Install [Moonraker and Nginx](moonraker-k1.md) if needed.
2. Open Helper Script on the printer. Select **5 · Tools**, then **14 · Enable slicer discovery**.
3. In OrcaSlicer, click the **Connection** icon beside the printer preset. Set **Host Type** to **Octo/Klipper** and click **Browse** beside **Hostname, IP or URL**.
4. Select the row with your printer's hostname and port `4408`, then click **OK**. Click **Test** to check the connection and **OK** to save it.

To turn off the announcements managed by Helper Script, select **Tools → 15 · Disable slicer discovery**. With the native extension, a pre-existing `[zeroconf]` section in `moonraker.conf` or an included file remains in control of native discovery. If you add settings to the section created by Helper Script, disabling discovery keeps those settings.

Only the native extension may need to restart Moonraker. It checks that the printer is idle first. If it asks you to wait, repeat the same **Enable** or **Disable** option once the printer is idle. If the local API is unavailable, use **Tools → 7 · Restart Moonraker service** when the printer is idle.

If **Browse** shows an empty list, check that the computer and printer are on the same network and that multicast DNS (mDNS) can pass between them. You can also [enter the address manually in OrcaSlicer](../slicers/orcaslicer.md#upload-gcode-files-to-printer). If **Test** returns HTTP `401`, enter your Moonraker API key in **API Key / Password** and test again.
