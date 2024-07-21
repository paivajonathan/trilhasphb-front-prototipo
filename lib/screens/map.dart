import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpx/gpx.dart';
import 'package:hello_world/widgets/custom_scaffold.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Polyline> _directionPolyline = {};

  void _generatePolylines() {
    Gpx gpx = GpxReader().fromString("""
    <?xml version="1.0" encoding="UTF-8"?>
    <gpx xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.topografix.com/GPX/1/1" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.garmin.com/xmlschemas/GpxExtensions/v3 http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v1 http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd http://www.topografix.com/GPX/gpx_style/0/2 http://www.topografix.com/GPX/gpx_style/0/2/gpx_style.xsd" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3" xmlns:gpx_style="http://www.topografix.com/GPX/gpx_style/0/2" version="1.1" creator="https://gpx.studio">
    <metadata>
        <name>new</name>
        <author>
            <name>gpx.studio</name>
            <link href="https://gpx.studio"></link>
        </author>
    </metadata>
    <trk>
        <name>new</name>
        <type>Cycling</type>
        <trkseg>
        <trkpt lat="-2.916617" lon="-41.777198">
            <ele>9.3</ele>
        </trkpt>
        <trkpt lat="-2.91657" lon="-41.777195">
            <ele>9.5</ele>
        </trkpt>
        <trkpt lat="-2.916618" lon="-41.776152">
            <ele>10.3</ele>
        </trkpt>
        <trkpt lat="-2.916686" lon="-41.775065">
            <ele>11.8</ele>
        </trkpt>
        <trkpt lat="-2.916753" lon="-41.774003">
            <ele>15.5</ele>
        </trkpt>
        <trkpt lat="-2.916758" lon="-41.773873">
            <ele>16.0</ele>
        </trkpt>
        <trkpt lat="-2.916625" lon="-41.773863">
            <ele>16.0</ele>
        </trkpt>
        <trkpt lat="-2.916616" lon="-41.773993">
            <ele>15.5</ele>
        </trkpt>
        <trkpt lat="-2.916609" lon="-41.774107">
            <ele>15.0</ele>
        </trkpt>
        <trkpt lat="-2.916549" lon="-41.775059">
            <ele>12.0</ele>
        </trkpt>
        <trkpt lat="-2.915477" lon="-41.774997">
            <ele>13.0</ele>
        </trkpt>
        <trkpt lat="-2.915541" lon="-41.77393">
            <ele>14.8</ele>
        </trkpt>
        <trkpt lat="-2.915545" lon="-41.77381">
            <ele>14.5</ele>
        </trkpt>
        <trkpt lat="-2.914557" lon="-41.773748">
            <ele>14.5</ele>
        </trkpt>
        <trkpt lat="-2.914438" lon="-41.77374">
            <ele>14.5</ele>
        </trkpt>
        <trkpt lat="-2.913332" lon="-41.773686">
            <ele>12.3</ele>
        </trkpt>
        <trkpt lat="-2.913332" lon="-41.773803">
            <ele>12.5</ele>
        </trkpt>
        <trkpt lat="-2.91322" lon="-41.773797">
            <ele>12.5</ele>
        </trkpt>
        <trkpt lat="-2.913332" lon="-41.773803">
            <ele>12.5</ele>
        </trkpt>
        <trkpt lat="-2.913332" lon="-41.773686">
            <ele>12.3</ele>
        </trkpt>
        <trkpt lat="-2.912268" lon="-41.773628">
            <ele>13.8</ele>
        </trkpt>
        <trkpt lat="-2.912151" lon="-41.773622">
            <ele>14.3</ele>
        </trkpt>
        <trkpt lat="-2.911706" lon="-41.773601">
            <ele>14.0</ele>
        </trkpt>
        <trkpt lat="-2.911084" lon="-41.773571">
            <ele>14.0</ele>
        </trkpt>
        <trkpt lat="-2.911117" lon="-41.772995">
            <ele>12.8</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911518" lon="-41.772731">
            <ele>12.5</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911522" lon="-41.772574">
            <ele>12.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911549" lon="-41.772272">
            <ele>12.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911602" lon="-41.77101">
            <ele>12.5</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911646" lon="-41.770298">
            <ele>13.5</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911684" lon="-41.769573">
            <ele>14.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.911019" lon="-41.769539">
            <ele>13.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.91035" lon="-41.769503">
            <ele>12.8</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.909051" lon="-41.769432">
            <ele>9.0</ele>
        </trkpt>
        <trkpt lat="-2.908781" lon="-41.769417">
            <ele>8.5</ele>
        </trkpt>
        <trkpt lat="-2.908007" lon="-41.769381">
            <ele>7.0</ele>
        </trkpt>
        <trkpt lat="-2.908083" lon="-41.768063">
            <ele>7.0</ele>
        </trkpt>
        <trkpt lat="-2.908833" lon="-41.76809">
            <ele>8.3</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.908795" lon="-41.769062">
            <ele>8.3</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.908781" lon="-41.769417">
            <ele>8.5</ele>
        </trkpt>
        <trkpt lat="-2.909051" lon="-41.769432">
            <ele>9.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.91035" lon="-41.769503">
            <ele>12.8</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.910414" lon="-41.768181">
            <ele>12.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.910486" lon="-41.766853">
            <ele>12.8</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.910567" lon="-41.76553">
            <ele>11.8</ele>
        </trkpt>
        <trkpt lat="-2.9119" lon="-41.7656">
            <ele>14.0</ele>
        </trkpt>
        <trkpt lat="-2.913229" lon="-41.765679">
            <ele>15.5</ele>
        </trkpt>
        <trkpt lat="-2.913883" lon="-41.765718">
            <ele>16.5</ele>
        </trkpt>
        <trkpt lat="-2.914555" lon="-41.765757">
            <ele>17.8</ele>
        </trkpt>
        <trkpt lat="-2.915895" lon="-41.765836">
            <ele>18.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.915979" lon="-41.764502">
            <ele>17.3</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        <trkpt lat="-2.916017" lon="-41.763784">
            <ele>18.0</ele>
            <extensions>
            <gpxtpx:TrackPointExtension>
            <gpxtpx:Extensions>
                <surface>paved</surface>
            </gpxtpx:Extensions>
            </gpxtpx:TrackPointExtension>
            </extensions>
        </trkpt>
        </trkseg>
    </trk>
    </gpx>
    """);

    Polyline polyline = Polyline(
      polylineId: const PolylineId('direction'),
      color: Colors.blue,
      points: List.empty(growable: true),
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      jointType: JointType.round,
      geodesic: true,
    );

    for (int i = 0; i < gpx.trks.length; i++) {
      for (int j = 0; j < gpx.trks[i].trksegs.length; j++) {
        for (int k = 0; k < gpx.trks[i].trksegs[j].trkpts.length; k++) {
          double latitude = gpx.trks[i].trksegs[j].trkpts[k].lat!;
          double longitude = gpx.trks[i].trksegs[j].trkpts[k].lon!;
          polyline.points.add(LatLng(latitude, longitude));
        }
      }
    }

    _directionPolyline.add(polyline);
  }

  @override
  Widget build(BuildContext context) {
    _generatePolylines();

    return CustomScaffold(
        title: 'Mapa',
        body: GoogleMap(
          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
          polylines: _directionPolyline,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _directionPolyline.first.points[0],
            zoom: 20.151926040649414,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
