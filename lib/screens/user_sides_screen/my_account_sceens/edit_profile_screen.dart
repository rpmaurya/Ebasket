import 'package:bbd_frontend/common/button_widget.dart';
import 'package:bbd_frontend/common/custom_textfield.dart';
import 'package:bbd_frontend/constant_files/color_constant.dart';
import 'package:bbd_frontend/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final int? userId;
  const EditProfileScreen({super.key, required this.userId});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formkey = GlobalKey<FormState>();
  EditController controller = EditController();
  @override
  Widget build(BuildContext context) {
    print({'userid...........': widget.userId});
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: ColorConstant().gradientColor)),
        child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextfield(
                      fillColor: Colors.white,
                      controller: controller.firstName,
                      hintText: 'Enter First Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      fillColor: Colors.white,
                      controller: controller.lastName,
                      hintText: 'Enter Last Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      fillColor: Colors.white,
                      controller: controller.email,
                      hintText: 'Enter Your Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                        onselect: () {
                          if (_formkey.currentState!.validate()) {
                            controller.editProfile(
                              context: context,
                              setState: setState,
                            );
                          }
                        },
                        text: 'Submit')
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
