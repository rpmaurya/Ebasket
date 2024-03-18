import 'package:bbd_frontend/bloc/signup_bloc/signup_bloc.dart';
import 'package:bbd_frontend/common/button_widget.dart';
import 'package:bbd_frontend/common/common_screen.dart';
import 'package:bbd_frontend/controllers/login_controller.dart';
import 'package:bbd_frontend/screens/login_screen/email_login_screen.dart';
import 'package:bbd_frontend/screens/login_screen/otp_verify_screen.dart';
import 'package:bbd_frontend/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController();

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
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Phone Number',
                          style: GoogleFonts.montserrat(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // PhoneFormField(
                        //     decoration: InputDecoration(
                        //       // counterText: '',
                        //       filled: true,
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //           borderSide: BorderSide(
                        //               color: Color.fromRGBO(0, 0, 0, 0.5))),
                        //       fillColor: Colors.white,
                        //       contentPadding: EdgeInsets.symmetric(
                        //           vertical: 10, horizontal: 10),
                        //     ),
                        //     initialValue: PhoneNumber.parse('+91'),
                        //     validator: PhoneValidator.compose([
                        //       PhoneValidator.required(context,
                        //           errorText: 'Enter the valid number'),
                        //       PhoneValidator.validMobile(context),
                        //     ]),
                        //     onChanged: (phoneNumber) => {
                        //           setState(() {
                        //             controller.number = phoneNumber.nsn;
                        //           }),
                        //           // print({'phone number.....': phoneNumber.nsn})
                        //         }),
                        Container(
                          // height: 45,
                          width: size.width,
                          child: IntlPhoneField(
                            controller: controller.phoneController,
                            flagsButtonPadding: EdgeInsets.all(8.0),
                            keyboardType: TextInputType.phone,
                            dropdownIconPosition: IconPosition.trailing,
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              // setState(() {
                              //   controller.number = phone.number;
                              // });
                              print(phone.number);
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(0, 0, 0, 0.5))),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'kj,n,n,k';
                              }
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
                                    // if (phoneController.text == '') {
                                    //   print('object');
                                    // } else {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => OtpVerifyScreen(
                                    //               subtitle:
                                    //                   'otp sent on your Mobile',
                                    //             )));
                                    //   }

                                    controller.loginByMobile(
                                      context: context,
                                      setState: setState,
                                    );

                                    // controller.login();
                                  }
                                },
                                text: 'NEXT')),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          '---------- or ----------',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold),
                        )),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmailLoginScreen()));
                              },
                              child: Text(
                                'Login with Email',
                                style: GoogleFonts.montserrat(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an Account ?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                                  create: (context) =>
                                                      SignupBloc(),
                                                  child: SignupScreen(),
                                                )));
                                  },
                                  child: Text(
                                    'Register',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.green[700],
                                        fontWeight: FontWeight.w700),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
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
