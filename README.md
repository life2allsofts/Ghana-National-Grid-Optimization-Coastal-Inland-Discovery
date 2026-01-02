# Ghana National Grid Optimization Research: Coastal-Inland Divide and Desktop-Mobile Implementation

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18133088.svg)](https://doi.org/10.5281/zenodo.18133088)

## Research Overview
This repository contains the research materials for **"Bridging the Desktop-Mobile Divide: Regional Optimization of Ghana's National Grid for Mobile and Web Applications"**. The research documents three critical discoveries:

1. **Coastal/Inland Accuracy Divide**: Published Ghana Grid parameters achieve 1.3-meter accuracy in Western Region but degrade to 61.7 meters in Upper East
2. **Desktop-Mobile Implementation Inconsistency**: Desktop GIS software uses false easting of 900,000 meters while mobile/web applications use 274,291.3 meters (≈900,000 feet)
3. **Regional Optimization Framework**: Region-specific parameter tuning achieves 70% improvement in Greater Accra (6.9 m → 2.1 m RMS)

## Key Findings

### Regional Accuracy Analysis (259 validation points from 490-point database)
| Region | Zone | Points | Published RMS | Optimized RMS | Improvement |
|--------|------|--------|---------------|---------------|-------------|
| Western | Coastal | 65 | **1.3 m** | 10.6 m | -715% |
| Greater Accra | Transition | 77 | 6.9 m | **2.1 m** | 70% |
| Ashanti | Inland | 46 | 16.9 m | **9.0 m** | 47% |
| Brong Ahafo | Inland | 50 | 28.1 m | **19.2 m** | 32% |
| Upper East | Far North | 21 | 61.7 m | **54.2 m** | 12% |
| **Inland Total** | | **194** | **28.4 m** | **21.1 m** | **26%** |

### Parameter Optimization
Two parameters were empirically tuned for mobile/web applications:
- **Latitude of Origin (φ₀)**: 4.669448° → 4.669382° (Δ = -0.000066° ≈ -7.3m south)
- **False Easting (E₀)**: 274,291.3 m → 274,286.8 m (Δ = -4.5m west)

### Desktop-Mobile Interoperability Discovery
Critical implementation discrepancy identified:
- **Desktop GIS** (Topcon, ArcGIS, QGIS, GPS receivers): `+x_0=900000` (meters)
- **Mobile/Web Applications**: `+x_0=274291.3` (meters, ≈900,000 feet)
- **Relationship**: 900,000 ft × 0.3048 = 274,320 m ≈ 274,291.3 m

## System Implementation

### Platform-Specific Development
- **Mobile Application**: Flutter (Android/iOS) with offline capability
- **Web Application**: React Native for desktop/mobile browser access
- **Dual-App Strategy**: Separate applications for coastal (published params) and inland (optimized params)

### Production Applications
- **Ghana Grid Classic**: Published parameters for Western Region (1.3 m accuracy)
- **Ghana Grid Optimized**: Optimized parameters for inland Ghana (26% average improvement)

## Research Components
This repository contains:

1. **Academic Paper**: Complete LaTeX source and compiled PDF
2. **Research Datasets**: 490 control points with 259-point validation subset
3. **Algorithm Excerpts**: Core transformation and analysis code
4. **Validation Results**: Regional accuracy analysis across Ghana

## Full Production Implementation
The production applications implementing this research are available separately:
- **Mobile App Repository**: [life2allsofts/ita_gh_surveyor_gps](https://github.com/life2allsofts/ita_gh_surveyor_gps)
- **Current Version**: v1.5.0+ with regional parameter optimization
- **Platforms**: Android, iOS, Web (React Native)
