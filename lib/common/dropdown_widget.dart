import 'package:flutter/material.dart';
// import 'package:pheonixfx/custom_widget/validator_class.dart';

class DropdownWidget extends StatefulWidget {
  String? selectedValue;
  final String? Function(String?)? validator;
  final List<String> items;
  // final Function(String)? onChanged;

  DropdownWidget(
      {super.key,
      required this.selectedValue,
      required this.items,
      // required this.onChanged,
      this.validator});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool isOpen = false;
  // TextEditingController selected = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.selectedValue ?? ''),
                // Text(selvalue),
                isOpen
                    ? Icon(Icons.keyboard_arrow_up)
                    : Icon(Icons.keyboard_arrow_down)
                // Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        ),
        // TextFormField(
        //   readOnly: true,
        //   decoration: InputDecoration(
        //       border: InputBorder.none,
        //       hintText: widget.selectedValue,
        //       suffixIcon: isOpen
        //           ? Icon(Icons.keyboard_arrow_up)
        //           : Icon(Icons.keyboard_arrow_down)),
        //   validator: widget.validator,
        //   onTap: () {
        //     setState(() {
        //       isOpen = !isOpen;
        //     });
        //   },
        // ),

        // if (isOpen)
        Visibility(
          visible: isOpen,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: ListView(
              primary: true,
              shrinkWrap: true,
              children: widget.items
                  .map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedValue = e;
                            print({'Selected value..': widget.selectedValue});
                            isOpen = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(2),
                          decoration: widget.selectedValue == e
                              ? BoxDecoration(
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(10))
                              : BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e),
                                if (widget.selectedValue == e) Icon(Icons.check)
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
