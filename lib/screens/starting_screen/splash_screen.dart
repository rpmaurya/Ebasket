import 'package:bbd_frontend/notification_service.dart';
import 'package:bbd_frontend/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:bbd_frontend/screens/login_screen/login_screen.dart';
import 'package:bbd_frontend/screens/bottom_bar_screen/user_dashboard.dart';
import 'package:bbd_frontend/utils/sharepreferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

    onBoarding();
  }

  void firebaseCloudMessagingListeners() {
    messaging.getToken().then((token) {
      print("FCM Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.body}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message opened: ${message.notification?.body}");
    });
  }

  onBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    // SharepreferencClass getuser = SharepreferencClass();
    // print({'getuser.....': getuser.getUser()});

    await Future.delayed(
        const Duration(seconds: 2),
        () => pref.getString('token') != null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomBarScreen()))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(226, 249, 230, 1),
                Color.fromRGBO(255, 255, 255, 1)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_logo.png',
                // width: 253,
                // height: 91,
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/splash_bottom_logo.png',
                // height: 435,
                // width: 426,
              ),
            ],
          ),
        ));
  }
}
