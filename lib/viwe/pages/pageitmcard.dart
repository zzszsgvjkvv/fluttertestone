import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/viwe/pages/Carditms.dart';
import 'package:shoppingapp/viwe/pages/Homepages.dart';


class Pageitmcard extends StatefulWidget {
  const Pageitmcard({super.key});

  @override
  State<Pageitmcard> createState() => _PageitmcardState();
}

class _PageitmcardState extends State<Pageitmcard> {
  // Storitms controller = Get.put(Storitms(), permanent: true);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double higth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body:  Padding(
      padding: EdgeInsets.all(5),
      child: SafeArea(
        child: ListView(
            children: [
                SizedBox(height: 20,),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer),
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "your itms card her",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30, color: Theme.of(context).colorScheme.primary),
                  )),
              Container(
                height: higth*0.5,
                width: width,
                child: Carditms(count: 1,),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  Text(
                    "add conpo",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
         Container(
          padding:  EdgeInsets.all(8),
          margin: EdgeInsets.all(20),
                height: 100,
                color:Theme.of(context).colorScheme.onPrimary ,
                child: Text(
                    "total price is : \$",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 24),)
          ,
              ),
                SizedBox(
                height: 20,
              ),
        
              Container(
                margin: EdgeInsets.all(5),
               
                decoration: BoxDecoration(color:Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)
                 ),
                child: TextButton(onPressed: (){}, child: Text(
                    "Check out",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 24),)),)
           
            , SizedBox(
                height: 30,
              ),
            TextButton(child: Text("go to home"),onPressed: () {
           Get.off(HomePages());
         },) 
            ,
            SizedBox(height: 20,)
            ],
        
        ),
      ),
    ));
  }
}
