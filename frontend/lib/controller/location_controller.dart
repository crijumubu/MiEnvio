import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController{

  Location location = new Location();
  StreamSubscription<LocationData>? locationSubscription;

  LocationController({required this.location,required this.locationSubscription});

  

  getLocation() async {
    try {
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

_locationData = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
        'name': 'john'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> listenLocation() async {
    
    locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      locationSubscription?.cancel();
      // setState(() {
      //   locationSubscription = null;
      // });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'john'
      }, SetOptions(merge: true));
    });
  }

  stopListening() {
    locationSubscription?.cancel();
    // setState(() {
    //   locationSubscription = null;
    // });
  }

  requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

}