import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:clean_architecture_with_mvvm/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repositories {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
