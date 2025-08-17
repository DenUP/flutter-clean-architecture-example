import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_example/Features/domain/entities/number.dart';
import 'package:flutter_clean_architecture_example/Features/domain/repository/number_repository.dart';
import 'package:flutter_clean_architecture_example/core/error/failure.dart';

class GetConcreteNumber {
  final NumberRepository numberRepository;

  GetConcreteNumber({required this.numberRepository});

  Future<Either<Failure, Number>> execute(int number) async {
    return numberRepository.getConcreteNumber(number);
  }
}
