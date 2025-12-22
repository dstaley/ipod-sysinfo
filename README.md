# iPod System Information

This repository contains a collection of system information files retrieved from various iPod models.

> [!NOTE]
> This repository is currently missing information from the following models:
>
> - iPod (1st generation)
> - iPod (2nd generation)
> - iPod mini (1st generation)
>
> If you have access to one or more of these models, please submit a pull request!

## `SysInfo`

This file is present on early generation iPod models, specifically the first-, second-, third-, and fourth-generation iPod, and the first- and second-generation iPod mini. The structure is simple, with string keys followed by colons `:`, and then values.

```
BoardHwName: iPod P98
pszSerialNumber: 2Z5380FZSAY
ModelNumStr: M9829
FirewireGuid: 0x000A270014322B8C
HddFirmwareRev: BY102A
RegionCode: LL(0x0001)
PolicyFlags: 0x00000000
buildID: 0x04218000 (4.2.1)
visibleBuildID: 0x01218000 (1.2.1)
boardHwRev: 0x00000000 (0.0 0)
boardHwSwInterfaceRev: 0x00060000 (0.0.6 0)
bootLoaderImageRev: 0x00000000 (0.0 0)
diskModeImageRev: 0x00000000 (0.0 0)
diagImageRev: 0x00000000 (0.0 0)
osImageRev: 0x00000000 (0.0 0)
iPodFamily: 0x00000000
updaterFamily: 0x00000000
```

## `SysInfoExtended`

Beginning with the fourth-generation iPod and continuing through all subsequent models, iPod devices can report additional system information in the form of a [Property List](https://en.wikipedia.org/wiki/Property_list). This data can be accessed using a sequence of SCSI INQUIRY commands. Many open source tools store this data in a file named `SysInfoExtended`.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>BuildVersion</key>
<string>37A40005</string>
<key>ConnectedBus</key>
<string>USB</string>
<key>MaxTransferSpeed</key>
<integer>61440</integer>
<key>FamilyID</key>
<integer>18</integer>
<key>MLBN</key>
<string>C0743430GHCF6KNC</string>
<!-- ... -->
```

Several iPod models also respond to specific USB vendor control transfers to access the same Property List that can be accessed via SCSI. However, the fifth-, sixth-, and seventh-generation iPod nano contain additional fields in their system information Property List when accessed via USB. When the data from SCSI and USB differs, this repo distinguishes between them via the `_SCSI` and `_USB` suffixes.

## Variants

The fourth-generation iPod has two models: the original iPod with a monochrome display that released in July 2004, and a color display iPod that released in October 2004. The latter was originally called iPod Photo, and its system information is distinguished from the earlier model by the `Photo_` prefix.

The sixth-generation iPod has two models: the original released in September 2007, and a revision released in September 2009 that supported on-device Genius capabilities. The latter is distinguished by the `Late_2009_` prefix.

<table>
  <thead>
    <tr>
      <th>Model</th>
      <th>Generation</th>
      <th>Variant</th>
      <th>SysInfo File</th>
      <th>Supports SCSI</th>
      <th>Supports USB</th>
      <th>USB Has Additional Fields</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="8">iPod</td>
      <td>1st</td>
      <td></td>
      <td>❓</td>
      <td>❓</td>
      <td>❓</td>
      <td>❓</td>
    </tr>
    <tr>
      <td>2nd</td>
      <td></td>
      <td>❓</td>
      <td>❓</td>
      <td>❓</td>
      <td>❓</td>
    </tr>
    <tr>
      <td>3rd</td>
      <td></td>
      <td>✅</td>
      <td>❌</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td rowspan="2">4th</td>
      <td></td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td>Photo</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td>5th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td rowspan="2">6th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
    </tr>
    <tr>
      <td>Late 2009</td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
    </tr>
    <tr>
      <td rowspan="2">iPod mini</td>
      <td>1st</td>
      <td></td>
      <td>❓</td>
      <td>❓</td>
      <td>❓</td>
      <td>❓</td>
    </tr>
    <tr>
      <td>2nd</td>
      <td></td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td rowspan="7">iPod nano</td>
      <td>1st</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td>2nd</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td>3rd</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
    </tr>
    <tr>
      <td>4th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
    </tr>
    <tr>
      <td>5th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>6th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>7th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>✅</td>
    </tr>
    <tr>
      <td rowspan="4">iPod shuffle</td>
      <td>1st</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td>2nd</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>❌</td>
      <td>—</td>
    </tr>
    <tr>
      <td>3rd</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
    </tr>
    <tr>
      <td>4th</td>
      <td></td>
      <td>❌</td>
      <td>✅</td>
      <td>✅</td>
      <td>❌</td>
    </tr>
  </tbody>
</table>

## Formatting

The Property List files in this repository have been formatted with `xmllint` for readability. To format the files, run `./format.sh`.
