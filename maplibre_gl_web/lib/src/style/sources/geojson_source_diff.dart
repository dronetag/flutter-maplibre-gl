import 'dart:js_interop';

import 'package:maplibre_gl_web/src/geo/geojson.dart';
import 'package:maplibre_gl_web/src/interop/js.dart';
import 'package:maplibre_gl_web/src/interop/style/sources/geojson_source_diff_interop.dart';

class GeoJsonSourceDiff extends JsObjectWrapper<GeoJsonSourceDiffJsImpl> {
  factory GeoJsonSourceDiff({
    bool? removeAll,
    List<GeoJsonFeatureId>? remove,
    List<Feature>? add,
    List<GeoJsonFeatureDiff>? update,
  }) {
    return GeoJsonSourceDiff.fromJsObject(GeoJsonSourceDiffJsImpl(
      removeAll: removeAll,
      remove: remove,
      add: add?.map((feature) => feature.jsObject).nonNulls.toList(),
      update: update?.map((featureDiff) => featureDiff.jsObject).toList(),
    ));
  }

  GeoJsonSourceDiff.fromJsObject(super.jsObject) : super.fromJsObject();
}

class GeoJsonFeatureDiff extends JsObjectWrapper<GeoJsonFeatureDiffJsImpl> {
  factory GeoJsonFeatureDiff({
    GeoJsonFeatureId id,
    Geometry? newGeometry,
    bool? removeAllProperties,
    List<String>? removeProperties,
    List<FeaturePropertyUpdate>? addOrUpdateProperties,
  }) {
    return GeoJsonFeatureDiff.fromJsObject(GeoJsonFeatureDiffJsImpl(
      id: id,
      newGeometry: newGeometry?.jsObject,
      removeAllProperties: removeAllProperties,
      removeProperties: removeProperties,
      addOrUpdateProperties:
          addOrUpdateProperties?.map((property) => property.jsObject).toList(),
    ));
  }

  GeoJsonFeatureDiff.fromJsObject(super.jsObject) : super.fromJsObject();
}

class FeaturePropertyUpdate
    extends JsObjectWrapper<FeaturePropertyUpdateJsImpl> {
  factory FeaturePropertyUpdate(String key, dynamic value) {
    return FeaturePropertyUpdate.fromJsObject(FeaturePropertyUpdateJsImpl(
      key: key,
      value: value,
    ));
  }

  FeaturePropertyUpdate.fromJsObject(super.jsObject) : super.fromJsObject();
}
