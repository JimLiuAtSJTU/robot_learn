
"use strict";

let SetDigitalIO = require('./SetDigitalIO.js')
let TCPOffset = require('./TCPOffset.js')
let SetInt16 = require('./SetInt16.js')
let GripperConfig = require('./GripperConfig.js')
let MoveAxisAngle = require('./MoveAxisAngle.js')
let GetDigitalIO = require('./GetDigitalIO.js')
let GripperState = require('./GripperState.js')
let SetControllerAnalogIO = require('./SetControllerAnalogIO.js')
let ConfigToolModbus = require('./ConfigToolModbus.js')
let SetLoad = require('./SetLoad.js')
let GripperMove = require('./GripperMove.js')
let SetToolModbus = require('./SetToolModbus.js')
let ClearErr = require('./ClearErr.js')
let GetErr = require('./GetErr.js')
let GetControllerDigitalIO = require('./GetControllerDigitalIO.js')
let SetAxis = require('./SetAxis.js')
let Move = require('./Move.js')
let GetAnalogIO = require('./GetAnalogIO.js')

module.exports = {
  SetDigitalIO: SetDigitalIO,
  TCPOffset: TCPOffset,
  SetInt16: SetInt16,
  GripperConfig: GripperConfig,
  MoveAxisAngle: MoveAxisAngle,
  GetDigitalIO: GetDigitalIO,
  GripperState: GripperState,
  SetControllerAnalogIO: SetControllerAnalogIO,
  ConfigToolModbus: ConfigToolModbus,
  SetLoad: SetLoad,
  GripperMove: GripperMove,
  SetToolModbus: SetToolModbus,
  ClearErr: ClearErr,
  GetErr: GetErr,
  GetControllerDigitalIO: GetControllerDigitalIO,
  SetAxis: SetAxis,
  Move: Move,
  GetAnalogIO: GetAnalogIO,
};
