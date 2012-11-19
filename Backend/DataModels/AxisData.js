WPD.Backend.DataModels.AxisTypes = {
	xy: 'xy',
	none: 'none',
	polar: 'polar',
	ternary: 'ternary'
};

WPD.Backend.DataModels.AxisData = (function() {
	// Private Static
	var numAxes = 0;
	var dm = WPD.Backend.DataModels;	// Shrink Namespace
	
	var dat = function() {
		// Private
		var _type = dm.AxisTypes.none;
		var _axisPixels = [];
		var _calibrationData = [];
		
		var self = this;
		
		// Public
		self.isCalibrated = false;
		
		this.Calibrate = function() {
			self.isCalibrated = true;
		};
		
		this.TestFn = function() {
			return self.isCalibrated;
		};
	};
	
	return dat;
})();
