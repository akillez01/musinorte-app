import 'package:flutter/material.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initalSize = 240;
  double containerHeight = 500;
  double containerinitialHeight = 500;
  double imageOpacity = 1;
  @override
  void initState() {
    //setState(() {
    imageSize = initalSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initalSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitialHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initalSize;
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //setState(() {
    //  imageSize = initalSize;
    //});
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: containerHeight,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: const Color(0xFF10C116),
          //child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: imageOpacity.clamp(0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        //opacidade de fundo da imagem
                        color: Colors.black.withOpacity(.5),
                        offset: const Offset(0, 20),
                        blurRadius: 32,
                        spreadRadius: 16,
                      )
                    ],
                  ),
                  //child: Center(
                  child: Image(
                    image: const AssetImage("assets/images/mestre.jpg"),
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            //const SizedBox(
            //height: 100,
          ),
        ),

        SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  //clipBehavior: Clip.none,
                  width: MediaQuery.of(context).size.width,
                  //height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        // Colors.black.withOpacity(0),
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        SizedBox(height: initalSize + 32),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Descrição do Hinario",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        //logo
                                        "assets/images/musinorte.jpg"),
                                    width: 32,
                                    height: 32,
                                  ),
                                  SizedBox(height: 8),
                                  Text("Misinorte")
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "1,999,999 likes 5h  3m",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 16),
                              const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.favorite),
                                      SizedBox(width: 16),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 1000,
                ),
              ],
            ),
          ),
        ),
        //App bar
        Positioned(
            child: Container(
                color: const Color(0xFF064D10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //child: SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_left),
                        ),
                        Text(
                          "Mestre",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 80 -
                              containerHeight.clamp(120.0, double.infinity),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff14d860),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 38,
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.shuffle,
                                  color: Colors.black,
                                  size: 14,
                                  //size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))),
      ],
    ));
  }
}
