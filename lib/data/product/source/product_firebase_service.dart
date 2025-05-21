import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/product/models/product.dart';
import 'package:ecommerce_anly/domain/product/entities/products.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsBycategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProuct(ProductEntity product);
  Future<bool> isFAvorite(String productId);
  Future<Either> getFavoritesProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();

      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again ');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createDate',
              isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(2025, 2, 15)))
          .get();

      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again ');
    }
  }

  @override
  Future<Either> getProductsBycategoryId(String categoryId) async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again ');
    }
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();

      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again ');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProuct(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId)
          .get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('Favorites')
            .add(product.fromEntity().toMap());
        return const Right(true);
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }
  
  @override
  Future<bool> isFAvorite(String productId) async {
     try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<Either> getFavoritesProducts() async {
     try {
      var user = FirebaseAuth.instance.currentUser;
     var returnData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Favorites')
          .get();

      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again ');
    }
  }
}
