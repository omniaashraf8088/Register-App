import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:register_app/data/controller/forget_password/cubit/forget_passord_cubit.dart';

class PinputFormWdget extends StatelessWidget {
  PinputFormWdget({super.key});

  final focusNode = FocusNode();
  final smsRetriever = null;
  final focusedBorderColor = Color.fromARGB(255, 62, 158, 255);
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 70,
    textStyle: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Color(0xFFEAEFF5),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return Form(
          key: context.read<ForgetPasswordCubit>().otpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  // You can pass your own SmsRetriever implementation based on any package
                  // in this example we are using the SmartAuth
                  smsRetriever: smsRetriever,
                  controller: context.read<ForgetPasswordCubit>().otpController,
                  focusNode: focusNode,

                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    return value!.isNotEmpty ? null : 'Pin is incorrect';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 16,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
