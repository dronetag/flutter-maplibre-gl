part of '../maplibre_gl.dart';

@Deprecated('MaplibreStyles was renamed to MapLibreStyles.')
typedef MaplibreStyles = MapLibreStyles;

/// MapLibre styles used mostly for demonstration.
abstract class MapLibreStyles {
  /// A very simple MapLibre demo style that shows only countries with their
  /// boundaries.
  // static const String demo = "https://demotiles.maplibre.org/style.json";
  static const String demo = "https://dronetag-maps.s3.eu-north-1.amazonaws.com/styles/style-default-light-free.json";
}
