import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';


class PinputOtpWidgetState extends StatefulWidget {
  const PinputOtpWidgetState({Key? key}) : super(key: key);  // LINT

  @override
  State<PinputOtpWidgetState> createState() => _PinputOtpWidgetStateState();
}

class _PinputOtpWidgetStateState extends State<PinputOtpWidgetState> {
   late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  @override
   void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    smsRetriever = SmsRetrieverImpl(
      SmartAuth(),
    );}
     @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
   @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: focusedBorderColor),
      ),
    );  
    return const Placeholder();
  }
}
abstract class SmsRetriever {
  Future<void> startListening();
}

class SmartAuth {
  getAppSignature() {}

  getSmsCode({required bool useUserConsentApi}) {}

  Future<void> removeSmsListener() async {}
  // Add SmartAuth implementation here
}

class SmsRetrieverImpl implements SmsRetriever {
  final SmartAuth smartAuth;
  
  SmsRetrieverImpl(this.smartAuth);

  @override
  Future<void> startListening() async {
    await smartAuth.getSmsCode(useUserConsentApi: true);
  }
}