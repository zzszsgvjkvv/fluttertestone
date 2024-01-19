import 'package:flutter/material.dart';

Map<Categories, Category> categories = {
  Categories.laptopphp: Category(
    icon: const Icon(Icons.laptop),
  ),
  Categories.laptopacer: Category(
    icon: const Icon(Icons.laptop),
  ),
  Categories.laptoplenvo: Category(
    icon: const Icon(Icons.laptop),
  ),
  Categories.laptopasus: Category(
    icon: const Icon(Icons.laptop),
  ),
  Categories.laptoptoshiba: Category(
    icon: const Icon(Icons.laptop),
  ),
  Categories.mobile: Category(
    icon: const Icon(Icons.mobile_friendly),
  ),
  Categories.otheritms: Category(
    icon: const Icon(Icons.shopping_bag),
  )
};

enum Categories {
  laptopphp("php"),
  laptopasus("asus"),
  laptoplenvo("lenvo"),
  laptopacer("acer"),
  laptoptoshiba("toshiba"),
  mobile(" mobilesamsun"),

  otheritms("otheritms");

  const Categories(this.name);
  final String name;
}
 

class Category {
  final Icon icon;

  Category({required this.icon});
}
