package service;

import java.util.List;

import entity.Movie;

public interface MovieService {
	List<Movie> qu();

	int userupdate(Movie movie);

	int moviedelete(Integer movieId);

	int movieinsert(Movie movie);
}
