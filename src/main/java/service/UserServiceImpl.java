package service;

import java.util.List;

import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.User;
import entity.UserExample;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int byNameps(User user) {
		int role;
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(user.getUname());
		criteria.andPasswdEqualTo(user.getPasswd());
		List<User> list = userMapper.selectByExample(example);
		if(list.size()>0) {
			role=list.get(0).getUrole();
			return role;
		}else {
			return 9;
		}
	}
	
	@Override
	public boolean byName(User user) {
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(user.getUname());
		List<User> list = userMapper.selectByExample(example);
		return list.size()>0?true:false;
	}
	
	@Override
	public boolean addUser(User user) {
		user.setUrole(1);
		int result = userMapper.insert(user);
		return result>0?true:false;
	}
	
	@Override
	public List<User> qu() {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUroleNotEqualTo(0);
		List<User> users = userMapper.selectByExample(userExample);
//		for(User user :users) {
//			System.out.println(user.getUname());
//		}
		return users;
	}

	@Override
	public int userdelete(int userid) {
		int i = userMapper.deleteByPrimaryKey(userid);
		return i;
	}

	@Override
	public int userupdate(User user) {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		int i = userMapper.updateByExampleSelective(user, userExample);
		return i;
	}

}
