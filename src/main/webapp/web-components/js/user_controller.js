var app = angular.module("user");
app.controller("UserController", ["$scope", 'UserService', function ($scope, userService) {
    var self = this;
    self.sortKey = "id";
    self.reverse = false;
    self.sort = function (keyname) {
        self.sortKey = keyname;
        self.reverse = !self.reverse;
    }
    self.reset = function () {
        self.user = {id: null, name: '', surname: '', birthday: '', weight: ''};
    }
    self.reset();
    self.load = function () {
        userService.get().then(function successCallback(response) {
            self.users = response.data;
        }, function errorCallback(response) {
            self.users = [];
        });
    };
    self.load();
    self.itemsPerPage = 5;
    self.submit = function () {
        userService.submit(self.user).then(function successCallback(response) {
            console.log('user add or update success')
            self.load();
        }, function errorCallback(response) {
            console.log('user add or update error');
        });
    };
    self.remove = function (user) {
        userService.remove(user.id).then(function successCallback(response) {
            console.log('user delete success');
            self.load();
        }, function errorCallback(response) {
            console.log('user delete error');
        });
    };
    self.edit = function (user) {
        for (var attr in user) {
            self.user[attr] = user[attr];
        }
        self.date = new Date(user.birthday);
    }
    self.setBirthday = function () {
        self.user.birthday = self.date.getTime();
    }
}]);
