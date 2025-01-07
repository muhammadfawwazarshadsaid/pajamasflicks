// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/homepage.dart';

// ignore: must_be_immutable
class AkanDitonton extends StatefulWidget {
  List<Map<String, dynamic>> playlistPage;
  AkanDitonton({super.key, required this.playlistPage});

  @override
  State<AkanDitonton> createState() => _AkanDitontonState();
}

class _AkanDitontonState extends State<AkanDitonton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Wrap(
                  children: [
                    Image.asset(
                      "assets/iconImage/Confetti.png",
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Coming Soon Party",
                      style: TextStyleCustom.s4(ColorPallete.neutralWhite),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              height: 316,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.playlistPage[2]["film"].length,
                  itemBuilder: (context, index) {
                    String namafilmsedangdiputar =
                        widget.playlistPage[2]["film"][index]["nama"];
                    String waktutontonan =
                        widget.playlistPage[2]["film"][index]["waktutayang"];
                    bool labelHost =
                        widget.playlistPage[2]["film"][index]["host"];
                    String image =
                        widget.playlistPage[2]["film"][index]["image"];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homepage()));
                        },
                        child: SizedBox(
                          width: 120,
                          height: 80,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Image.asset(
                                  "assets/image/$image",
                                  height: 156,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              labelHost == true
                                  ? Image.asset(
                                      "assets/iconImage/HostLabel.png",
                                      height: 60,
                                    )
                                  : Container(),
                              Positioned(
                                top: 96,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 8, sigmaY: 0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                            Color.fromARGB(0, 255, 255, 255),
                                            Color.fromARGB(24, 255, 255, 255)
                                          ],
                                              stops: [
                                            0,
                                            0.9
                                          ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter)),
                                      width: 120,
                                      height: 64,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 56,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  width: 200,
                                  height: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 104,
                                        child: Text(
                                          namafilmsedangdiputar,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyleCustom.s5(
                                              ColorPallete.neutralWhite),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      SizedBox(
                                        width: 104,
                                        child: Text(
                                          "mulai dalam",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyleCustom.p6(
                                              ColorPallete.neutralWhite),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    128, 109, 101, 101),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4))),
                                            child: Text(
                                              waktutontonan.split(' ')[0],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyleCustom.s6(
                                                  ColorPallete.neutralWhite),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    128, 109, 101, 101),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4))),
                                            child: Text(
                                              waktutontonan.split(' ')[1],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyleCustom.s6(
                                                  ColorPallete.neutralWhite),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    128, 109, 101, 101),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4))),
                                            child: Text(
                                              waktutontonan.split(' ')[2],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyleCustom.s6(
                                                  ColorPallete.neutralWhite),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
