App.module2 = (function() {

	// Private Static
	var privateShared = 1;
	
	// "Constructor" or the actual object that is returned - class?
	var cls = function() {
	
		// Private to an instance
		var pvtToInstance = 0;
		
		// Public Methods
		this.setVar = function(value) {
			pvtToInstance = value;
		};
		
		this.getVar = function() {
			return pvtToInstance + privateShared;
		};		
	};
	
	// Public static.
	cls.printVar = function() {
		return privateShared;
	};
	
	cls.setStatic = function(value) {
		privateShared = value;
	};
	
	// Public, shared across instances
	cls.prototype = {
		dispVar: function() {
			console.log(this.getVar()); 
		}
	};
	
	return cls;
	
})();

// Source: http://stackoverflow.com/questions/1114024/constructors-in-javascript-objects