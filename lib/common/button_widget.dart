import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final void Function() onselect;
  const CommonButton({super.key, required this.onselect, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onselect,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: 45,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.green[700], borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          text.toString(),
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
