import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseSevice {
  Future<Either> getCategories();
}

class CategoryFirebaseSeviceImpl extends CategoryFirebaseSevice{
  @override
  Future<Either> getCategories() async {
    try{
    var categories = await FirebaseFirestore.instance
        .collection('Categories')
        .get();
        //.then((value) => value.docs.map((e) => e.data()).toList());
      return Right(categories.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

}