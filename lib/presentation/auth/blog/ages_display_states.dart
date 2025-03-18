import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayStates {}

class AgesLoading extends AgesDisplayStates {}

class AgesLoaded extends AgesDisplayStates {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
  AgesLoaded({required this.ages});
}

class AgesLoadFaiture extends AgesDisplayStates {
  final String message;
  AgesLoadFaiture({required this.message});
}