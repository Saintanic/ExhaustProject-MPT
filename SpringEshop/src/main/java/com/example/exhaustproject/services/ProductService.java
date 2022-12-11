package com.example.exhaustproject.services;

import com.example.exhaustproject.models.Product;
import com.example.exhaustproject.repositories.ProductRepository;
import com.example.exhaustproject.util.ProductNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {
    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    public Product findById(int id){
        Optional<Product> productOptional = productRepository.findById(id);
        return productOptional.orElseThrow(ProductNotFoundException::new);
    }
    // Данный метод позволяет вернуть все продукты
    public List<Product> getAllProduct(){
        return productRepository.findAll();
    }
    // Данный метод позволяет вернуть товар по id
    public Product getProductId(int id){
        Optional<Product> optionalProduct = productRepository.findById(id);
        return optionalProduct.orElse(null);
    }
    // Данный метод позволяет сохранить объект продукта, который пришел с формы
    @Transactional
    public void saveProduct(Product product){
        productRepository.save(product);
    }
    // Данный метод позволяет обновить информацию о продукте
    @Transactional
    public void updateProduct(int id, Product product){
        product.setId(id);
        productRepository.save(product);
    }
    // Данный метод позволяет удалить товар по id
    @Transactional
    public void deleteProduct(int id){
        productRepository.deleteById(id);
    }
    // Данный метод позволит получить товар по наименованию
    public Product  getProductFindByTitle(Product product){
        Optional<Product> product_db = productRepository.findByTitle(product.getTitle());
        return product_db.orElse(null);
    }
}
