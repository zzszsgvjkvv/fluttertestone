import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/splashscreen.dart';

import 'package:shoppingapp/viwe/pages/auth/singin.dart';
import 'package:shoppingapp/viwe/consthelp/texform.dart';
import 'package:http/http.dart' as http;

final _firebase = FirebaseAuth.instance;

// ignore: camel_case_types
class loginpage extends StatefulWidget {
  final String imageuser;
  const loginpage({
    super.key,
    required this.imageuser,
  });

  @override
  State<loginpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<loginpage> {
  Storitms controller = Get.put(Storitms(), permanent: true);
  GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? valedat(String? v) {
    if (v!.isEmpty) {
      return "eror";
    } else if (v.trim().length > 75) {
      return "eror";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("loginpage"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(80)),
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(widget.imageuser),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "login page",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 40,
                ),
                Textformitm(
                  boolobscureText: false,
                  icon: const Icon(Icons.email),
                  controller: email,
                  hint: " enter email",
                  label: "email",
                  validator: valedat,
                ),
                const SizedBox(
                  height: 40,
                ),
                Textformitm(
                  boolobscureText: true,
                  icon: const Icon(Icons.password),
                  controller: password,
                  hint: " enter password",
                  label: "password",
                  validator: valedat,
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<Storitms>(
                    builder: (controller) => TextButton.icon(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            try {
                              //  final UserCredential userCredential =
                              await _firebase.signInWithEmailAndPassword(
                                  email: email.text.toString(),
                                  password: password.text.toString());

                              final uriget = Uri.https(
                                  'newtest-90b54-default-rtdb.firebaseio.com',
                                  'usedata.json');

                              http.get(uriget).then((response) async {
                                final Map responsbode =
                                    json.decode(response.body);

                                for (var itms in responsbode.entries) {
                                  if (itms.value['iduser'] ==
                                      FirebaseAuth.instance.currentUser!.uid) {
                                    SharedPreferences sharedPreuser =
                                        await SharedPreferences.getInstance();
                                    sharedPreuser.setString(
                                        'emailuser', email.text);
                                    sharedPreuser.setString('Imageurluser',
                                        itms.value['imagurluser']);
                                    sharedPreuser.setString(
                                        'usenametext', itms.value['username']);
                                  }
                                }

                                controller.setdata();
                              });

                              Get.off(Spllash());
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${e.message}")));
                            }
                          }
                        },
                        icon: const Icon(Icons.login),
                        label: const Text("login"))),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text);
                  },
                  child: Text("forget password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "create new account",
                    ),
                    TextButton(
                        onPressed: () {
                          Get.off(() => const Singin());
                        },
                        child: const Text("singin")),
                  ],
                ),
                Container(
                  width: width,
                  height: 40,
                  child: TextButton.icon(
                      onPressed: () async {
                        // Trigger the authentication flow
                        try {
                          final GoogleSignInAccount? googleUser =
                              await GoogleSignIn().signIn();
                          if (googleUser == null) {
                            return;
                          }
                          // Obtain the auth details from the request
                          final GoogleSignInAuthentication googleAuth =
                              await googleUser.authentication;

                          // Create a new credential
                          final credential = GoogleAuthProvider.credential(
                            accessToken: googleAuth.accessToken,
                            idToken: googleAuth.idToken,
                          );

                          // Once signed in, return the UserCredential
                          await FirebaseAuth.instance
                              .signInWithCredential(credential);
                          Get.off(Spllash());
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("$e")));
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text("login with google")),
                )
              ],
            ),
          ),
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
