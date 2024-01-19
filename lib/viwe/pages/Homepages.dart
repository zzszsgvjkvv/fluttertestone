import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:shoppingapp/viwe/consthelp/drawehome.dart';
import 'package:shoppingapp/viwe/pages/pageitmHome.dart';
import 'package:shoppingapp/viwe/pages/pageitmcard.dart';
import 'package:shoppingapp/viwe/pages/itmpersonpage.dart';
import 'package:shoppingapp/viwe/pages/pageitmfavorite.dart';

// ignore: must_be_immutable
class HomePages extends StatefulWidget {
  const HomePages({
    super.key,
  });

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  TextEditingController serch = TextEditingController();

  int currentIndex = 0;
  List<Widget> itmspage = [Home(), Pageitmcard(), Favorite(), Itmpersonpage()];

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double higth=MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.easeInOutExpo,
          animationDuration: const Duration(milliseconds: 600),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          height: 60,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          // currentIndex: currentIndex,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          /*   unselectedFontSize: 10,
          selectedFontSize: 20,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.8), */
          items: [
            Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            Icon(
              Icons.card_giftcard_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            Icon(Icons.favorite, color: Theme.of(context).colorScheme.primary),
            Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
          ]),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      drawer: const Drawer(child: drawehome()),
      body: itmspage.elementAt(currentIndex),
    );
  }
}
