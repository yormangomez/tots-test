// ignore_for_file: depend_on_referenced_packages

import 'package:logger/logger.dart';

/// The LoggerEvents class provides methods for logging debug, error,
/// and info messages using the Logger library in Dart.
class LoggerEvents {
  final _loggerInstance = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  /// The debug function logs a dynamic message using a logger instance.
  ///
  /// Args:
  ///   [message (dynamic)]: The "message" parameter is a dynamic type,
  ///   which means it can accept any type of value.
  void debug(dynamic message) {
    _loggerInstance.d(message);
  }

  /// The error function logs an error message using a logger instance.
  ///
  /// Args:
  ///   [message (dynamic)]: The "message" parameter is a dynamic type,
  ///   which means it can accept any type of value. It is used to pass
  ///   the error message that needs to be logged.
  void error(dynamic message) {
    _loggerInstance.e(message);
  }

  /// The "info" function in Dart is used to display information or messages.
  ///
  /// Args:
  ///   message (dynamic): The "message" parameter is of type "dynamic",
  ///   which means it can accept any type of value.
  void info(dynamic message) {
    _loggerInstance.i(message);
  }
}
