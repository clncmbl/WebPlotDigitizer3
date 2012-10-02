WPD.Backend.DataModels.AxisData =  function() {
	
	var self = this;
	self.type = AxisTyes.none;
	self.axisPixels = [];
	self.calibrationData = [];
	self.isCalibrated = false;	
	
};

WPD.Backend.DataModels.AxisTypes = {
	xy: 'xy',
	none: 'none',
	polar: 'polar',
	ternary: 'ternary'
};
