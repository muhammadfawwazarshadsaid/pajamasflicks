import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/features/authentication/screens/navbar.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/hero/heroplaylist.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/search/search.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/tabs/akanditonton.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/tabs/builder.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/tabs/koleksi.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/tabs/sedangditonton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  final TextEditingController _textEditingController = TextEditingController();
  int _selectedindex = 0;
  void _onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  List<Map<String, dynamic>> playlistPage = [
    {
      "judul": "Doctor Strange",
      "waktutontonan": 52,
      "totaldurasi": 200,
      "image": "DummyHome.png",
      "penonton": ["yoyo", "dino", "rara", "dina", "joko", "azka"]
    },
    {
      "kategori": "Sedang Ditonton",
      "film": [
        {
          "nama": "Dokter Strange",
          "image": "DummyHome.png",
          "host": true,
          "waktutontonan": 52,
          "totaldurasi": 200,
        },
        {
          "nama": "Dokter Strange",
          "image": "DummyHome.png",
          "host": false,
          "waktutontonan": 52,
          "totaldurasi": 200,
        }
      ]
    },
    {
      "kategori": "Akan Ditonton",
      "film": [
        {
          "nama": "pemandi jenazah",
          "image": "DummyHome.png",
          "host": false,
          "waktutayang": "20 2 22"
        },
        {
          "nama": "pemandi jenazah",
          "image": "DummyHome.png",
          "host": true,
          "waktutayang": "20 2 22"
        }
      ]
    },
    {
      "kategori": "Koleksi",
      "playlist": [
        {
          "nama": "Campur Film",
          "film": [
            {
              "nama": "alice in the borderline",
              "image": "DummyHome.png",
              "genre": ["sci-fi", "thriller"],
              "rating": 9.2,
              "durasi": "1j55m"
            },
            {
              "nama": "alice in the borderline",
              "image": "DummyHome.png",
              "genre": ["sci-fi", "thriller"],
              "rating": 9.2,
              "durasi": "1j55m"
            }
          ]
        },
        {
          "nama": "Buat Bingewatch",
          "film": [
            {
              "nama": "alice in the borderline",
              "image": "DummyHome.png",
              "genre": ["sci-fi", "thriller"],
              "rating": 9.2,
              "durasi": "1j55m"
            },
            {
              "nama": "alice in the borderline",
              "image": "DummyHome.png",
              "genre": ["sci-fi", "thriller"],
              "rating": 9.2,
              "durasi": "1j55m"
            }
          ]
        }
      ],
    }
  ];

  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundDarker,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedindex = index;
              });
            },
            children: playlistPage.map((page) {
              return _selectedindex == 0
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Heroplaylist(
                              page: page,
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Search(
                            textEditingController: _textEditingController,
                          ),
                          TabBuilder(
                            playlistPage: playlistPage,
                            onSelectedTab: _selectedTab,
                            onTabChanged: _onSelectedTab,
                          ),
                          _selectedTab == 0
                              ? SedangDitonton(playlistPage: playlistPage)
                              : _selectedTab == 1
                                  ? AkanDitonton(playlistPage: playlistPage)
                                  : Koleksi(
                                      playlistPage: playlistPage,
                                      playlist: playlistPage,
                                    )
                        ],
                      ),
                    )
                  : Container();
            }).toList(),
          ),
          Navbar(pageController: _pageController, selectedindex: _selectedindex)
        ],
      ),
    );
  }
}
