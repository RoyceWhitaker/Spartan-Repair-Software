			var exec = require('child_process').execFile;

			var wizTree =function(){
			   console.log("wizTree() start");
			   exec(__dirname . '/WizTree64.exe', function(err, data) {  
			        console.log(err)
			        console.log(data.toString());                       
			    });  
			}
			var clearDNS =function(){
			   console.log("clearDNS() start");
			   exec(__dirname . '/dnsclear.bat', function(err, data) {  
			        console.log(err)
			        console.log(data.toString());                       
			    });  
			}
			var virusRemoval =function(){
			   console.log("virusRemoval() start");
			   exec(__dirname . '/virusremoval.bat', function(err, data) {  
			        console.log(err)
			        console.log(data.toString());                       
			    });  
			}