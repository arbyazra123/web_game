import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';
import '../../auth.dart';

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    firebase_auth.FirebaseAuth firebaseAuth,
    // GoogleSignIn googleSignIn,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  // _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  // final GoogleSignIn _googleSignIn;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  Future<RegisterResponse> signUp(
      {@required BuildContext context,
      @required RegisterRequest request}) async {
    assert(request != null && context != null);
    var checking = await _isUsernameOrPasswordExist(request, context);
    RegisterResponse response = RegisterResponse(success: false);
    if (!checking.isAvailable) {
      try {
        await firebase_auth.FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: request.email,
          password: request.password,
        )
            .then(
          (value) async {
            response = RegisterResponse(
                request: request,
                msg: translate(context, "register_success"),
                success: true);
          },
        );
      } on firebase_auth.FirebaseAuthException catch (e) {
        print(e.code);
        response = RegisterResponse(
          request: request,
          msg: AuthExceptionHandler.generateExceptionMessage(
              context, AuthExceptionHandler.handleException(e)),
          success: false,
        );
        return response;
      }
    } else {
      response = RegisterResponse(
          request: request,
          msg: checking.message,
          success: false);
      return response;
    }
    if (response.success) {
      await FirebaseFirestore.instance.collection(usersCollection).add({
        "username": request.username,
        "email": request.email,
        "age": request.age,
        "created_at": DateTime.now().toIso8601String(),
      }).then((value) => print("UPLOADEDDDDD"));
      return response;
    } else {
      response = RegisterResponse(
          request: request,
          msg: translate(context, "register_failed"),
          success: false);
      print(response.success);
      return response;
    }
  }

  Future<AccountAvailability> _isUsernameOrPasswordExist(
      RegisterRequest request, BuildContext context) async {
    var isAvailable;
    var check =
        await FirebaseFirestore.instance.collection(usersCollection).get();
    if (check.docs.isNotEmpty) {
      check.docs.forEach((element) {
        if (element.data()['username'] == request.username) {
          print("ada yang sma");
          isAvailable = AccountAvailability(
              true, translate(context, "username_already_taken"));
        } else if (element.data()['email'] == request.email) {
          isAvailable = AccountAvailability(
              true, translate(context, "email_already_taken"));
        } else {
          isAvailable = AccountAvailability(false, null);
        }
      });
    } else {
      isAvailable = AccountAvailability(false, null);
    }
    return isAvailable;
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  // Future<void> logInWithGoogle() async {
  //   try {
  //     final googleUser = await _googleSignIn.signIn();
  //     final googleAuth = await googleUser.authentication;
  //     final credential = firebase_auth.GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await _firebaseAuth.signInWithCredential(credential);
  //   } on Exception {
  //     throw LogInWithGoogleFailure();
  //   }
  // }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<LoginResponse> logInWithEmailAndPassword({
    @required BuildContext context,
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    LoginResponse response;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      response = LoginResponse(success: true);
    } on firebase_auth.FirebaseAuthException catch (e) {
      response = LoginResponse(
        msg: AuthExceptionHandler.generateExceptionMessage(
            context, AuthExceptionHandler.handleException(e)),
        success: false,
      );
    }
    return response;
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        // _googleSignIn.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
