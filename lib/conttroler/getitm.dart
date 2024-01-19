import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shoppingapp/model/datamodel.dart';
import 'package:shoppingapp/model/model.dart';
import 'package:http/http.dart' as http;

class Storitms extends GetxController {
  //Rx<List<Modelitme>> data = Rx<List<Modelitme>>([]);
  List<Modelitme> data = [];
  List<Modelitme> favorititms= [];

  String typeitms = Categories.laptopacer.name;
  int price = 1;
  String description = "";
  int amount = 1;
  String id = "";
  int discont = 1;
  String title = "";
  String imgurl = "";
  String userimgurl = "";
  String username = "";
  String emailuser = "";
  List<Modelitme> itmslist = [];
  List<Modelitme> card = [];
  // RxInt itemCount = 0.obs;
  void additms() {
    Modelitme modelitme = Modelitme(
        id: id,
        title: title,
        imgurl: description,
        description: description,
        discount: discont,
        amount: amount,
        price: price);
    data.add(modelitme);
    //  itemCount.value = data.length;
    update();
  }

  void addfavorititms(Modelitme index) {
    favorititms.add(index);

    update();
  }

  void removfavorititms(Modelitme index) {
    favorititms.remove(index);

    update();
  }

  void removititms(Modelitme index) {
    data.remove(index);

    update();
  }

  void setdata() async {
    SharedPreferences sharedPreuser = await SharedPreferences.getInstance();

    emailuser = sharedPreuser.getString('emailuser')!;
    userimgurl = sharedPreuser.getString('Imageurluser')!;
    username = sharedPreuser.getString('usenametext')!;
  }

  void getdata() {
    itmslist = [];
    final uriget =
        Uri.https('newtest-90b54-default-rtdb.firebaseio.com', 'listpost.json');
    http.get(uriget).then((response) {
      if (json.decode(response.body) == null) {
        return;
      }
      final Map responsbode = json.decode(response.body);

      for (var itms in responsbode.entries) {
        String id = itms.key;
        int amount = itms.value['amount'];

        String imgurl = itms.value['imagurl'];

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

      data = itmslist;
    });
  }

  @override
  void onInit() {
    getdata();
    setdata();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: impleme
    //nt onClose

    super.onClose();
  }
}
