(function() {

	var app = angular.module('starter.home');
    app.controller('HomeController',['$scope','CategoryService', '$location','$cordovaContacts','$cordovaCapture','$rootScope','$cordovaCamera','$cordovaImagePicker' ,function($scope,CategoryService,$location,$cordovaContacts,$cordovaCapture,$rootScope,$cordovaCamera,$cordovaImagePicker) { 
            //---selct video from gallary
		    $scope.iv1 = function() {

				var options = {
				//maximumImagesCount: 10,
				/*quality: 80,
				destinationType: Camera.DestinationType.FILE_URI,
				sourceType: Camera.PictureSourceType.PHOTOLIBRARY,
				mediaType:Camera.MediaType.VIDEO
				*/
		        quality: 50,
		        destinationType: Camera.DestinationType.FILE_URI,
		        sourceType: Camera.PictureSourceType.SAVEDPHOTOALBUM,
		        mediaType: Camera.MediaType.VIDEO,
		        saveToPhotoAlbum: true
			    };

				/*$cordovaImagePicker.getPictures(options)
				.then(function (results) {
				for (var i = 0; i < results.length; i++) {
				console.log('Image URI: ' + results[i]);
				}
				}, function(error) {
				// error getting photos
				});*/
      

		      $cordovaCamera.getPicture(options).then(function(results) {
				    }, function(err) {
				        alert("Failed because: " + err);
				        console.log('Failed because: ' + err);
				    });

            };


			//---capture video 
		     $scope.iv = function() {
		       console.log('iv');
		       //--15 sec
		       var options = { limit: 3, duration: 15 };

				    $cordovaCapture.captureVideo(options).then(function(videoData) {
				      // Success! Video data is here

				      console.log('sucs....');
    
				    }, function(err) {
				      // An error occurred. Show a message to the user
				      console.log('err....');
    
				    });
				
		     };


            //--for uplaoding video
			 $scope.upload = function() {
			        var options = {
			            fileKey: "avatar",
			            fileName: "filename.mp4",
			            chunkedMode: false,
			            mimeType: "video/mp4"
			        };
			        $cordovaFileTransfer.upload("http://www.samplewebsite.com/upload", "file:/storage/....mp4", options).then(function(result) {
			            console.log("SUCCESS: " + JSON.stringify(result.response));
			        }, function(err) {
			            console.log("ERROR: " + JSON.stringify(err));
			        }, function (progress) {
			            // constant progress updates
			        });
			    }


	

    }])

	app.controller('AppController', ['$scope', '$location', '$ionicActionSheet', '$ionicSideMenuDelegate','CategoryService', function($scope, $location, $ionicActionSheet, $ionicSideMenuDelegate, CategoryService) {
	  
	$scope.categories = [];
   	$scope.sub_categories = [];
   	
			CategoryService.getAll().$promise.then(function(response){
				var ItemTypes = response.ItemType;
				console.log(ItemTypes);
				for (var i = 0; i < ItemTypes.length; i++) {
					var obj = {
						category: ItemTypes[i].ItemType,
						sub_cat: ItemTypes[i].ItemCategory,
					}
					$scope.categories.push(obj);
				};
		

			}, function(err){	
				console.log(err);
			})

 		  $scope.toggleGroup = function(group) {
		    if ($scope.isGroupShown(group)) {
		      $scope.shownGroup = null;
		    } else {
		      $scope.shownGroup = group;
		    }
		  };
		  $scope.isGroupShown = function(group) {
		    return $scope.shownGroup === group;
		  };
		  	/*go to sub cat*/

		     $scope.navigate = function(sub_cat_id) {
		       $location.path('/ad-list/' + sub_cat_id);
		     };


  	
	}]);
   
	
})();

