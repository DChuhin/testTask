package testTask;

import org.junit.*;
import org.mockito.stubbing.Answer;
import testTask.entities.User;
import testTask.service.UserService;

import java.time.LocalDate;
import java.time.temporal.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

public class ServiceTests {

    private UserService userService;
    private Map<Integer, User> users = new HashMap<>();
    private static final int initSize = 5;

//    @BeforeClass
//    public static void prepareMock() {
//        userService = mock(UserService.class);
//    }

    @Before
    public void prepareUsers() {
        userService = mock(UserService.class);

        users = new HashMap<>();
        for (int i = 0; i < initSize; i++) {
            User user = generateUser(i);
            users.put(i, user);
        }
    }

    @Test
    public void getUsers() {
        when(userService.listUser()).thenReturn(new ArrayList<User>(users.values()));
        List<User> lu = userService.listUser();
        assertEquals(lu.size(), initSize);
        for (int i = 0; i < initSize; i++) {
            assertEquals(i, lu.get(i).getId());
        }
    }

    @Test
    public void testAdd() {
        doAnswer(s -> {
            User user = (User) s.getArguments()[0];
            checkNulls(user);
            int id = user.getId();
            if (users.get(id) == null)
                users.put(id, user);
            else
                users.replace(id, user);
            return user;
        }).when(userService).addOrUpdateUser(any());
        User user = generateUser(initSize + 1);
        userService.addOrUpdateUser(user);
        assertEquals(users.size(), initSize + 1);
    }

    @Test(expected = NullPointerException.class)
    public void testAddException() {
        doAnswer(s -> {
            User user = (User) s.getArguments()[0];
            checkNulls(user);
            int id = user.getId();
            if (users.get(id) == null)
                users.put(id, user);
            else
                users.replace(id, user);
            return user;
        }).when(userService).addOrUpdateUser(any());
        User user = generateUser(initSize + 1);
        user.setName(null);
        userService.addOrUpdateUser(user);
    }

    @Test
    public void testEdit() {
        doAnswer(s -> {
            User user = (User) s.getArguments()[0];
            checkNulls(user);
            int id = user.getId();
            if (users.get(id) == null)
                users.put(id, user);
            else
                users.replace(id, user);
            return user;
        }).when(userService).addOrUpdateUser(any());
        User user = generateUser(initSize - 1);
        String editedName = "editedName";
        user.setName(editedName);
        userService.addOrUpdateUser(user);
        assertEquals(users.get(initSize - 1).getName(), editedName);
    }

    @Test
    public void testRemove() {
        doAnswer(s -> {
            int id = (int) s.getArguments()[0];
            users.remove(id);
            return id;
        }).when(userService).removeUser(any());
        int id = 4;
        userService.removeUser(id);
        assertNull(users.get(id));
    }

//    @AfterClass
//    public static void cleanAll() {
//        userService = null;
//        users = null;
//    }

    private User generateUser(int id) {
        User user = new User();
        user.setId(id);
        user.setName("name" + id);
        user.setSurname("surname" + id);
        user.setBirthday(id);
        user.setWeight(id);
        return user;
    }

    private static void checkNulls(User user) {
        if (user.getName() == null || user.getSurname() == null) {
            throw new NullPointerException();
        }
    }

}
