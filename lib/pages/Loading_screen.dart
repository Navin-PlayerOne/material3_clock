import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:real_apps/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String time;
  void createWorldTimeObj() async {
    WorldTime cur_time = WorldTime(country: 'India', url: 'asia/kolkata');
    await cur_time.getTime();
    time = cur_time.time!;
    await Future.delayed(Duration(
      seconds: 2,
    ));
    while (time == "Couldn't load Data") {
      await Future.delayed(Duration(
        seconds: 1,
      ));
      await cur_time.getTime();
      time = cur_time.time!;
    }
    setState(() {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  initState() {
    super.initState();
    print("InitState");
    createWorldTimeObj();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 300.0,
        ),
      ),
    );
  }
}
