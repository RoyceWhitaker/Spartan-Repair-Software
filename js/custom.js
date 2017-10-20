			var exec = require('child_process').execFile;

			var wizTree =function(){
			   console.log("wizTree() start");
			   exec('C:/Users/Amanita/Documents/github/spartan-repair-software/WizTree64.exe', function(err, data) {  
			        console.log(err)
			        console.log(data.toString());                       
			    });  
			}
			var clearDNS =function(){
			   console.log("clearDNS() start");
			   exec('C:/Users/Amanita/Documents/github/spartan-repair-software/dnsclear.bat', function(err, data) {  
			        console.log(err)
			        console.log(data.toString());                       
			    });  
			}