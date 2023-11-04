//import 'package:crf_music_app/shared/views/home.dart';
//import 'package:crf_music_app/shared/views/library.dart';
//import 'package:crf_music_app/shared/views/profile.dart';
//import 'package:crf_music_app/shared/views/search.dart';
import 'package:flutter/material.dart';
import 'package:musinorte_app/shared/views/home.dart';
import 'package:musinorte_app/shared/views/library.dart';
import 'package:musinorte_app/shared/views/profile.dart';
import 'package:musinorte_app/shared/views/search.dart';
//import 'package:msd_player/views/home.dart';
//import 'package:msd_player/views/library.dart';
//import 'package:msd_player/views/profile.dart';
//import 'package:msd_player/views/search.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => TabbarState();
}

class TabbarState extends State<Tabbar> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Your Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: Stack(
        children: [
          renderView(
            0,
            const HomeView(),
          ),
          renderView(
            1,
            const SearchView(),
          ),
          renderView(
            2,
            const LibraryView(),
          ),
          renderView(
            3,
            const ProfileView(),
          ),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: selectedTab != tabIndex,
      child: Opacity(
        opacity: selectedTab == tabIndex ? 1 : 0,
        child: const HomeView(),
      ),
    );
  }
}
