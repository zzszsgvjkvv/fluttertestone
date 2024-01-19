import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/viwe/consthelp/texform.dart';
import 'package:shoppingapp/viwe/pages/auth/loginpage.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/viwe/pages/auth/useimage.dart';

final _firebase = FirebaseAuth.instance;

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  Storitms controller = Get.put(Storitms(), permanent: true);

  GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController usename = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  File? selectimagepicer;
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(80)),
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      "assets/images/log.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "singin page",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 40,
                ),
                Userimge(
                  onpicimage: (File picimage) {
                    selectimagepicer = picimage;
                  },
                ),
                Textformitm(
                  boolobscureText: false,
                  icon: Icon(Icons.person),
                  controller: usename,
                  hint: " enter usename",
                  label: "usename",
                  validator: valedat,
                ),
                const SizedBox(
                  height: 40,
                ),
                Textformitm(
                  boolobscureText: false,
                  icon: Icon(Icons.email),
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
                  icon: const Icon(Icons.person),
                  controller: password,
                  hint: " enter password",
                  label: "password",
                  validator: valedat,
                ),
                GetBuilder<Storitms>(
                    builder: (controller) => TextButton.icon(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            try {
                              final UserCredential userCredential =
                                  await _firebase
                                      .createUserWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text);
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();

                              final Reference reference = FirebaseStorage
                                  .instance
                                  .ref()
                                  .child('uerimage')
                                  .child('${userCredential.user!.uid}.jpg');

                              await reference.putFile(selectimagepicer!);
                              // ignore: non_constant_identifier_names
                              final Imageurl = await reference.getDownloadURL();
                              final uri = Uri.https(
                                  'newtest-90b54-default-rtdb.firebaseio.com',
                                  'usedata.json');
                              final http.Response response = await http.post(
                                  uri,
                                  headers: {"Content-Type": "application/json"},
                                  body: json.encode({
                                    "iduser":
                                        FirebaseAuth.instance.currentUser!.uid,
                                    "imagurluser": Imageurl,
                                    "username": usename.text 
                                  }));
                                  if(response.statusCode==200){

                                
                                  }

                              SharedPreferences sharedPreuser =
                                  await SharedPreferences.getInstance();
                              sharedPreuser.setString('emailuser', email.text);
                              sharedPreuser.setString('Imageurluser', Imageurl);
                              sharedPreuser.setString(
                                  'usenametext', usename.text);
                              controller.setdata();
                             
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userCredential.user!.uid)
                                  .set({
                                'username': usename.text.toString(),
                                'email': email.text.toString(),
                                'imageurl': Imageurl
                              });
                              controller.emailuser = email.text;
                              controller.userimgurl = Imageurl;
                              controller.username = usename.text;
                              Get.off(loginpage(imageuser: Imageurl));
                        
                            } on FirebaseAuthException catch (e) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${e.message}")));
                            }
                          }
                        },
                        icon: const Icon(Icons.login),
                        label: const Text("sining"))),
                TextButton(
                    onPressed: () {
                      Get.off(loginpage(
                          imageuser:
                              "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAMFBMVEXk5ueutLfX2tynrrLn6eqrsbXq7O3h4+SyuLva3d6/w8bLz9HU19nR1NbIzM66v8KaEzi7AAAFHUlEQVR4nO2d23LjIAxAjREXYwP//7cLTrpNUzs1IEdyhvOwM7vbB5+RAHHtMHQ6nU6n0+l0Op1Op9PpdDqdTqfT6XQ6nU4JoDUMZhoTk1n/clHSt5vFRftNdN5oTf1dFYA2wYrf2HA5H9DBSrXhIoSSYoYLpRsMQcpNkxtSBkP9jUcxs3qlsuqoYC4QHTDebufXk4717HVgcuqIS2o7yk28bcDHYyqrjvWc+zUI4rhLshGBb2zAFZjcdNzAVAcKUuy/TeRpU+PC1qbKJdswHEBdnUsacQL1p/8i1Lqk2MzUH/8TWKpVcg+9sGo25lAJs4udqAUeqW4w99hEPqEB3+aSOgFGhU2jSo4Nl9Do8Nf05YCMYxIaaHdJNjyGTh0RXISILEJjMAKT4DBV043d8n8cvQyYrdWxCpSlD42ecVwSM3mrAZzmL3LvTN2hwYSUZQk7EucZ4GVZmgoQ5xlg9WWCQZ5NlZPlTZlIOxOABa/JJGgnaZhNJjcaWpmGqf+GDO3ShkFs/+Q9AGb7X5fQCPMMJrTxf4W0PIMRtTMTgrIGQO6ZhSKVaV6WeZJZ6FzQZeQnySj/QTLyk2Ro20zL4v+mTB9nmMqQLtB8UjmDXTWTFprNu0xPMrRTAOTJGe1OLfK02dNOm1G7M+pVQPNBS024i4DURzXAI6410zaZofk4wwPkWZY3zpBc0ihDHRjMwpk8y5IN1jZgpDYZEPcBA/kuYAJwXCy1xwrMKCc0mJwKhqLDzHtQW9yBpT00kkFXdqPuEPAjynJo/SswNQeG040N35Zoktf52abiWTnqz/8BTC31puWUZEPjTg31MZNfNExsKFfL96it0Xg1/i/mqmbD0wVqOmjS7aXXjAdvAn67UG7I/AEYWxIcKchn/a+AwR23kbzGyg30cnBCoNTCprjcBYw7pOOYDfvbgB7j6+JGKRvHq7zaALA4uxuepOKWS70IAFNwdqOjzkEJ05VUMgBm9CFaKdXqlP6U0kY3j+ZqKivJx0yLD8FlQpiXabqmyZ307eaL4coi62stT1xQJ3/2YCY/pwyLD8/OuJxqZv3fa5BayhKikCtP3Zm6/6t188TysvkX+dtSMJz97bA11qQfyj3bYPhJ5WY+zlmkZA6QfjqGlHecfFJi5YioIpHvzEs5tzBJOtBDDknprOynj4jB05cFqWxpNHnwWQbKTk6/LChLfVLVNhsqHT34iKZy8xE2TBQ6WgdEjQfi26MD4Nsbyg7yvUfokopAutC8hZLubas2qVwpWlCq0RHhLXMFGEbUo4x7OtafP46CCWgnf17bKDeeG5y8UnFyhj3o2FOf2oPhTWH50onnbUMB7nW5IzZ2Pqnl6OWtYblzzmtuULeX1Io6Zff2fS3/yUZij6BgIpGLyDfRUGMDeMdKq2wwTwm1HVlAAPE6OrkLog0DlwSOzfuHym0w2g3gXl6qx2L0aajXfVpAuJDWeCwOkebXQ2Fk49J8boB4sHymbfAEqoJsB9VQdGIcWEZFNby1h3TKH5H6REN7IA+Tyh6t/ej1CdS+t6l5lDHPVA2dMFJ/9iZ1oWEamKprtujvFmBRc2kQ82osKqripWoms5gtiudp4Kk/eZfyJxC4TMm2KO0CsB8uQ6X0QQfs13FQKc4zmoXlgxROoDk3mVQ7FzUazOdxT6Dsvh2MnAMjVNFvFmM3xXyibJ0G5e71edgSGcNm5W+HIhkneVNUa66/AZMxZaMm8KbIpdPpdDqdTucq/AMef1AMtjuGRwAAAABJRU5ErkJggg=="));
                    },
                    child: Text("login"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
