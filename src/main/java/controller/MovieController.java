package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Movie;
import service.MovieService;



@Controller
public class MovieController {
	

	@Autowired
	private MovieService movieService;
	//电影展示
	@RequestMapping("movielist.do")
	public String movielist(Model model) {
		List<Movie> movies = movieService.qu();
		model.addAttribute("movies",movies);
		return "movielist";
	}
	//电影信息更新
	@ResponseBody
	@RequestMapping("movieUpdate.do")
	public int update(Movie movie) {
		int i = movieService.userupdate(movie);
		return i;
	}
	//电影信息删除
	@ResponseBody
	@RequestMapping("movieDelete.do")
	public int delete(Movie movie) {
		int i = movieService.moviedelete(movie.getMovieId());
		return i;
	}
	//电影的添加
	@ResponseBody
	@RequestMapping("movieinsert.do")
	public int insert(Movie movie) {
		int i = movieService.movieinsert(movie);
		return i;
	}
	
}
