import 'package:bbd_frontend/services/otp_service.dart';
import 'package:flutter/material.dart';

class OtpController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  OtpService otpService = OtpService();
  bool isLoding = false;
  Future<void> otpVerify(
      {required BuildContext context, required setState, required data}) async {
    Map<String, dynamic> body = {"mobile": data, "otp": otpController.text};
    print({'otpverification...': body});
    try {
      setState(() {
        isLoding = true;
      });
      await otpService.otpVerifyMob(
          body: body, context: context, setState: setState);
      setState(() {
        isLoding = true;
      });
    } catch (e) {
      print({'object': e});
    }
  }

  Future<void> otpVerifyByEmail(
      {required BuildContext context, required setState, required data}) async {
    Map<String, dynamic> body = {"email": data, "otp": otpController.text};
    print({'otpverification...': body});
    try {
      setState(() {
        isLoding = true;
      });
      await otpService.otpVerifyEmail(
          body: body, context: context, setState: setState);
      setState(() {
        isLoding = true;
      });
    } catch (e) {
      print({'object': e});
    }
  }
}
