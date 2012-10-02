WPD.X.fa = function() {
	console.log("Hello ");
};

WPD.X.fb = function() {
	this.alpha = 1;
	this.beta = 2;
	this.fa();
};

WPD.X.fc = {
	d: 'd',
	e: 'e',
	f: function() {
		this.xx = 1;
		this.yy = 2;
	}
};