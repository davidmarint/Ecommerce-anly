import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
   Future<Either> getNewIn();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();

      return Right(returnData.docs.map((e)=> e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again '
      );
    }
  }
  
  @override
  Future<Either> getNewIn() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createDate', isGreaterThanOrEqualTo: Timestamp.fromDate(
            DateTime(
              2025,2,15
            )
          ))
          .get();

      return Right(returnData.docs.map((e)=> e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again '
      );
    }
  }
}
