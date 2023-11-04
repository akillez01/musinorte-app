//import 'package:crf_music_app/shared/widgets/album_card.dart';
//import 'package:crf_music_app/shared/widgets/song_card.dart';
//import 'package:crf_music_app/shared/views/album_view.dart';
import 'package:flutter/material.dart';
import 'package:musinorte_app/shared/views/album_view.dart';
import 'package:musinorte_app/shared/widgets/album_card.dart';
import 'package:musinorte_app/shared/widgets/song_card.dart';
//import 'package:msd_player/views/album_view.dart';
//import 'package:msd_player/widgets/album_card.dart';
//import 'package:msd_player/widgets/song_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 14, 54, 51)),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 15, 83, 17).withOpacity(0),
                    const Color.fromARGB(255, 10, 74, 12).withOpacity(.8),
                    const Color.fromARGB(255, 11, 81, 13).withOpacity(1),
                    const Color.fromARGB(255, 9, 61, 11).withOpacity(1),
                    const Color.fromARGB(255, 9, 61, 11).withOpacity(1),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tocado Recentemente",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 20),
                              Icon(Icons.settings),
                            ],
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "A Arca de Noé",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_1"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "A Mensagem",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_2"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Balança de São Miguel",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_3"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Caboclo Guerreiro",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_4"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Caminho da Verdade",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_5"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Chico Corrente",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_6"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Daime Sorrindo",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_7"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Hinario Felipe Alcure",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_8"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Mestre Irineu Diversões",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_9"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          AlbumCard(
                            label: "Meu Diario",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_10"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          AlbumCard(
                            label: "Quadro Azul-neily",
                            image:
                                const AssetImage("assets/images/musinorte.jpg"),
                            key: const ValueKey("album_card_11"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Boa Noite",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              RowAlbumCard(
                                label: "A Arca de Noé",
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "A Mensagem",
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RowAlbumCard(
                                label: "São Miguel",
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Caboclo Guerreiro",
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RowAlbumCard(
                                label: "Caminho",
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Chico Corrente",
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Com base na sua audição recente",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte2.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte3.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte5.jpg"),
                              ),
                              SizedBox(width: 16),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Com base na sua audição recente",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte2.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte3.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image:
                                    AssetImage("assets/images/musinorte.jpg"),
                                key: ValueKey("musinorte5.jpg"),
                              ),
                              SizedBox(width: 16),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 38,
              width: 38,
              fit: BoxFit.cover,
              key: const ValueKey("album_card"),
            ),
            const SizedBox(width: 6),
            Text(label)
          ],
        ),
      ),
    );
  }
}
