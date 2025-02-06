import 'package:flutter/material.dart';
import 'package:register_app/presentation/auth/widget/pinput_otp.dart';

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  bool get listenForMultipleSms => false;
  
  @override
  Future<void> startListening() {
    // TODO: implement startListening
    throw UnimplementedError();
  }
}
