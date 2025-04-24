import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/data/order/models/add_to_card_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCardReq addToCardReq);
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCardReq addToCardReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCardReq.toMap());
      return const Right('Add to card was successful');
    } catch (e) {
        return const Left('Please try again later');
    }
  }
}
