package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Product;
import mapper.ProductMapper;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    //注入ProductMapper
    @Autowired
    private ProductMapper productMapper;
    
    @Override
    public List<Product> list() {
        return productMapper.list();
    }

    @Override
    public void save(Product product) {
        productMapper.save(product);
    }
}