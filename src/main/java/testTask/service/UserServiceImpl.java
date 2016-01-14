package testTask.service;

import testTask.DAO.UserDAO;
import testTask.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import testTask.service.UserService;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    UserDAO userDAO;

    @Override
    public void addOrUpdateUser(User user) {
        userDAO.addOrUpdateUser(user);
    }

    @Override
    public List<User> listUser() {
        return userDAO.listUser();
    }

    @Override
    public void removeUser(Integer id) {
        userDAO.removeUser(id);
    }
}
