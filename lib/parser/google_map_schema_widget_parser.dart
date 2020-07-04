/*
 * Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [GoogleMap]
@SchemaParser("GoogleMap", "https://schema.legytma.com.br/1.1.2/schema/widget/google_map.schema.json")
class GoogleMapSchemaWidgetParser extends SchemaWidgetParser<GoogleMap> {
  static final Logger _log = Logger("GoogleMapSchemaWidgetParser");

  /// Create instance of parser
  GoogleMapSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   GoogleMap builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer('map: $value');

    return GoogleMap(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      initialCameraPosition: SchemaWidget.parse<CameraPosition>(
          buildContext, value['initialCameraPosition']),
      myLocationEnabled: value["myLocationEnabled"] ?? false,
      mapType: SchemaWidget.parse<MapType>(
          buildContext, value["mapType"], MapType.normal),
      compassEnabled: value["compassEnabled"] ?? true,
      onTap: SchemaWidget.parse<ArgumentCallback<LatLng>>(
          buildContext, value['onTap']),
      padding: SchemaWidget.parse<EdgeInsets>(buildContext, value['padding']),
      onLongPress: SchemaWidget.parse<ArgumentCallback<LatLng>>(
          buildContext, value['onLongPress']),
      buildingsEnabled: value['buildingsEnabled'] ?? true,
      cameraTargetBounds: SchemaWidget.parse<CameraTargetBounds>(
          buildContext, value['cameraTargetBounds']),
      circles: SchemaWidget.parse<Set<Circle>>(buildContext, value['circles']),
      gestureRecognizers:
          SchemaWidget.parse<Set<Factory<OneSequenceGestureRecognizer>>>(
              buildContext, value['gestureRecognizers']),
      indoorViewEnabled: value['indoorViewEnabled'] ?? false,
      mapToolbarEnabled: value['mapToolbarEnabled'] ?? true,
      markers: SchemaWidget.parse<Set<Marker>>(buildContext, value['markers']),
      minMaxZoomPreference: SchemaWidget.parse<MinMaxZoomPreference>(
          buildContext,
          value['minMaxZoomPreference'],
          MinMaxZoomPreference.unbounded),
      myLocationButtonEnabled: value['myLocationButtonEnabled'] ?? true,
      onCameraIdle:
          SchemaWidget.parse<VoidCallback>(buildContext, value['onCameraIdle']),
      onCameraMove: SchemaWidget.parse<CameraPositionCallback>(
          buildContext, value['onCameraMove']),
      onCameraMoveStarted: SchemaWidget.parse<VoidCallback>(
          buildContext, value['onCameraMoveStarted']),
      onMapCreated: SchemaWidget.parse<MapCreatedCallback>(
          buildContext, value['onMapCreated']),
      polygons:
          SchemaWidget.parse<Set<Polygon>>(buildContext, value['polygons']),
      polylines:
          SchemaWidget.parse<Set<Polyline>>(buildContext, value['polylines']),
      rotateGesturesEnabled: value['rotateGesturesEnabled'] ?? true,
      scrollGesturesEnabled: value['scrollGesturesEnabled'] ?? true,
      tiltGesturesEnabled: value['tiltGesturesEnabled'] ?? true,
      trafficEnabled: value['trafficEnabled'] ?? false,
      zoomControlsEnabled: value['zoomControlsEnabled'] ?? true,
      zoomGesturesEnabled: value['zoomGesturesEnabled'] ?? true,
    );
  }
}
