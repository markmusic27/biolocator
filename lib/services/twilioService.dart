import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioService {
  String _authToken;
  String _accountSid;
  String _twilioNumber;

  //Setters
  set changeAuthToken(String token) => _authToken = token;
  set changeAccountSid(String sid) => _accountSid = sid;
  set changeTwilioNumber(String number) => _twilioNumber = number;

  Future<void> sendSMS(String message, String userPhone) async {
    TwilioFlutter twilioFlutter = TwilioFlutter(
      twilioNumber: _twilioNumber,
      accountSid: _accountSid,
      authToken: _authToken,
    );

    await twilioFlutter.sendSMS(
      toNumber: userPhone,
      messageBody: message,
    );
  }
}
