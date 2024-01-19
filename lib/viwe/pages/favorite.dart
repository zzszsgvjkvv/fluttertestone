import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/model/data.dart';
import 'package:shoppingapp/viwe/pages/demo.dart';
// ignore_for_file: prefer_const_constructors

// ignore: must_be_immutable
class Gradviwfavorite extends StatefulWidget {
   Gradviwfavorite({super.key});

  @override
  State<Gradviwfavorite> createState() => _GradviwfavoriteState();
}

class _GradviwfavoriteState extends State<Gradviwfavorite> {
Storitms controller = Get.put(Storitms(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double whidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<Storitms>(
        init: Storitms(),
        builder: (controller) =>

            /* controller.data.isEmpty?
      Center(child: Text("no itms to show"),) */
            GridView.builder(
              //   itemCount:data.length,
              itemCount: controller.favorititms.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: whidth > 600 ? 4 : 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                onHover: (value) {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
                  width: whidth / 2 - 30,
                  height: height / 2 - 30,
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
                              child: Text(
                                  "${controller.favorititms[index].discount}%"),
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
                                    controller.favorititms[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                           Container(
                                padding: const EdgeInsets.all(4.0),
                                child: MyCustomWidget(
                                  remov:true,
                                  modelitme: controller.favorititms[index],),
                              ),
                            
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
                          child: Image.network(controller.data[index].imgurl),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "add to card",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        SizedBox(
                            width: 200,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  " price:${dataitmsrow[index].price}\$ ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_bag_outlined,
                                  ),
                                ),
                              ],
                            )),
                        Text(
                          " amount:${controller.data[index].amount} ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          "description:${controller.data[index].description} ",
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
              ),
            ));
  }
}
