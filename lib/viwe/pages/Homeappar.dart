import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/viwe/pages/apifirbase.dart/add.dart';
import 'package:shoppingapp/viwe/pages/pageitmcard.dart';

class Homeappar extends StatefulWidget {
  const Homeappar({super.key});

  @override
  State<Homeappar> createState() => _HomeapparState();
}

class _HomeapparState extends State<Homeappar> {
  Storitms controller = Get.put(Storitms(), permanent: true);
  @override
  Widget build(BuildContext context) {
//double higth=MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      //  height:higth/8 ,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            
              onPressed: () {
                Get.off(AddData());
              },
              icon: Icon(Icons.admin_panel_settings),
              label: Text("insert data")),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.sort,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "GO  Shopping",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Spacer(),
            GetBuilder<Storitms>(builder:(controller) =>    badges.Badge(
                  badgeContent: Text("${controller.card.length}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          fontSize: 10)),
                  child: InkWell(
                    onTap: () {
                      Get.to(Pageitmcard());
                    },
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 35,
                    ),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
