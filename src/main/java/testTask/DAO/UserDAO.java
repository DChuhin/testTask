package testTask.DAO;

import testTask.entities.User;

import java.util.List;

public interface UserDAO {

    public void addOrUpdateUser(User user);

    public List listUser();

    public void removeUser(Integer id);
}
