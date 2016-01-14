package testTask.controllers;


import testTask.service.UserService;
import testTask.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<User>> listusers() {
        return new ResponseEntity<List<User>>(userService.listUser(), HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<User> addUser(@RequestBody User user) {
        userService.addOrUpdateUser(user);

        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    @RequestMapping(value = "/{userId}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteuser(@PathVariable("userId") Integer userId) {
        userService.removeUser(userId);
        return new ResponseEntity<User>(new User(), HttpStatus.OK);
    }
}