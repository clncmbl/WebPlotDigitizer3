WPD.Backend.DataModels.PlotData =  function() {
	var self = this;
	self.dataPoints = [];
	self.pixels = [];
	self.numPoints = 0;
	
	self.AddData = function() {
		self.numPoints = self.numPoints + 1;
	};
	
	self.Clear = function() {
		self.dataPoints = [];
		self.pixels = [];
		self.numPoints = 0;
	};
};