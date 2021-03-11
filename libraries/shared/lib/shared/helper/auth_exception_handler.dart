import 'package:flutter/material.dart';

import 'utils.dart';

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  weakPassword,
}

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code.toString().toUpperCase()) {
      case "INVALID-EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "WRONG-PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "USER-NOT-FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "USER-DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "TOO-MANY-REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "OPERATION-NOT-ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "EMAIL-ALREADY-IN-USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "WEAK-PASSWORD":
        status = AuthResultStatus.weakPassword;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(BuildContext context, exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = translate(context, "invalid_email");
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = translate(context, "wrong_password");
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = translate(context, "user_not_found");
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = translate(context, "user_disabled");
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = translate(context, "too_many_requests");
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = translate(context, "operation_not_allowed");
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = translate(context, "email_already_taken");
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = translate(context, "weak_password");
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}
