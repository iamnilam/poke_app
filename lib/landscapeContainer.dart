import 'package:flutter/material.dart';
import 'package:poke_app/poke_type_container.dart';
import 'package:poke_app/text_style.dart';

Widget landspaceContainer(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          headingText(
              color: Colors.white, size: 36, text: "Bulbassuar"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              typeContainer(
                  color: Colors.white, size: 16, text: "Grass"),
              const SizedBox(
                width: 10,
              ),
              typeContainer(
                  color: Colors.white, size: 16, text: "Poison")
            ],
          ),
          const SizedBox(
            height: 5,
          ),

        ],
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/pokeball.png",
              width: 200,
              color: Colors.white.withOpacity(0.5),
            ),
            Image.asset("assets/img1.png")
          ],
        ),
      )
    ],
  );
}