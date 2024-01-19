import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoppingapp/conttroler/getitm.dart';

import 'package:shoppingapp/viwe/pages/auth/singin.dart';

class drawehome extends StatefulWidget {
  const drawehome({super.key});

  @override
  State<drawehome> createState() => _drawehomeState();
}

class _drawehomeState extends State<drawehome> {
  Storitms controller = Get.put(Storitms(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Storitms>(
        builder: (controller) => Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundImage: NetworkImage(controller.userimgurl),
                  ),
                  Center(
                    child: Text("welcom ${controller.username}"),
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.login),
                      label:const Text("singin")),
                  TextButton.icon(
                      onPressed: () {
                        GoogleSignIn googleSignIn=GoogleSignIn();
                        googleSignIn.disconnect();
                        FirebaseAuth.instance.signOut();
                        Get.off(const Singin());
                      },
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text("logout")),
                       TextButton.icon(
                      onPressed: () {
                       
                      },
                      icon: const Icon(Icons.settings),
                      label: const Text("setting"))
               
               
                ],
              ),
            ));
  }
}
