import 'package:flutter/material.dart';
import 'package:real_apps/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String time = "Loading...";
  void createWorldTimeObj() async {
    WorldTime cur_time = WorldTime(country: 'India', url: 'asia/kolkata');
    await cur_time.getTime();
    setState(() {
      print("hiii");
      time = cur_time.time!;
    });
  }

  initState() {
    super.initState();
    print("InitState");
    createWorldTimeObj();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("BuildStateState");
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Time"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                '$time',
                style: TextStyle(
                  fontSize: 50.0,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  createWorldTimeObj();
                });
              },
              icon: Icon(Icons.refresh),
              label: Text(
                "Refresh Time",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  //color: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
