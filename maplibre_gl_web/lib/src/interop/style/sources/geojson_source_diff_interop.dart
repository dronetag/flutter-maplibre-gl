import 'package:js/js.dart';
import 'package:maplibre_gl_web/src/interop/geo/geojson_interop.dart';

// TODO define as "number | string"
typedef GeoJsonFeatureId = dynamic;

@JS()
@anonymous
class GeoJsonSourceDiffJsImpl {
  external factory GeoJsonSourceDiffJsImpl({
    bool? removeAll,
    List<GeoJsonFeatureId>? remove,
    // TODO use [FeatureJsImpl] when it uses js_interop
    List<FeatureJsImpl>? add,
    List<GeoJsonFeatureDiffJsImpl>? update,
  });

  external bool? get removeAll;

  external List<GeoJsonFeatureId>? get remove;

  external List<FeatureJsImpl>? get add;

  external List<GeoJsonFeatureDiffJsImpl>? get update;
}

@JS()
@anonymous
class GeoJsonFeatureDiffJsImpl {
  external factory GeoJsonFeatureDiffJsImpl({
    GeoJsonFeatureId id,
    GeometryJsImpl? newGeometry,
    bool? removeAllProperties,
    List<String>? removeProperties,
    List<FeaturePropertyUpdateJsImpl>? addOrUpdateProperties,
  });

  external GeoJsonFeatureId get id;

  external GeometryJsImpl? get newGeometry;

  external bool? get removeAllProperties;

  external List<String>? get removeProperties;

  external List<FeaturePropertyUpdateJsImpl>? get addOrUpdateProperties;
}

@JS()
@anonymous
class FeaturePropertyUpdateJsImpl {
  external factory FeaturePropertyUpdateJsImpl({
    String key,
    dynamic value,
  });

  external String get key;

  external dynamic get value;
}
