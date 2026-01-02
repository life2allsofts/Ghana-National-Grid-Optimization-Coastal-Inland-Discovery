# Regional Parameter Decision Guide

## Research-Based Recommendations

### 1. Western Region (Coastal Ghana)
- **Use**: Published parameters
- **Accuracy**: 1.3 meters RMS
- **Reason**: Published parameters achieve survey-grade accuracy here
- **Implementation**: "Ghana Grid Classic" app
- **Boundary**: Latitude < 5.5° AND Longitude > -2.0°

### 2. Greater Accra (Transition Zone)
- **Use**: Optimized parameters
- **Accuracy**: 2.1 meters RMS (70% improvement)
- **Reason**: Parameters optimized using Accra control points
- **Implementation**: "Ghana Grid Optimized" app
- **Boundary**: Latitude: 5.5°-6.0°, Longitude: -0.8°-0.5°

### 3. Ashanti Region (Central Inland)
- **Use**: Optimized parameters
- **Accuracy**: 9.0 meters RMS (47% improvement)
- **Reason**: Significant improvement over published parameters
- **Implementation**: "Ghana Grid Optimized" app

### 4. Brong Ahafo (Northern Inland)
- **Use**: Optimized parameters
- **Accuracy**: 19.2 meters RMS (32% improvement)
- **Reason**: Addresses northward error accumulation
- **Implementation**: "Ghana Grid Optimized" app

### 5. Upper East (Far North)
- **Use**: Optimized parameters
- **Accuracy**: 54.2 meters RMS (12% improvement)
- **Reason**: Moderate improvement in extreme north
- **Implementation**: "Ghana Grid Optimized" app

## Desktop-Mobile Coordination

### False Easting Values
| Platform | False Easting (x₀) | Notes |
|----------|-------------------|-------|
| Desktop GIS | 900,000 m | Standard for Topcon, ArcGIS, QGIS |
| GPS Receivers | 900,000 m | Hardware standard |
| Mobile/Web Apps | 274,291.3 m | ≈900,000 feet × 0.3048 |

### Conversion Between Platforms
To convert desktop coordinates to mobile:
```
mobile_easting = desktop_easting - 625,708.7
mobile_northing = desktop_northing  # unchanged
```

## Implementation Code Example
```python
def select_parameters(lat, lon):
    # Western Region boundary
    if -3.0 < lon < -1.5 and 4.5 < lat < 5.5:
        return "published"  # Ghana Grid Classic
    else:
        return "optimized"  # Ghana Grid Optimized