import 'package:flutter/material.dart';

class ShopingCartScreen extends StatefulWidget {
  const ShopingCartScreen({super.key});

  @override
  State<ShopingCartScreen> createState() => _ShopingCartScreenState();
}

class _ShopingCartScreenState extends State<ShopingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Shoping Cart'),
      ),
    );
  }
}
