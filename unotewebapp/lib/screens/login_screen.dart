import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unotewebapp/res/Unote_Colors.dart';
import 'package:unotewebapp/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: UnoteColors.unoteBrown,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                          'images/logo.png',
                          height: 160,
                        ),
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: 'U',
                          style: TextStyle(
                            color: UnoteColors.unoteOrange,
                            fontSize: 40,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Know it ',
                              style: TextStyle(color: UnoteColors.unoteWhite),
                            ),
                            TextSpan(
                              text: 'U',
                              style: TextStyle(color: UnoteColors.unoteOrange),
                            ),
                            TextSpan(
                              text: 'Note it ',
                              style: TextStyle(color: UnoteColors.unoteWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return LoginForm();
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        UnoteColors.customOrange,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
