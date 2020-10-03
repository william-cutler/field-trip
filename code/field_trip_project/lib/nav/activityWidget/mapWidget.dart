import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng loc;

  const MapWidget({Key key, this.loc = const LatLng(45.521563, -122.677433)})
      : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState(this.loc);
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;

  final LatLng _center;

  _MapWidgetState(this._center);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200.0,
      ),
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
