/*
 * Shoelace Formula Implementation for Polygon Area Calculation
 * Excerpt from the research implementation
 */

import 'dart:math';
import 'dart:math' as math;

class AreaCalculator {
  /// Calculate polygon area using Shoelace formula for grid coordinates
  static double calculateGridArea(List<Map<String, double>> points) {
    double sum = 0.0;
    int n = points.length;
    
    for (int i = 0; i < n; i++) {
      Map<String, double> current = points[i];
      Map<String, double> next = points[(i + 1) % n];
      
      sum += (current['easting']! * next['northing']!) - 
             (next['easting']! * current['northing']!);
    }
    
    return (sum.abs() / 2.0); // Area in square feet
  }
  
  /// Convert area from square feet to various units
  static Map<String, double> convertArea(double areaSqFt) {
    return {
      'square_feet': areaSqFt,
      'square_meters': areaSqFt * 0.09290304,
      'acres': areaSqFt / 43560.0,
      'hectares': (areaSqFt / 43560.0) * 0.404686,
    };
  }
  
  /// Calculate area for geographic coordinates (simplified spherical approximation)
  static double calculateGeographicArea(List<Map<String, double>> points) {
    // Convert to radians first
    List<Point> radPoints = points.map((p) {
      return Point(
        radians(p['latitude']!),
        radians(p['longitude']!)
      );
    }).toList();
    
    double sum = 0.0;
    int n = radPoints.length;
    
    for (int i = 0; i < n; i++) {
      Point current = radPoints[i];
      Point next = radPoints[(i + 1) % n];
      
      sum += (next.x - current.x) * 
             (2 + sin(current.y) + sin(next.y));
    }
    
    // Earth's radius in meters
    const R = 6371000.0;
    return (sum.abs() * R * R / 2.0);
  }
}

class Point {
  final double x; // latitude in radians
  final double y; // longitude in radians
  
  Point(this.x, this.y);
}

double radians(double degrees) {
  return degrees * pi / 180.0;
}

double sin(double angle) {
  return math.sin(angle);
}