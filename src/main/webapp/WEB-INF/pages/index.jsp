<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <title>Test task</title>
    <style>
        .username.ng-valid {
            background-color: lightgreen;
        }

        .username.ng-dirty.ng-invalid-required {
            background-color: red;
        }

        .username.ng-dirty.ng-invalid-minlength {
            background-color: yellow;
        }

        .email.ng-valid {
            background-color: lightgreen;
        }

        .email.ng-dirty.ng-invalid-required {
            background-color: red;
        }

        .email.ng-dirty.ng-invalid-email {
            background-color: yellow;
        }

        .layer {
            margin: 0;
            padding-left: 10px;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body ng-app="user" class="ng-cloak">
<div class="generic-container" ng-controller="UserController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">User Add or Edit Form </span></div>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.user.id"/>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="name">Name</label>

                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.name" id="name"
                                   class="username form-control input-sm" placeholder="Enter your name" required
                                   ng-minlength="3"/>

                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.name.$error.required">This is a required field</span>
                                <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.name.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="surname">Surname</label>

                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.surname" id="surname"
                                   class="username form-control input-sm" placeholder="Enter your surname." required
                                   ng-minlength="3"/>

                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.surname.$error.required">This is a required field</span>
                                <span ng-show="myForm.surname.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.surname.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="birthday">Birhtday</label>

                        <div class="col-md-7">
                            <input type="date" ng-model="ctrl.date" ng-change="ctrl.setBirthday()" id="birthday"
                                   class="form-control input-sm" placeholder="Enter your birthday" required/>

                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.date.$error.required">This is a required field</span>
                                <span ng-show="myForm.date.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="weight">Weight</label>

                        <div class="col-md-7">
                            <input type="number" ng-model="ctrl.user.weight" id="weight" class="form-control input-sm"
                                   placeholder="Enter your weight." required ng-maxlength="4"/>

                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.weight.$error.required">This is a required field</span>
                                <span ng-show="myForm.weight.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm layer"
                               ng-disabled="myForm.$invalid">
                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm"
                                ng-disabled="myForm.$pristine">Reset Form
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">
            <label class="col-md-2 control-lable">Users per page</label>
            <input type="number" ng-model="ctrl.itemsPerPage" class="form-control input-sm"/>
        </div>
        <div class="tablecontainer">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th ng-click="ctrl.sort('id')">ID.
                        <span class="glyphicon sort-icon" ng-show="ctrl.sortKey=='id'"
                              ng-class="{'glyphicon-chevron-up':ctrl.reverse,'glyphicon-chevron-down':!ctrl.reverse}"></span>
                    </th>
                    <th ng-click="ctrl.sort('name')">Name
                        <span class="glyphicon sort-icon" ng-show="ctrl.sortKey=='name'"
                              ng-class="{'glyphicon-chevron-up':ctrl.reverse,'glyphicon-chevron-down':!ctrl.reverse}"></span>
                    </th>
                    <th ng-click="ctrl.sort('surname')">Surname
                        <span class="glyphicon sort-icon" ng-show="ctrl.sortKey=='surname'"
                              ng-class="{'glyphicon-chevron-up':ctrl.reverse,'glyphicon-chevron-down':!ctrl.reverse}"></span>
                    </th>
                    <th ng-click="ctrl.sort('birthday')">Birhday
                        <span class="glyphicon sort-icon" ng-show="ctrl.sortKey=='birthday'"
                              ng-class="{'glyphicon-chevron-up':ctrl.reverse,'glyphicon-chevron-down':!ctrl.reverse}"></span>
                    </th>
                    <th ng-click="ctrl.sort('weight')">Weight
                        <span class="glyphicon sort-icon" ng-show="ctrl.sortKey=='weight'"
                              ng-class="{'glyphicon-chevron-up':ctrl.reverse,'glyphicon-chevron-down':!ctrl.reverse}"></span>
                    </th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr dir-paginate="u in ctrl.users|orderBy:ctrl.sortKey:ctrl.reverse|itemsPerPage:ctrl.itemsPerPage">
                    <td><span ng-bind="u.id"></span></td>
                    <td><span ng-bind="u.name"></span></td>
                    <td><span ng-bind="u.surname"></span></td>
                    <td><span ng-bind="u.birthday|date"></span></td>
                    <td><span ng-bind="u.weight"></span></td>
                    <td>
                        <button type="button" ng-click="ctrl.edit(u)" class="btn btn-success custom-width">Edit</button>
                        <button type="button" ng-click="ctrl.remove(u)" class="btn btn-danger custom-width">Remove
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
            <dir-pagination-controls
                    max-size="5"
                    direction-links="true"
                    boundary-links="true">
            </dir-pagination-controls>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script type="text/javascript" src="resources/js/dirPagination.js">
lt</script>
<script type="text/javascript" src="resources/js/user_service.js"></script>
<script type="text/javascript" src="resources/js/user_controller.js"></script>
</body>
</html>