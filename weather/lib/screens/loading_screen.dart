import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Location.getCrdntls();
    Location.getLocation();
    Location.getPosition();
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("position: ${Location.getPosition()}");
            print("lat: ${Location.getLat()}");
            print("lntg: ${Location.getLng()}");
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
