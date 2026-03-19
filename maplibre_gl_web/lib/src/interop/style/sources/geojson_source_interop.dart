@JS('maplibregl')
library;

import 'dart:js_interop';
import 'package:maplibre_gl_web/src/interop/geo/geojson_interop.dart';
import 'package:maplibre_gl_web/src/interop/style/sources/geojson_source_diff_interop.dart';

extension type GeoJsonSourceJsImpl._(JSObject _) implements JSObject {
  external FeatureCollectionJsImpl get data;

  external String get promoteId;

  external factory GeoJsonSourceJsImpl({
    String? type,
    String? promoteId,
    FeatureCollectionJsImpl data,
  });

  external GeoJsonSourceJsImpl setData(
      FeatureCollectionJsImpl featureCollection);

  external GeoJsonSourceJsImpl updateData(GeoJsonSourceDiffJsImpl diff);
}
