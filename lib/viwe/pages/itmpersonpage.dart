import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Itmpersonpage extends StatefulWidget {
  const Itmpersonpage({super.key});

  @override
  State<Itmpersonpage> createState() => _ItmpersonpageState();

}
List data =[];
void getdata()async{
   final users =await FirebaseFirestore.instance.collection('users').get();
   data.addAll(users.docs);
}
class _ItmpersonpageState extends State<Itmpersonpage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return SafeArea(
      child: Column(
        children: [
          
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;

                  return Column(children: [
                    Text("Full Name: ${data['username']}"),
                    Text("Full emsil: ${data['email']}"),
                    SizedBox(
                      width: 500,
                      child: Text(
                        " imageurl: ${data['imageurl']}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]);
                }

                return const Text("loading");
              },
            ),
          ),
        ],
      ),
    );
  }
}
