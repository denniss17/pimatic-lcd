module.exports = {
  title: "lcd plugin config options"
  type: "object"
  properties:
    bus:
      description: "i2c bus device"
      type: "string"
      default: "/dev/i2c-1"
    type:
      description: "i2c or gpio pins"
      type: "string" 
      enum: ["i2c", "gpio"]
      default: "i2c"
    pins:
      description: "gpio pins of the device"
      type: "object"
      default: {
        "rs": 25, 
        "e": 24,
        "data": [23, 17, 21, 22]
      }
    address:
      description: "address of the device"
      type: "number"
      default: 0x27
    rows:
      description: "number of rows (lines) of the LCD"
      type: "number"
      default: 4
    cols: 
      description: "number of cols (characters in a line) of the LCD"
      type: "number"
      default: 20
}