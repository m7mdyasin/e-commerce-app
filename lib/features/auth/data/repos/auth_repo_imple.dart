import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_market/core/errors/exception.dart';
import 'package:fruits_market/core/errors/failure.dart';
import 'package:fruits_market/core/services/firebase_auth_service.dart';
import 'package:fruits_market/features/auth/data/models/user_model.dart';
import 'package:fruits_market/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImple({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImple.createUserWithEmailAndPassword ${e.toString()} ',
      );
      return left(ServerFailure('there was an error try later'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      log(
        'Exception in AuthRepoImple.signInWithEmailAndPassword ${e.toString()} ',
      );
      return left(ServerFailure('try later'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImple.signInWithGoogle ${e.toString()} ');
      return left(ServerFailure('try later'));
    }
  }

  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImple.signInWithFacebook ${e.toString()} ');
      return left(ServerFailure('try later'));
    }
  }
}
