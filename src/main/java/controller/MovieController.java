package controller;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Movie;
import org.springframework.web.servlet.ModelAndView;
import service.MovieService;


@Controller
public class MovieController {


    @Autowired
    private MovieService movieService;

    //电影展示
    @RequestMapping("movielist.do")
    public ModelAndView movielist(@RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "3") Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<Movie> movies = movieService.qu();
        PageInfo<Movie> pageInfo = new PageInfo<Movie>(movies);
        //传递数据
        ModelAndView mv = new ModelAndView();
        mv.addObject("movies", movies);
        mv.addObject("pageInfo", pageInfo);
        return mv;
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

    @RequestMapping("index.do")
    public String index() {
        return "index";
    }

}
