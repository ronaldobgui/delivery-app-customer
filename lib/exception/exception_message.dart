import 'package:delivery_app_customer/exception/interface/i_exception_message.dart';

class ExceptionMessage implements IExceptionMessage {
  @override
  final String code;
  @override
  final String message;

  ExceptionMessage({required this.code, required this.message});
}
