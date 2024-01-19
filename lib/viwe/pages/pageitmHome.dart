import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/model/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppingapp/viwe/consthelp/texform.dart';

import 'package:shoppingapp/viwe/pages/gradviwe.dart';
import 'package:shoppingapp/viwe/pages/Homeappar.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Storitms controller = Get.put(Storitms(), permanent: true);
  bool isemailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  @override
  Widget build(BuildContext context) {
    TextEditingController serch = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double higth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          isemailVerified
              ? const Center(child: Text("emailVerified its ok"))
              : Center(
                  child: Text(
                  "go to email and emailVerified",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                )),
          SizedBox(
            height: higth / 4,
            child: Homeappar(),
          ),
          const SizedBox(height: 10),
          Container(
              height: higth / 5,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                      child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      Expanded(
                        child: Textformitm(
                          boolobscureText: false,
                          icon: const Icon(Icons.search),
                          controller: serch,
                          hint: "tell me what you nedd",
                          label: "serch in database ",
                          validator: (v) {
                            return "";
                          },
                        ),
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.insert_chart)),
                          Text(
                            "all favorit her",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      )),
                ],
              )),
          Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(10),
            width: width,
            height: higth / 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondaryContainer),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              for (final e in dataitmsrow)
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("from php "),
                          ),
                          CircleAvatar(
                            foregroundImage: NetworkImage(
                              e.imgurl,
                            ),
                          ),
                        ],
                      ),
                    )),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: higth - (higth / 8) - (higth / 8),
            child: Gradviw(),
          )
        ],
      ),
    );
  }
}
/*    Container(
          height: 500,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      Expanded(
                        child: Textformitm(
                          icon: const Icon(Icons.search),
                          controller: serch,
                          hint: "tell me what you nedd",
                          label: "serch in database ",
                          validator: (v) {
                            return "";
                          },
                        ),
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(children: 
                      
                      
                      [
                        IconButton(onPressed: (){}, icon: Icon(Icons.insert_chart)),
                        Text(
                        "all favorit her",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.primary),
                      )],)),
                ],
              )), */

     