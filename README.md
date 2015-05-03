pimatic-lcd
===========

pimatic support for LCD Displays using i2c serial bus or the GPIO pins of the Raspberry Pi.

This repository is a fork of the orignal plugin, which can be found [here](https://github.com/pimatic/pimatic-lcd/)

Tested with:
* 2004 LCD Display Module HD44780 (20x4)
* 1602 LCD Display Module HD44780 (16x2)

Example config:
--------------

Using i2c:

```json
{
  "plugin": "lcd",
  "type": "i2c"
  "bus": "/dev/i2c-1",
  "rows": 2,
  "cols": 20
}
```

Using GPIO:

```json
{
  "plugin": "lcd",
  "type": "gpio",
  "pins": {
    "rs": 23,
    "e": 24,
    "data": [
      5,
      6,
      13,
      26
    ]
  },
  "rows": 2,
  "cols": 20
}
```

If type is not specified, it will default to "i2c".

If the pins for the GPIO type are not specified, by default the ones in the example above will be used.

Example rules:
--------------

```
IF $syssensor.cpu changes
THEN display "CPU: {$syssensor.cpu}%" on lcd line 1


IF $syssensor.cpu changes or $syssensor.memory changes
THEN display "CPU: {$syssensor.cpu}%" on lcd line 1 and display "MEM: {$syssensor.memor}MB" on lcd line 2


IF switch is turned off
THEN turn LCD backlight off


IF switch is turned off
THEN display "Bye bye" on lcd and after 5 seconds turn LCD backlight off
```