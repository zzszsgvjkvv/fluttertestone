enum type {
  php,
  lenvo,
  asus,
  acer,
  
}

class Modelitme {
  Modelitme({
    required this.title,
    required this.imgurl,
    required this.description,
    required this.discount,
    required this.amount,
    required this.price,
    required this.id,
  });
  final String title;
  final String id;

  final String imgurl;
  final String description;
  final int discount;
  final int amount;
  final int price;
}
// no use now 
class Modelitmecard {
  Modelitmecard(this.numberofsal, {
    required this.title,
    required this.imgurl,
    required this.description,
    required this.discount,
    required this.amount,
    required this.price,
    required this.id,
  });
  final String title;
  final String id;

  final String imgurl;
  final String description;
  final int discount;
  final int numberofsal;
  final int amount;
  final int price;
}
