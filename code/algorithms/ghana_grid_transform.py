"""
Ghana Grid Transformation with Desktop-Mobile Parameter Support
Excerpt from research implementation
"""

class GhanaGridTransformer:
    """Transforms coordinates between Ghana Grid and WGS84 with platform-aware parameters"""
    
    # DESKTOP PARAMETERS (EPSG:2136 - Topcon, ArcGIS, QGIS, GPS receivers)
    DESKTOP_PARAMS = {
        'lat_0': 4.669448,      # Latitude of origin (degrees)
        'lon_0': -1.0,          # Central meridian (degrees)
        'k_0': 0.99975,         # Scale factor
        'x_0': 900000.0,        # False easting (meters) - DESKTOP STANDARD
        'y_0': 0.0,             # False northing (meters)
        'ellps': 'clrk80',      # Clarke 1880 ellipsoid
    }
    
    # MOBILE/WEB OPTIMIZED PARAMETERS (This research)
    MOBILE_PARAMS = {
        'lat_0': 4.669382,      # Δ = -0.000066° ≈ -7.3m south
        'lon_0': -1.0,          # Unchanged
        'k_0': 0.99975,         # Unchanged
        'x_0': 274286.8,        # Δ = -4.5m west (from 274,291.3 m)
        'y_0': 0.0,             # Unchanged
        'ellps': 'clrk80',      # Unchanged
    }
    
    # ELLIPSOID CONSTANTS
    CLARKE_1880 = {
        'a': 6378249.145,       # Semi-major axis (m)
        'e2': 0.006803481       # Eccentricity squared
    }
    
    @staticmethod
    def select_parameters(platform='mobile', region='inland'):
        """
        Select appropriate parameters based on platform and region
        
        Args:
            platform: 'desktop' or 'mobile'
            region: 'coastal' or 'inland'
            
        Returns:
            Dictionary of projection parameters
        """
        if platform == 'desktop':
            return GhanaGridTransformer.DESKTOP_PARAMS
        else:  # mobile/web
            if region == 'coastal':
                # Use published mobile parameters for coastal regions
                return {
                    **GhanaGridTransformer.MOBILE_PARAMS,
                    'lat_0': 4.669448,  # Original published value
                    'x_0': 274291.3,    # Original published value
                }
            else:
                return GhanaGridTransformer.MOBILE_PARAMS
    
    @staticmethod
    def convert_desktop_to_mobile(easting_m, northing_m):
        """
        Convert coordinates from desktop (900,000 m) to mobile (274,291.3 m) false easting
        
        Args:
            easting_m: Easting in meters from desktop software
            northing_m: Northing in meters from desktop software
            
        Returns:
            Tuple of (easting_m_mobile, northing_m_mobile)
        """
        # Desktop uses x_0 = 900,000 m, mobile uses x_0 ≈ 274,291.3 m
        # The difference is: 900,000 - 274,291.3 = 625,708.7 m
        
        # Convert: mobile_easting = desktop_easting - 625,708.7
        mobile_easting = easting_m - 625708.7
        
        # Northing remains the same (both use y_0 = 0)
        return mobile_easting, northing_m
    
    @staticmethod
    def analyze_regional_performance(points_data, params):
        """
        Analyze accuracy across different regions
        
        Args:
            points_data: List of control points with known positions
            params: Transformation parameters to test
            
        Returns:
            Dictionary of regional RMS errors
        """
        results = {
            'western': {'errors': [], 'rms': 0},
            'accra': {'errors': [], 'rms': 0},
            'ashanti': {'errors': [], 'rms': 0},
            'brong_ahafo': {'errors': [], 'rms': 0},
            'upper_east': {'errors': [], 'rms': 0},
        }
        
        # Implementation would calculate errors for each region
        # This is a simplified placeholder
        
        return results