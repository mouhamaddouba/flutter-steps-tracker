import 'package:flutter_steps_tracker/common/error/exceptions/application_exception.dart';
import 'package:flutter_steps_tracker/common/error/exceptions/firebase_auth_exception_app.dart';
import 'package:flutter_steps_tracker/common/error/failures/firebase_auth_failure.dart';

abstract class Failure {}

// Can be used when the list of exceptions is exhausted.

class GenericFailure extends Failure {
  final String message;

  GenericFailure({required this.message});
}

Failure firebaseExceptionsDecoder(ApplicationException e) {
  if (e is FirebaseAuthExceptionApp) {
    return e.when(
      operationNotAllowed: (msg) =>
          FirebaseAuthFailure.operationNotAllowed(message: msg),
    );
  } else {
    return GenericFailure(message: 'Something went wrong!');
  }
}
