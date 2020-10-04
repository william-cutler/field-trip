import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng loc;
  final double zoom;

  const MapWidget(
      {Key key, this.loc = const LatLng(42.3601, -71.0589), this.zoom = 16.0})
      : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState(this.loc, this.zoom);
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;

  final LatLng _center;
  final double _zoom;

  _MapWidgetState(this._center, this._zoom);

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
        markers: {Marker(markerId: MarkerId("Pin Marker"), position: _center)},
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: this._zoom,
        ),
      ),
    );
  }
}
