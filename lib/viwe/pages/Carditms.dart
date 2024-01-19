
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';

import 'package:uuid/uuid.dart';
class Carditms extends StatefulWidget {
  const Carditms({super.key, required this.count, });

  @override
  State<Carditms> createState() => _CarditmsState();
   final int  count;
}

class _CarditmsState extends State<Carditms> {

  Storitms controller = Get.put(Storitms(), permanent: true);
  @override
  Widget build(BuildContext context) {

    /* double whidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height; */
   return   GetBuilder<Storitms>(
        init: Storitms(),
        builder: (controller) {
   
    return ListView.builder(
      itemCount: controller.card.length,
      itemBuilder: (context, index) {
 

        return
      
      
      Dismissible(
     key: ValueKey(const Uuid().v1()),
     onDismissed: (direction) {
      controller.card.removeAt(index);
     },
      child: InkWell(
        onTap: () {},
        onHover: (value) {},
        child: Container(

          padding:const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        foregroundImage:
                            NetworkImage(controller.card[index].imgurl),
                      ),
                      Text(
                        controller.card[index].title,
                        style: const TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          onPressed: () {
                          controller.card.removeAt(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
          
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text("${    controller.card[index].price}\$"),
                    ),
                    Text("all price is ${controller.card[index].price}\$",style: TextStyle(color:   Theme.of(context).colorScheme.primaryContainer,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {
                          setState(() {
                           // countw--;
                          
                          });
                        }, icon: const Icon(Icons.remove)),
                        const Padding(padding: EdgeInsets.all(1)),
                        Text("${2}"),
                        IconButton(
                            onPressed: () {
                              setState(() {
                              //  countw++;
                              });
                            }, icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                )
            
              ]),
        ),
      ),
    );});});
  }
}
