# Research Data Documentation

## Dataset Summary
This research utilizes a comprehensive geodetic control point database:

### Database Statistics
| Region | Validation Points | Total in Database |
|--------|-------------------|-------------------|
| Greater Accra | 77 | 231 |
| Western Region | 65 | 65 |
| Ashanti Region | 46 | 46 |
| Brong Ahafo | 50 | 50 |
| Upper East | 21 | 21 |
| Other Regions* | 0 | 77 |
| **Total** | **259** | **490** |

*Other regions include Eastern, Volta, Central, Northern, and Upper West regions - included for completeness but not used in validation.

### File Descriptions

#### 1. `regional-validation-results.csv`
- **Purpose**: Complete regional accuracy analysis across 5 regions
- **Format**: CSV with headers: `Region, Zone, Points, Published_RMS_m, Optimized_RMS_m, Improvement_Percent, Published_Mean_Lat_Shift_m, Published_Mean_Lon_Shift_m, Optimized_Mean_Lat_Shift_m, Optimized_Mean_Lon_Shift_m`
- **Source**: Direct validation using Survey Department control points

#### 2. `control-points-full.csv` (sample provided)
- **Purpose**: Complete 490-point database for field reference
- **Format**: CSV with headers: `ID, Region, Zone, Easting_ft, Northing_ft, Latitude_dd, Longitude_dd, Accuracy_Level`
- **Content**: Anonymized control points across Ghana

#### 3. `parameter-comparison.csv`
- **Purpose**: Documentation of parameter changes between desktop and mobile implementations
- **Content**: Comparison of false easting values and accuracy implications

## Validation Methodology
1. **Control Point Selection**: 259 high-precision points across 5 geographic zones
2. **Accuracy Metrics**: Root Mean Square (RMS) error in meters
3. **Regional Analysis**: Separate validation for coastal vs inland regions
4. **Statistical Significance**: Minimum 20 points per region (except Upper East with 21)

## Usage Notes
- Coordinates are in Ghana National Grid (feet) and WGS84 (decimal degrees)
- Validation subset (259 points) used for statistical analysis
- Full database (490 points) provided for field reference
- All data anonymized from official Survey Department sources
