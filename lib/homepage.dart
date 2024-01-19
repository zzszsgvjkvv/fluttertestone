import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/model/data.dart';
import 'package:shoppingapp/viwe/consthelp/texform.dart';
import 'package:shoppingapp/viwe/showitmescard.dart';
import 'package:shoppingapp/viwe/pages/Homepages.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

TextEditingController serch = TextEditingController();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
                width: width,
                height: height / 3,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                        child: Textformitm(
                          boolobscureText: false,
                      icon: Icon(Icons.search),
                      controller: serch,
                      hint: "tell me what you nedd",
                      label: "serch in database ",
                      validator: (v) {
                        return "";
                      },
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "all favorit her",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.primary),
                        )),
                  ],
                )),
            SizedBox(
              width: width,
              height: height * 0.56,
              child: ListView(
                children: [
                  for (final e in dat)
                    Sowcard(
                        title: e.title,
                        subtitle: e.price,
                        leadingurl: e.imgurl,
                        trailing: e.amount)
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.off(HomePages());
                },
                child: Text("all favorit her")),
          ],
        )),
      ),
    );
  }
}
