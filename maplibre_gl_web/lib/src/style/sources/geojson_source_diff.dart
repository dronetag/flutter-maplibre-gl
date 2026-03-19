import 'dart:js_interop';

import 'package:maplibre_gl_web/src/utils.dart' as utils;
import 'package:maplibre_gl_web/src/geo/geojson.dart';
import 'package:maplibre_gl_web/src/interop/js.dart';
import 'package:maplibre_gl_web/src/interop/style/sources/geojson_source_diff_interop.dart';

// TODO define as "number | string"
typedef GeoJsonFeatureId = dynamic;

class GeoJsonSourceDiff extends JsObjectWrapper<GeoJsonSourceDiffJsImpl> {
  factory GeoJsonSourceDiff({
    bool? removeAll,
    List<GeoJsonFeatureId>? remove,
    List<Feature>? add,
    List<GeoJsonFeatureDiff>? update,
  }) {
    return GeoJsonSourceDiff.fromJsObject(GeoJsonSourceDiffJsImpl(
      removeAll: removeAll,
      remove: remove?.map((id) => utils.jsify(id)).nonNulls.toList().toJS,
      add: add?.map((feature) => feature.jsObject).nonNulls.toList().toJS,
      update: update?.map((featureDiff) => featureDiff.jsObject).toList().toJS,
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
      removeProperties: removeProperties?.map((str) => str.toJS).toList().toJS,
      addOrUpdateProperties: addOrUpdateProperties
          ?.map((property) => property.jsObject)
          .toList()
          .toJS,
    ));
  }

  GeoJsonFeatureDiff.fromJsObject(super.jsObject) : super.fromJsObject();
}

class FeaturePropertyUpdate
    extends JsObjectWrapper<FeaturePropertyUpdateJsImpl> {
  factory FeaturePropertyUpdate(String key, dynamic value) {
    return FeaturePropertyUpdate.fromJsObject(FeaturePropertyUpdateJsImpl(
      key: key,
      value: utils.jsify(value),
    ));
  }

  FeaturePropertyUpdate.fromJsObject(super.jsObject) : super.fromJsObject();
}
