package service;

import java.util.List;

import entity.Product;

public interface ProductService {
	  List<Product> list();

	  void save(Product product);

}