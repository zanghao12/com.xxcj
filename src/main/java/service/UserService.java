package service;

import java.util.List;

import entity.User;

public interface UserService {
	//登录
	int byNameps(User user);
	//注册
	boolean addUser(User user);
	//重名
	boolean byName(User user);
	//查询所有用户
	List<User> qu();
	//删除用户
	int userdelete(int userid);
	//修改
	int userupdate(User user);
}
