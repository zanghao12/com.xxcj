package service;

import java.util.List;

import mapper.MovieMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Movie;
import entity.MovieExample;
import entity.MovieExample.Criteria;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieMapper movieMapper;
	
	@Override
	public List<Movie> qu() {
		MovieExample movieExample = new MovieExample();
		Criteria criteria = movieExample.createCriteria();
		criteria.andStatusEqualTo(1);
		List<Movie> movies = movieMapper.selectByExample(movieExample);
		return movies;
	}
	
	@Override
	public int userupdate(Movie movie) {
		MovieExample movieExample = new MovieExample();
		Criteria criteria = movieExample.createCriteria();
		criteria.andMovieIdEqualTo(movie.getMovieId());
		int i = movieMapper.updateByExampleSelective(movie, movieExample);
		return i;
	}

	@Override
	public int moviedelete(Integer movieId) {
		int i = movieMapper.deleteByPrimaryKey(movieId);
		return i;
	}

	@Override
	public int movieinsert(Movie movie) {
		movie.setStatus(1);
		int i = movieMapper.insert(movie);
		return i;
	}
	
}
