package com.example.exhaustproject.controllers;

import com.example.exhaustproject.models.Product;
import com.example.exhaustproject.repositories.ProductRepository;
import com.example.exhaustproject.services.ProductService;
import com.example.exhaustproject.util.ProductErrorResponse;
import com.example.exhaustproject.util.ProductNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

// @Controller + @ResponseBode
@CrossOrigin(origins = "http://localhost:3001/")
@RestController
@RequestMapping("/api")
public class ApiController {
    private final ProductRepository productRepository;
    private final ProductService productService;

    @Autowired
    public ApiController(ProductRepository productRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.productService = productService;
    }

    @GetMapping("/info")
//    @ResponseBody() // указываем что из данного метода будет возвращаться не шаблон, а обычный текст. Таким образом Spring не будет искать шаблон в папке templates
    public String getInfoApi(){
        return "Данное API предназначено для получения информации о товарах";
    }

    @CrossOrigin(origins = "http://localhost:8070")
    // Метод по получению всех продуктов
    @GetMapping("/product")
    public List<Product> getProduct(){
        // С помощью библиотеке Jackson преобразовывать java объекты в json
        return productRepository.findAll();
    }

    // Метод по удалению продукта по id
    @GetMapping("/product/delete/{id}")
    public void deleteProductId(@PathVariable("id") int id){
        productRepository.deleteById(id);
    }

    // Метод по добавлению продуктов
    @GetMapping("/product/add")
    public String addProduct(@RequestParam("title") String title, @RequestParam("price") float price){
        Product newProduct = new Product(title, price);
        System.out.println(true);
        productRepository.save(newProduct);
        return "Товар успешно добавлен";
    }

    // Метод по получению товара по id
    @GetMapping("/product/{id}")
    public Product getProductId(@PathVariable("id") int id){
        return productService.findById(id);
    }

    @ExceptionHandler
    public ResponseEntity<ProductErrorResponse> handlerException(ProductNotFoundException productNotFoundException){
        ProductErrorResponse response = new ProductErrorResponse("Не удалось найти товар по указанному id");
        // NOT FOUND - 404 - статус в заголовке ответа -=> RESPONSE - тело ответа
        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
    }
}