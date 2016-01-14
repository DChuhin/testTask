var app = angular.module("user",['angularUtils.directives.dirPagination']);
app.service('UserService', ['$http', function($http){
    this.submit= function(user){
        return $http.put('/testTask/user',user);
    };
    this.remove = function(id){
        return $http.delete('/testTask/user/'+id);
        //return $http.delete('/testTask/user/test/check');
    };
    this.get = function() {
        return $http.get('/testTask/user');
    };
}]);
