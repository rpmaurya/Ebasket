import 'package:bbd_frontend/common/dropdown_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Explor'),
      ),
      body: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              DropdownWidget(
                selectedValue: 'Select Option',
                items: ['asdfg', 'hhhhj', 'hghghggh', 'ghgghgg'],
              ),
              TextField(),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {}
                  },
                  child: Text('submit'))
            ],
          )),
    );
  }
}
