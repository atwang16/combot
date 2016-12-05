// Auto-generated. Do not edit!

// (in-package teleop.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class robotcmd {
  constructor() {
    this.drive_fvel = 0.0;
    this.drive_rvel = 0.0;
    this.flipper = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type robotcmd
    // Serialize message field [drive_fvel]
    bufferInfo = _serializer.float32(obj.drive_fvel, bufferInfo);
    // Serialize message field [drive_rvel]
    bufferInfo = _serializer.float32(obj.drive_rvel, bufferInfo);
    // Serialize message field [flipper]
    bufferInfo = _serializer.float32(obj.flipper, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type robotcmd
    let tmp;
    let len;
    let data = new robotcmd();
    // Deserialize message field [drive_fvel]
    tmp = _deserializer.float32(buffer);
    data.drive_fvel = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [drive_rvel]
    tmp = _deserializer.float32(buffer);
    data.drive_rvel = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [flipper]
    tmp = _deserializer.float32(buffer);
    data.flipper = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'teleop/robotcmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '04e0164496b5b11175b5eb32f5fde4f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 drive_fvel
    float32 drive_rvel
    float32 flipper
    
    `;
  }

};

module.exports = robotcmd;
