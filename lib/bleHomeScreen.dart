import 'package:ble_session_app/scanScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'offScreen.dart';

class BleHomeScreen extends StatelessWidget{

  const BleHomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "bleApp",
      home: StreamBuilder<BluetoothAdapterState>(
        stream: FlutterBluePlus.adapterState,
        initialData: BluetoothAdapterState.unknown,
        builder: (c, snapshot){
          final state = snapshot.data;
          if(state == BluetoothAdapterState.on){
            return  FindDevicesScreen();// FindDevicesScreen();
          }
          return BluetoothOffScreen(state: state);// BluetoothOffScreen(state: state);
        }
      ),
    );
  }
}
