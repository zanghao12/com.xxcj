package mapper;

import java.util.List;

import entity.Product;

public interface ProductMapper {
	//保存商品
    void save(Product product);
    //查询商品
    List<Product> list();
}
