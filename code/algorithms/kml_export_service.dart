/*
 * KML Export Service for GIS Integration
 * Excerpt from the research implementation
 */

class KMLExportService {
  /// Generate KML file content from survey data
  static String generateKML({
    required List<SurveyPoint> points,
    required String polygonName,
    required double calculatedArea,
  }) {
    StringBuffer kml = StringBuffer();
    
    // KML Header
    kml.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    kml.writeln('<kml xmlns="http://www.opengis.net/kml/2.2">');
    kml.writeln('<Document>');
    
    // Document metadata
    kml.writeln('<name>$polygonName</name>');
    kml.writeln('<description>');
    kml.writeln('Survey Data exported from ITA-Gh-Surveyor GPS\n');
    kml.writeln('Area Calculation: ${calculatedArea.toStringAsFixed(2)} square meters\n');
    kml.writeln('Generated: ${DateTime.now().toIso8601String()}');
    kml.writeln('</description>');
    
    // Style for polygon
    kml.writeln('<Style id="surveyPolygon">');
    kml.writeln('<LineStyle>');
    kml.writeln('<color>ff00ff00</color>'); // Green color
    kml.writeln('<width>3</width>');
    kml.writeln('</LineStyle>');
    kml.writeln('<PolyStyle>');
    kml.writeln('<color>7f00ff00</color>'); // Semi-transparent green
    kml.writeln('<fill>1</fill>');
    kml.writeln('<outline>1</outline>');
    kml.writeln('</PolyStyle>');
    kml.writeln('</Style>');
    
    // Polygon coordinates
    kml.writeln('<Placemark>');
    kml.writeln('<name>$polygonName</name>');
    kml.writeln('<styleUrl>#surveyPolygon</styleUrl>');
    kml.writeln('<Polygon>');
    kml.writeln('<outerBoundaryIs>');
    kml.writeln('<LinearRing>');
    kml.writeln('<coordinates>');
    
    // Add all points
    for (var point in points) {
      kml.writeln('${point.longitude},${point.latitude},0');
    }
    
    // Close the polygon
    if (points.isNotEmpty) {
      kml.writeln('${points.first.longitude},${points.first.latitude},0');
    }
    
    kml.writeln('</coordinates>');
    kml.writeln('</LinearRing>');
    kml.writeln('</outerBoundaryIs>');
    kml.writeln('</Polygon>');
    kml.writeln('</Placemark>');
    
    // Close document
    kml.writeln('</Document>');
    kml.writeln('</kml>');
    
    return kml.toString();
  }
}

class SurveyPoint {
  final double latitude;
  final double longitude;
  final String id;
  final double? easting;
  final double? northing;
  
  SurveyPoint({
    required this.latitude,
    required this.longitude,
    required this.id,
    this.easting,
    this.northing,
  });
}