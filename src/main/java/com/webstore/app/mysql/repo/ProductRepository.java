package com.webstore.app.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webstore.app.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

  List<Product> findByCategoryId(Long id);
  
  List<Product> findByProductName(String name);
}
