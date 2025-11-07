part of '../maplibre_gl.dart';

sealed class OfflineRegionArea {
  const OfflineRegionArea();
}

final class OfflineRegionBounds extends OfflineRegionArea {
  final LatLngBounds bounds;

  const OfflineRegionBounds({required this.bounds});
}

final class OfflineRegionGeometry extends OfflineRegionArea {
  final Map<String, dynamic> geometry;

  const OfflineRegionGeometry({required this.geometry});
}

/// Description of region to be downloaded. Identifier will be generated when
/// the download is initiated.
class OfflineRegionDefinition {
  const OfflineRegionDefinition({
    required this.area,
    required this.mapStyleUrl,
    required this.minZoom,
    required this.maxZoom,
    this.includeIdeographs = false,
  });

  final OfflineRegionArea area;
  final String mapStyleUrl;
  final double minZoom;
  final double maxZoom;
  final bool includeIdeographs;

  @override
  String toString() =>
      "OfflineRegionDefinition, bounds = $area, mapStyleUrl = $mapStyleUrl, minZoom = $minZoom, maxZoom = $maxZoom";

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};

    switch (area) {
      case OfflineRegionBounds(:final bounds):
        data['bounds'] = bounds.toList();
      case OfflineRegionGeometry(:final geometry):
        data['geometry'] = geometry;
    }

    data['mapStyleUrl'] = mapStyleUrl;
    data['minZoom'] = minZoom;
    data['maxZoom'] = maxZoom;
    data['includeIdeographs'] = includeIdeographs;
    return data;
  }

  factory OfflineRegionDefinition.fromMap(Map<String, dynamic> map) {
    final area = switch (map) {
      _ when map.containsKey('bounds') =>
        OfflineRegionBounds(bounds: _latLngBoundsFromList(map['bounds'])),
      _ when map.containsKey('geometry') =>
        OfflineRegionGeometry(geometry: map['geometry']),
      _ => throw ArgumentError(
          'Offline region area was not provided via bounds or geometry field'),
    };

    return OfflineRegionDefinition(
      area: area,
      mapStyleUrl: map['mapStyleUrl'],
      // small integers may deserialize to Int
      minZoom: map['minZoom'].toDouble(),
      maxZoom: map['maxZoom'].toDouble(),
      includeIdeographs: map['includeIdeographs'] ?? false,
    );
  }

  static LatLngBounds _latLngBoundsFromList(List<dynamic> json) {
    return LatLngBounds(
      southwest: LatLng(json[0][0], json[0][1]),
      northeast: LatLng(json[1][0], json[1][1]),
    );
  }
}

/// Description of a downloaded region including its identifier.
class OfflineRegion {
  const OfflineRegion({
    required this.id,
    required this.definition,
    required this.metadata,
  });

  final int id;
  final OfflineRegionDefinition definition;
  final Map<String, dynamic> metadata;

  factory OfflineRegion.fromMap(Map<String, dynamic> json) {
    return OfflineRegion(
      id: json['id'],
      definition: OfflineRegionDefinition.fromMap(json['definition']),
      metadata: json['metadata'],
    );
  }

  @override
  String toString() =>
      "OfflineRegion, id = $id, definition = $definition, metadata = $metadata";
}
