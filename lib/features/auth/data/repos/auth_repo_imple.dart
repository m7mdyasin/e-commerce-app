import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_market/core/errors/exception.dart';
import 'package:fruits_market/core/errors/failure.dart';
import 'package:fruits_market/core/services/data_service.dart';
import 'package:fruits_market/core/services/firebase_auth_service.dart';
import 'package:fruits_market/core/utils/backend_endpoints.dart';
import 'package:fruits_market/features/auth/data/models/user_model.dart';
import 'package:fruits_market/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;

  AuthRepoImple({
    required this.firebaseAuthService,
    required this.databaseServices,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;

    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.errMessage));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImple.createUserWithEmailAndPassword ${e.toString()} ',
      );
      return left(ServerFailure('there was an error try later'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseServices.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        uId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImple.signInWithGoogle ${e.toString()} ');
      return left(ServerFailure('try later'));
    }
  }

  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseServices.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        uId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);

      log('Exception in AuthRepoImple.signInWithFacebook ${e.toString()} ');
      return left(ServerFailure('try later'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseServices.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        uId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await addUserData(user: userEntity);
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);

      log('Exception in AuthRepoImple.signInWithApple ${e.toString()} ');
      return left(ServerFailure('try later'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
      uId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseServices.getData(
      path: BackendEndpoints.getUserData,
      uId: uId,
    );
    return UserModel.fromJson(userData);
  }
}
