import 'dart:convert';
import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/model/datamodel.dart';
import 'package:shoppingapp/model/model.dart';

import 'package:shoppingapp/viwe/consthelp/texform.dart';
import 'package:shoppingapp/viwe/pages/Homepages.dart';
import 'package:shoppingapp/viwe/pages/auth/useimage.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class EditData extends StatefulWidget {
  
  const EditData({super.key, required this.model});
final Modelitme model;
  @override
  State<EditData> createState() => _AddDataState();
}

class _AddDataState extends State<EditData> {
  Storitms controller = Get.put(Storitms(), permanent: true);

  TextEditingController title = TextEditingController();

  TextEditingController discont = TextEditingController();

  TextEditingController amount = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController imageurl = TextEditingController();

  String typeitms = Categories.laptopacer.name;
  bool load = false;
  File? selectimagepicer;
  @override
  Widget build(BuildContext context) {
    
    final formkey = GlobalKey<FormState>();
    String? validator(String? input) {
      if (input == null) {
        return " input is null";
      } else if (input.isEmpty) {
        return "null vall";
      } else {
        return null;
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      body: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: ListView(
            children: [
              Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Textformitm(
                        boolobscureText: false,
                        TextInputType: TextInputType.name,
                        controller: title,
                        hint: 'enter titel itms',
                        label: 'titel itme',
                        validator: validator,
                        icon: const Icon(Icons.title),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Textformitm(
                        boolobscureText: false,
                        TextInputType: TextInputType.name,
                        controller: imageurl,
                        hint: 'enter imageurl',
                        label: 'imageurl itme',
                        validator: validator,
                        icon: const Icon(Icons.image),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Textformitm(
                        boolobscureText: false,
                        TextInputType: TextInputType.name,
                        controller: description,
                        hint: 'enter description itms',
                        label: 'description itme',
                        validator: validator,
                        icon: const Icon(Icons.title),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Textformitm(
                            boolobscureText: false,
                            TextInputType: TextInputType.number,
                            controller: price,
                            hint: 'enter price itms',
                            label: 'price itme',
                            validator: validator,
                            icon: const Icon(Icons.title),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Textformitm(
                            boolobscureText: false,
                            TextInputType: TextInputType.number,
                            controller: amount,
                            hint: 'enter amount itms',
                            label: 'contt itme',
                            validator: validator,
                            icon: const Icon(Icons.title),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Textformitm(
                            boolobscureText: false,
                            TextInputType: TextInputType.number,
                            controller: discont,
                            hint: 'enter discont itms',
                            label: 'discont',
                            validator: validator,
                            icon: const Icon(Icons.title),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: DropdownButtonFormField(
                            //  value: Categories.asus,
                            validator: (value) {
                              if (value == null) {
                                return "vall is null";
                              } else {
                                return null;
                              }
                            },
                            items: [
                              for (final e in categories.entries)
                                DropdownMenuItem(
                                    value: e.key.name,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2, left: 2),
                                          child: Text(e.key.name),
                                        ),
                                        e.value.icon
                                      ],
                                    ))
                            ],
                            onChanged: (value) {
                              typeitms = value!;
                            },
                          ))
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Userimge(
                onpicimage: (File picimage) {
                  selectimagepicer = picimage;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<Storitms>(
                      builder: (controller) => TextButton.icon(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                             
                              controller.amount =
                                  int.parse(amount.text.toString());

                              controller.imgurl = imageurl.text.toString();

                              controller.title = title.text;

                              controller.discont =
                                  int.parse(discont.text.toString());

                              controller.price =
                                  int.parse(price.text.toString());

                              controller.description =
                                  description.text.toString();
                              // controller.additms();
                              //   Get.to(HomePages());

                              final Reference reference = FirebaseStorage
                                  .instance
                                  .ref()
                                  .child('uerimageitms')
                                  .child('${const Uuid().v1()}.jpg');

                              await reference.putFile(selectimagepicer!);
                              final Imageurl = await reference.getDownloadURL();

                              final uri = Uri.https(
                                  'newtest-90b54-default-rtdb.firebaseio.com',
                                  'listpost/${widget.model.id}.json');
                              final http.Response response = await http.put(
                                  uri,
                                  headers: {"Content-Type": "application/json"},
                                  body: json.encode({
                                    "amount": int.parse(amount.text.toString()),
                                    "imagurl": Imageurl,
                                    "title": controller.title = title.text,
                                    "discont":
                                        int.parse(discont.text.toString()),
                                    "description": description.text.toString(),
                                    "price": int.parse(price.text.toString()),
                                  }));

                              if (response.statusCode == 200) {
                                setState(() {
                                  load = false;
                                });
                                 setState(() {
                                load = true;
                              });
                                Get.off(const HomePages());
                              }
                            }
                          },
                          icon: const Icon(Icons.edit),
                          label: load
                              ? const CircularProgressIndicator(
                                  color: Colors.green,
                                )
                              : const Text("edite data"))),
                  TextButton.icon(
                      onPressed: () {
                        Get.off(const HomePages());
                      },
                      icon: load
                          ? const CircularProgressIndicator(
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                      label: const Text("cancel")),
                  TextButton.icon(
                      onPressed: () {
                        formkey.currentState!.reset();
                      },
                      icon: const Icon(Icons.restart_alt),
                      label: load
                          ? const CircularProgressIndicator(
                              color: Colors.green,
                            )
                          : const Text("rest")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}

/*     TextButton.icon(
                      onPressed: ()  {
                        final uriget = Uri.https(
                            'newtest-90b54-default-rtdb.firebaseio.com',
                            'listpost.json');
                           http.get(uriget).then((response){  final Map responsbode =
                             json.decode(response.body);
                        for (var itms in responsbode.entries) {
                          String id = itms.key;
                          int amount = itms.value['amount'];

                          String imgurl = itms.value['description'];

                          String title = itms.value['title'];

                          int discont = itms.value['discont'];

                          int price = itms.value['price'];

                          String description = itms.value['description'];
                          itmslist.add(Modelitme(
                              title: title,
                              imgurl: imgurl,
                              description: description,
                              discount: discont,
                              amount: amount,
                              price: price,
                              id: id));
                        }

                        controller.data = itmslist;} );
                      
                      },
                      icon: const Icon(Icons.show_chart),
                      label: const Text("show data")) */