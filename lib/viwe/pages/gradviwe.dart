import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';

import 'package:shoppingapp/model/model.dart';
import 'package:shoppingapp/viwe/pages/apifirbase.dart/edite.dart';

import 'package:shoppingapp/viwe/pages/demo.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/viwe/pages/pageitmcard.dart';

// ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class Gradviw extends StatefulWidget {
  Gradviw({super.key});

  @override
  State<Gradviw> createState() => _GradviwState();
}

class _GradviwState extends State<Gradviw> {
  Storitms controller = Get.put(Storitms(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double whidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return GetBuilder<Storitms>(
        init: Storitms(),
        builder: (controller) {
          controller.data.isEmpty ? controller.getdata() : null;
          List<Modelitme> p = controller.data;
          return GridView.builder(
              itemCount: p.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: whidth > 600 ? 4 : 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.4),
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.off(EditData(model: p[index]));
                    },
                    onHover: (value) {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                      ),
                      width: whidth * 0.6,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.6),
                                  ),
                                  child: Text("${p[index].discount}%"),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        p[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MyCustomWidget(
                                        remov: false,
                                        modelitme: p[index],
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(p[index].imgurl),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.card.add(p[index]);
                                Get.off(Pageitmcard());
                              },
                              child: Text(
                                "add to card",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            SizedBox(
                                width: 200,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " price:${p[index].price}\$ ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final uriget = Uri.https(
                                            'newtest-90b54-default-rtdb.firebaseio.com',
                                            'listpost/${p[index].id}.json');
                                        http.delete(uriget);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                      ),
                                    ),
                                  ],
                                )),
                            Text(
                              " amount:${p[index].amount} ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            Text(
                              "description:${p[index].description} ",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        });
    //:CircularProgressIndicator(color: Colors.green,);
  }
}
