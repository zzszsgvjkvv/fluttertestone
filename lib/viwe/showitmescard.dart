import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Sowcard extends StatefulWidget {
  Sowcard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.leadingurl,
      required this.trailing});
  final String title;
  final int subtitle;
  final String leadingurl;
  final int trailing;

  @override
  State<Sowcard> createState() => _SowcardState();
  bool colorstart = false;
}

class _SowcardState extends State<Sowcard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        margin: const EdgeInsets.only(bottom: 30, top: 20),
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          children: [
            Row(
              children: [
                Image.network(width: width / 2, widget.leadingurl),
                const SizedBox(
                  width: 70,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 8, bottom: 5),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    height: height / 2,
                    width: width / 3,
                    child: ListView(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("colors"),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 16,
                  height: 16,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 16,
                  height: 16,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 16,
                  height: 16,
                  color: Colors.green,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    widget.colorstart = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    widget.colorstart = false;
                  });
                },
                child: AnimatedContainer(
                  color: widget.colorstart
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.secondaryContainer,
                  duration: Duration(microseconds: 200),
                  height: widget.colorstart ? 150 : 100,
                  child: Card(
                      child: ListTile(
                          leading: Icon(Icons.shop),
                          title: Text("clic her to get it   "),
                          subtitle: Text(" pris is :${widget.subtitle} \$"),
                          trailing: Text(" cona is : ${widget.trailing}"))),
                ),
              ),
            ),
          ],
        ));
  }
}
