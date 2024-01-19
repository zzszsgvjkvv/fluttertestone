import 'package:get/get.dart';
import 'package:shoppingapp/conttroler/getitm.dart';
import 'package:shoppingapp/model/model.dart';
import 'package:tweener/tweener.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCustomWidget extends StatefulWidget {
  final Modelitme modelitme;
 final bool remov;
  Storitms controller = Get.put(Storitms(), permanent: true);
  @override
  
  

   MyCustomWidget({super.key, required this.modelitme, required this.remov});
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget> {
  
  double _counter = 0;
  bool tap = true;
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<Storitms>(
        init: Storitms(),
        builder: (controller) =>
    InkWell(
      
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        tap = !value;
        show = false;
        if (tap == true) {
          Tweener({'x': 30})
              .to({'x': 20}, 500)
              .easing(Ease.linear.easeIn)
              .onUpdate((obj) {
                setState(() {
                  _counter = (obj['x']).round() * 1.0;
                });
              })
              .onComplete((obj) {})
              .start();
        } else {
          Tweener(
            {'x': 30},
          )
              .to({'x': 20}, 30)
              .easing(Ease.linear.easeIn)
              .onUpdate((obj) {
                setState(() {
                  _counter = (obj['x']).round() * 1.0;
                });
              })
              .onComplete((obj) {})
              .start();
        }
      },
      onTap: () {
    var isinsaid = controller.favorititms.where((element) => element.id==widget.modelitme.id).toList();
          show = false;
          

        widget.remov? controller.removfavorititms(widget.modelitme):
        
    isinsaid.isEmpty?
      controller.addfavorititms(widget.modelitme)
      :
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("it allred add")))
      ;
      //  Get.back();
        
        //print("object");
      
      },
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1500),
        height: tap ? 30 : 35,
        width: tap ? 30 : 35,
        decoration: BoxDecoration(
            color: Color(0xFFFF5757),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFFF5757),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: show ? 15 : _counter,
        ),
      ),
    ));
  }
}
