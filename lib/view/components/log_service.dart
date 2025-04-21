// lib/services/logging_service.dart
class LoggingService {
  static void log(String message) {
    print('[Portfolio] $message');
  }
  
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    print('[Portfolio ERROR] $message');
    if (error != null) {
      print('Error details: $error');
    }
    if (stackTrace != null) {
      print('Stack trace: $stackTrace');
    }
  }
}