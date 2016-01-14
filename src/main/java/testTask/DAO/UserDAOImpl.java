package testTask.DAO;


import testTask.entities.User;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    SessionFactory sf;

    @Override
    public void addOrUpdateUser(User user) {
        sf.getCurrentSession().saveOrUpdate(user);
    }

    @Override
    public List<User> listUser() {
        Criteria criteria = sf.getCurrentSession().createCriteria(User.class);
        return criteria.list();
    }

    @Override
    public void removeUser(Integer id) {
        User user = (User) sf.getCurrentSession().load(
                User.class, id);
        if (null != user) {
            sf.getCurrentSession().delete(user);
        }
    }
}
