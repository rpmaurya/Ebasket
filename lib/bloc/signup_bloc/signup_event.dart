import 'package:flutter/material.dart';

abstract class SignupEvent {}

class SubmitButton extends SignupEvent {
  TextEditingController firstNameController = TextEditingController();
  final String firstname;
  final String lastname;
  final String email;
  // final String password;
  final String phone;

  SubmitButton({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });
}
