import 'package:bbd_frontend/common/custom_dropdown_button.dart';
import 'package:bbd_frontend/common/dropdown_widget.dart';
import 'package:bbd_frontend/constant_files/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonProductListScreen extends StatefulWidget {
  final int categoryId;
  final int? subCategoryId;
  const CommonProductListScreen(
      {super.key, required this.categoryId, this.subCategoryId});

  @override
  State<CommonProductListScreen> createState() =>
      _CommonProductListScreenState();
}

class _CommonProductListScreenState extends State<CommonProductListScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    print({'userid....': widget.categoryId});
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: ColorConstant().gradientColor)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_left_outlined, size: 35)),
                  title: Text('Milk'),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.search, size: 35))
                  ],
                ),
                SizedBox(
                  height: h * 0.077,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            constraints:
                                BoxConstraints(minWidth: 80, maxWidth: 100),
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                'All Milk',
                                textAlign: TextAlign.center,
                              ),
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: h,
                  width: w,
                  color: Colors.grey[300],
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text('data')),
                        Container(
                          width: w,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: h * 0.85,
                              child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 185,
                                        width: 402,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 106,
                                                    width: 108,
                                                    child: Image.network(
                                                      'https://tse2.mm.bing.net/th?id=OIP.AgUW74LvQfZrucfNj7fzIgHaE8&pid=Api&P=0&h=220',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.red),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Container(
                                                        width: 108,
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            'Buy Once',
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Amul'),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text('Amul Gold'),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      width: 180,
                                                      height: 30,
                                                      child: CustomDropdown(
                                                          itemsList: [
                                                            'njkkj',
                                                            'hjhjh',
                                                            'hjkk'
                                                          ],
                                                          onChanged: (value) {},
                                                          hintText: 'njjkjkn')),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text('66'),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.pinkAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Container(
                                                        width: 180,
                                                        height: 30,
                                                        child: Center(
                                                          child: Text(
                                                            'Subscribe @ 60',
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
