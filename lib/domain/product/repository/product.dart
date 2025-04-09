
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
 
 Future<Either> getTopSelling();
  // Future<List<Product>> getAllProducts();
  // Future<Product> getProductById(String id);
  // Future<void> addProduct(Product product);
  // Future<void> updateProduct(Product product);
  // Future<void> deleteProduct(String id);
}