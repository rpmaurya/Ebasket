import 'package:bbd_frontend/common/button_widget.dart';
import 'package:bbd_frontend/common/common_screen.dart';
import 'package:bbd_frontend/controllers/otp_controller.dart';
import 'package:bbd_frontend/models/login_model.dart';
import 'package:bbd_frontend/models/user-model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyByProfileScreen extends StatefulWidget {
  // final String subtitle;
  // final LoginModel? resp;
  final UserModel? editResp;
  const OtpVerifyByProfileScreen({super.key, this.editResp});

  @override
  State<OtpVerifyByProfileScreen> createState() =>
      _OtpVerifyByProfileScreenState();
}

class _OtpVerifyByProfileScreenState extends State<OtpVerifyByProfileScreen> {
  OtpController controller = OtpController();
  UserModel? getdata;

  // String? getdata;

  // LoginModel? getemail;
  @override
  void initState() {
    // TODO: implement initState
    getdata = widget.editResp;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CommonScreen(),
              Center(
                child: SizedBox(
                  width: size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'Otp Verification',
                        style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        'Otp sent on your Email',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: PinCodeTextField(
                          keyboardType: TextInputType.number,
                          enableActiveFill: true,
                          cursorColor: Colors.black,
                          appContext: context,
                          length: 4,
                          onChanged: (value) {
                            // Handle changes in the OTP input
                            print(value);
                          },
                          onCompleted: (value) {
                            // Handle when the user completes entering the OTP
                            print("Completed: $value");
                          },
                          // You can customize the appearance of the input field
                          pinTheme: PinTheme(
                              borderWidth: 1,
                              activeBorderWidth: 1,
                              inactiveBorderWidth: 1,
                              selectedFillColor: Colors.white,
                              shape: PinCodeFieldShape.box,
                              inactiveFillColor: Colors.white,
                              activeFillColor: Colors.white,
                              inactiveColor: Colors.grey,
                              activeColor: Color.fromRGBO(0, 0, 0, 0.5),
                              borderRadius: BorderRadius.circular(10)),
                          controller: controller.otpController,
                          // Validator function for OTP
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the OTP';
                            }
                            if (value.length != 4) {
                              return 'OTP must be 4 digits long';
                            }
                            // You can add more custom validation here if needed
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: CommonButton(
                              onselect: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  // if (getdata == response?.data?.email) {
                                  //   controller.otpVerifyByEmail(
                                  //       context: context,
                                  //       setState: setState,
                                  //       data: getdata);
                                  //   print({'email number...': getdata});
                                  // } else if (getdata ==
                                  //     response?.data?.mobileNo) {
                                  //   controller.otpVerify(
                                  //       context: context,
                                  //       setState: setState,
                                  //       data: getdata);
                                  //   print({'mobile......': getdata});
                                  // }
                                  if (getdata?.data?.email != null) {
                                    print({
                                      'otp screen for email':
                                          getdata?.data?.email
                                    });
                                    controller.otpVerifyByEmail(
                                        context: context,
                                        setState: setState,
                                        data: getdata?.data?.email);
                                  } else if (getdata?.data?.mobileNo != null) {
                                    print({
                                      'otp verify with mob':
                                          getdata?.data?.mobileNo
                                    });
                                    controller.otpVerify(
                                        context: context,
                                        setState: setState,
                                        data: getdata?.data?.mobileNo);
                                  }
                                }
                              },
                              text: 'SUBMIT')),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
