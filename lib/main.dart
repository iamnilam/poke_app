import 'package:flutter/material.dart';
import 'package:poke_app/api_services.dart';
import 'package:poke_app/detail_screen.dart';
import 'package:poke_app/text_style.dart';

import 'poke_type_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           const SizedBox(
              height: 30,
            ),
            const Text(
              "PokeApp",
              style: TextStyle(fontFamily: "circula_bold", fontSize: 35),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getAPI(),

                  builder: (BuildContext context, AsyncSnapshot snapshot){

                    if(snapshot.hasData){
                      var data = snapshot.data;
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: width < 600 ? 2 : width < 1100 ?  4 : 6, mainAxisSpacing: 8, crossAxisSpacing: 8),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) => DetailsScreen(data: data[index],)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -20,
                                    right: -20,
                                    child: Image.asset(
                                      "assets/pokeball.png",
                                      width: 150,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -20,
                                    right: -20,
                                    child: Image.asset(
                                      "assets/pokeball.png",
                                      width: 150,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Image.network(
                                      data[index]["imageurl"],
                                      width: 150,
                                      // color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                      top: 20,
                                      left: 10,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          headingText(
                                              text: data[index]["name"],
                                              color: Colors.white,
                                              size: 18),
                                          Center(
                                            child: typeContainer(
                                                text: "Grass",
                                                color: Colors.white,
                                                size: 16),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          typeContainer(
                                              text: "Poison", color: Colors.black, size: 16),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }else {
                      return Center(
                        child:
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Colors.cyan
                          ),
                        ),
                      );
                    }
                  })
            )
          ],
        ),
      )),
    );
  }
}
