import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_market/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuth.createUserWithEmailAndPassword ${e.toString()} ',
      );

      if (e.code == 'weak-password') {
        throw CustomException(errMessage: 'password is to weak');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          errMessage: 'The account already exists for that email.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          errMessage: 'No Internet connection, please check your network',
        );
      } else {
        throw CustomException(errMessage: 'there was an error try later');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuth.createUserWithEmailAndPassword ${e.toString()} ',
      );

      throw CustomException(errMessage: 'there was an error try later');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuth.signInWithEmailAndPassword ${e.toString()} ',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          errMessage: 'Wrong password or email provided for that user.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          errMessage: 'Wrong password or email provided for that user.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          errMessage: 'No Internet connection, please check your network',
        );
      } else {
        throw CustomException(errMessage: 'there was an error try later');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuth.signInWithEmailAndPassword ${e.toString()} ',
      );
      throw CustomException(errMessage: 'there was an error try later');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  ///APPLE

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
