import 'package:bbd_frontend/common/dropdown_widget.dart';
import 'package:bbd_frontend/constant_files/text_constant.dart';
import 'package:bbd_frontend/controllers/getUser_controller.dart';
import 'package:bbd_frontend/models/user-model.dart';
import 'package:bbd_frontend/screens/login_screen/login_screen.dart';
import 'package:bbd_frontend/screens/user_sides_screen/my_account_sceens/edit_profile_screen.dart';
import 'package:bbd_frontend/services/user_service.dart';
import 'package:bbd_frontend/utils/sharepreferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // UserController userController = UserController();
  UserService userService = UserService();
  UserModel? userModel;
  bool isLoding = false;
  int? getid;
  int userid = 0;
  @override
  void initState() {
    getUserById();
    // TODO: implement initState

    super.initState();
  }

//  var usr = SharepreferencClass().getUser();
  getUserById() async {
    setState(() {
      isLoding = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    getid = await pref.getInt('userId');

    Map<String, dynamic> query = {"userId": getid};
    print({'getid...': query});
    try {
      await userService
          .getUser(query: query, context: context, setState: setState)
          .then((resp) {
        userModel = resp;
        print({'redkjkjk': userModel?.data?.lastName});
        setState(() {
          isLoding = false;
        });
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Text('My Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)),
                surfaceTintColor: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: -20),
                        leading: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.5)),
                              borderRadius: BorderRadius.circular(50)),
                          // height: 120,
                          // width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              fit: BoxFit.fill,
                              'https://www.mmagyms.net/wp-content/uploads/2020/01/Personal-Trainer-Packages.png',
                            ),
                          ),
                        ),
                        title: Text(
                          '${userModel?.data?.firstName} ${userModel?.data?.lastName}',
                          style: TextConstant().titleText,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel?.data?.mobileNo ?? '000',
                              style: TextConstant().subtitleText,
                            ),
                            Text(
                              userModel?.data?.email ?? '',
                              style: TextConstant().subtitleText,
                            )
                          ],
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(
                                          userId: getid,
                                        )));
                          },
                          child: Container(
                            width: 60,
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Deleviry Adress',
                        style: TextConstant().titleText,
                      ),
                      subtitle: Text(
                        'Sector- 62,Noida up ',
                        style: TextConstant().subtitleText,
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.calendar_month_rounded),
                      title: Text('My Subscription'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.wallet_giftcard_rounded),
                      title: Text('My Order'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.wallet),
                      title: Text('My Wallet'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('My Payment'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.receipt_sharp),
                      title: Text('Auto Recharge'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ),
              Card(
                child: GestureDetector(
                  onTap: () {
                    removeData();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
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

void removeData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
}
