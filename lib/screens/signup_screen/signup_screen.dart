import 'package:bbd_frontend/bloc/signup_bloc/signup_bloc.dart';
import 'package:bbd_frontend/bloc/signup_bloc/signup_event.dart';
import 'package:bbd_frontend/bloc/signup_bloc/signup_state.dart';
import 'package:bbd_frontend/common/button_widget.dart';
import 'package:bbd_frontend/common/common_screen.dart';
import 'package:bbd_frontend/controllers/register_controller.dart';
import 'package:bbd_frontend/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // final _formKey = GlobalKey<FormState>();
  RegisterController controller = RegisterController();
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'User Registration',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: controller.firstNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.manage_accounts),
                              hintText: 'First Name',
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
                              if (value == null || value.isEmpty) {
                                return 'Enter First Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            controller: controller.lastNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.manage_accounts),
                              hintText: 'Last Name',
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
                              if (value == null || value.isEmpty) {
                                return 'Enter last Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: 'Email Id',
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
                              const pattern =
                                  r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                                  r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                                  r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                                  r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                                  r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                                  r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                                  r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                              final regex = RegExp(pattern);
                              if (value == null || value.isEmpty) {
                                return 'Enter valid email id';
                              } else if (!regex.hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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

                        // Container(
                        //   child: TextFormField(
                        //     controller: controller.phoneController,
                        //     keyboardType: TextInputType.phone,
                        //     decoration: InputDecoration(
                        //       prefixIcon: Icon(Icons.phone),
                        //       hintText: 'Phone Number',
                        //       filled: true,
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //           borderSide: BorderSide(
                        //               color: Color.fromRGBO(0, 0, 0, 0.5))),
                        //       fillColor: Colors.white,
                        //       contentPadding: EdgeInsets.symmetric(
                        //           vertical: 10, horizontal: 10),
                        //     ),
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Enter valid number';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonButton(
                            onselect: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.signup(
                                    context: context, setState: setState);
                              }
                            },
                            text: 'REGISTER'),
                        Row(
                          children: [
                            Text('Already have an Account ?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.green[700]),
                                ))
                          ],
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
