package service;

import java.util.List;

import mapper.MovieMapper;
import mapper.OrdersMapper;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Movie;
import entity.Orders;
import entity.OrdersExample;
import entity.User;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private MovieMapper movieMapper;

	@Override
	public List<Orders> qu() {
		OrdersExample ordersExample = null;
		List<Orders> orders = ordersMapper.selectByExample(ordersExample);
//		System.out.println(orders.get(0).getMovieId());
		for(int i =0; i<orders.size();i++) {
			int userId = orders.get(i).getUserId(); 
			int movieId = orders.get(i).getMovieId();
			User user = userMapper.selectByPrimaryKey(userId);
			String uname = user.getUname();
			Movie movie = movieMapper.selectByPrimaryKey(movieId);
			String mName = movie.getmName();
			orders.get(i).setUname(uname);
			orders.get(i).setmName(mName);
		}
		return orders;
	}
	
}
