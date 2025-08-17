import 'package:flutter_clean_architecture_example/Features/domain/entities/number.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_example/core/error/failure.dart';

abstract class NumberRepository {
  Future<Either<Failure, Number>> getConcreteNumber(int number);
  Future<Either<Failure, Number>> getRandomNumber();
}
