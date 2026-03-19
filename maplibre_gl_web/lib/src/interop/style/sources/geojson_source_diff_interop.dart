@JS('maplibregl')
library;

import 'dart:js_interop';
import 'package:maplibre_gl_web/src/interop/geo/geojson_interop.dart';

extension type GeoJsonSourceDiffJsImpl._(JSObject _) implements JSObject {
  external factory GeoJsonSourceDiffJsImpl({
    bool? removeAll,
    JSArray<JSAny>? remove,
    JSArray<FeatureJsImpl>? add,
    JSArray<GeoJsonFeatureDiffJsImpl>? update,
  });

  external bool? get removeAll;

  external JSArray<JSAny>? get remove;

  external JSArray<FeatureJsImpl>? get add;

  external JSArray<GeoJsonFeatureDiffJsImpl>? get update;
}

extension type GeoJsonFeatureDiffJsImpl._(JSObject _) implements JSObject {
  external factory GeoJsonFeatureDiffJsImpl({
    JSAny id,
    GeometryJsImpl? newGeometry,
    bool? removeAllProperties,
    JSArray<JSString>? removeProperties,
    JSArray<FeaturePropertyUpdateJsImpl>? addOrUpdateProperties,
  });

  external JSAny get id;

  external GeometryJsImpl? get newGeometry;

  external bool? get removeAllProperties;

  external JSArray<JSString>? get removeProperties;

  external JSArray<FeaturePropertyUpdateJsImpl>? get addOrUpdateProperties;
}

extension type FeaturePropertyUpdateJsImpl._(JSObject _) implements JSObject {
  external factory FeaturePropertyUpdateJsImpl({
    String key,
    JSAny? value,
  });

  external String get key;

  external JSAny? get value;
}
