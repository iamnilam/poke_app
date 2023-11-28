import 'package:flutter/material.dart';
import 'package:poke_app/landscapeContainer.dart';
import 'package:poke_app/poke_type_container.dart';
import 'package:poke_app/portrait_container.dart';
import 'package:poke_app/rowStyling.dart';
import 'package:poke_app/stat_row.dart';
import 'package:poke_app/text_style.dart';

class DetailsScreen extends StatelessWidget {
  dynamic data;
   DetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("App"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              color: Colors.amber,
              child: orientation == Orientation.portrait ?  portraitCoontaier(data) : landspaceContainer(),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                //color: Colors.green,
              ),
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: "About",
                      ),
                      Tab(
                        text: "About",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            normalText(
                                color: Colors.black,
                                size: 16,
                                text:
                                    data["xdescription"]),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: width - 100,
                                child: Card(
                                  color: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            headingText(
                                                color: Colors.grey,
                                                size: 16,
                                                text: "Height"),
                                            headingText(
                                                color: Colors.grey,
                                                size: 16,
                                                text: data["height"]),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            headingText(
                                                color: Colors.grey,
                                                size: 16,
                                                text: "Weight"),
                                            headingText(
                                                color: Colors.grey,
                                                size: 16,
                                                text: data["weight"]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            headingText(
                                color: Colors.black, size: 16, text: "Breeding"),
                            SizedBox(
                              height: 15,
                            ),
                            rowStyling(
                                text: "Gender",
                                value: "Male",
                                color: Colors.grey),
                            rowStyling(
                                text: "Egg Cycle",
                                value: "Grass Monster",
                                color: Colors.grey),
                            rowStyling(
                                text: "Evolution",
                                value: "Grass Monster",
                                color: Colors.grey),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            statRow(text: "Hp", value: "20"),
                            statRow(text: "Attack", value: "70"),
                            statRow(text: "Defense", value: "40"),
                            statRow(text: "Hp", value: "90"),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
