import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oasis/services/location.dart';
import 'package:oasis/services/networking.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> postList;
  List list;
  double latitude;
  double longitude;
  GoogleMapController _controller;
  Widget _child;

  void getUserLocation() async {
    Location location = Location();
    var position = await location.getCurrentLocation();
    latitude = position.latitude;
    longitude = position.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "http://10.0.2.2:8080/api/oasis/trashcans?lon=127.06&lat=37.543");
    postList = networkHelper.getData();
    list = await postList;

    DestinationMarkers.add(
      Marker(
        markerId: MarkerId('TrashCan1'),
        draggable: false,
        position: LatLng(
          37.54,
          127.06,
        ),
      ),
    );

    for (int i = 0; i < list.length; i++) {
      DestinationMarkers.add(
        Marker(
          infoWindow: InfoWindow(
            title: '${list[i]['location']}',
          ),
          markerId: MarkerId('${list[i]['id']}'),
          draggable: false,
          position: LatLng(
            list[i]['latitude'],
            list[i]['longitude'],
          ),
        ),
      );
    }

    setState(() {
      _child = mapWidget();
    });
  }

  Widget mapWidget() {
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.normal,
      markers: Set.from(DestinationMarkers),
      initialCameraPosition: CameraPosition(
        target: LatLng(37.54, 127.06),
        zoom: 16,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  List<Marker> DestinationMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    getUserLocation();
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    DestinationMarkers.clear();
    _controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.person_outline_outlined,
                      size: 30,
                    ),
                    onPressed: null,
                  ),
                  Center(
                    child: Text(
                      'Oasis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Eco-Friend!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  // Text(
                  //   'Luke',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 24,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: _child,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Material(
                  elevation: 5.0,
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Add Trash Can',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
