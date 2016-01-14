package testTask.service;

import testTask.entities.User;

import java.util.List;

public interface UserService {

    public void addOrUpdateUser(User user);

    public List<User> listUser();

    public void removeUser(Integer id);

}
