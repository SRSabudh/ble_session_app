import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:ble_session_app/deviceScreen.dart';

class FindDevicesScreen extends StatelessWidget {

  FindDevicesScreen({super.key});
  TextEditingController accountKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Scan Device")
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          FlutterBluePlus.startScan(
              timeout: const Duration(seconds: 5),
              removeIfGone: const Duration(seconds: 2),
              oneByOne: false
          );
          return Future.value();
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<ScanResult>>(
                  stream: FlutterBluePlus.scanResults,
                  initialData: const [],
                  builder: (c, snapshot) => Column(

                    children: snapshot.data!.map((r) => Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: ListTile(
                        tileColor: Colors.black26,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                        isThreeLine: false,
                        title: Text(r.device.platformName.toString()),
                        subtitle: Text("Type -> ${r.device.platformName.toString()} \n Device id -> ${r.device.remoteId.str.toString()}"),
                        trailing: const Icon(Icons.bluetooth_sharp),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SendData(device: r.device)));
                        },
                      ),
                    )).toList(),
                  )
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBluePlus.isScanning,
        initialData: false,
        builder: (c, snapshot) {

          if (snapshot.data!) {
            return FloatingActionButton(
              onPressed: () => FlutterBluePlus.stopScan(),
              backgroundColor: Colors.red,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          } else {
            return FloatingActionButton(
              onPressed: () => FlutterBluePlus.startScan(
                  timeout: const Duration(seconds: 5),
                  removeIfGone: const Duration(seconds: 2),
                  oneByOne: false),
              backgroundColor: Colors.lightGreen,
              child: const Icon(Icons.search),);
          }
        },
      ),
    );
  }
}