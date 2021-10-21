package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Movie;
import entity.Orders;
import entity.User;
import service.MovieService;
import service.OrdersService;



@Controller
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	@Autowired
	private MovieService movieService;
	
	//订单展示
	@RequestMapping("orderslist.do")
	public String orderslist(Model model) {
		List<Orders> orders = ordersService.qu();
		model.addAttribute("orders",orders);
		return "orderslist";
	}
	//跳转到usermovie页面
	@RequestMapping("tousermovie.do")
	public String toUsermovie(Model model) {
		List<Movie> movies = movieService.qu();
		model.addAttribute("movies",movies);
		return "usermovie";
	}
	//
	@RequestMapping("ordersdi.do")
	public int toOrdersdi() {
		
		return 1;
	}
}