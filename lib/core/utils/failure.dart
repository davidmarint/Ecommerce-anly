import 'package:dartz/dartz.dart';

class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => message;
}

typedef EitherResult<T> = Either<Failure, T>;