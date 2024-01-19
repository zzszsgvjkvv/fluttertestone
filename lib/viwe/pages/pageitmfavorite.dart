import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/viwe/pages/demo.dart';




// ignore: must_be_immutable
class Favorite extends StatefulWidget {
   Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  Storitms controller = Get.put(Storitms(), permanent: true);
  @override
  Widget build(BuildContext context) {
    double whidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(body: 
  Container(
    width: whidth,
    height: height,
    padding: EdgeInsets.all(10),
  margin: EdgeInsets.only(top: 25,left: 2,right: 2,bottom: 1,)
  ,child: GetBuilder<Storitms>(
        init: Storitms(),
        builder: (controller) =>

             controller.data.isEmpty?
      Center(child: Text("no itms to show"),):
            GridView.builder(
             
              itemCount: controller.favorititms.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.4
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                onHover: (value) {},
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
                
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.all(3),
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
                                margin: const EdgeInsets.only(left: 10),
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
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                         
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(controller.favorititms[index].imgurl),
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
                                  " price:${controller.favorititms[index].price}\$ ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                  ),
                                ),
                              ],
                            )),
                        Text(
                          " amount:${controller.favorititms[index].amount} ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          "description:${controller.favorititms[index].description} ",
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
            ))
  
  ));
  }
}
