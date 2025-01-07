// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/homepage.dart';

// ignore: must_be_immutable
class SedangDitonton extends StatefulWidget {
  List<Map<String, dynamic>> playlistPage;
  SedangDitonton({super.key, required this.playlistPage});

  @override
  State<SedangDitonton> createState() => _SedangDitontonState();
}

class _SedangDitontonState extends State<SedangDitonton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  "Lanjutkan Menonton",
                  style: TextStyleCustom.s4(ColorPallete.neutralWhite),
                )),
            Container(
              margin: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              height: 316,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.playlistPage[1]["film"].length,
                  itemBuilder: (context, index) {
                    String namafilmsedangdiputar =
                        widget.playlistPage[1]["film"][index]["nama"];
                    int waktutontonan =
                        widget.playlistPage[1]["film"][index]["waktutontonan"];
                    int totaldurasi =
                        widget.playlistPage[1]["film"][index]["totaldurasi"];
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
                          width: 200,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Image.asset(
                                  "assets/image/${widget.playlistPage[0]["image"]}",
                                  height: 156,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Positioned(
                                top: 88,
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
                                      width: 200,
                                      height: 68,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  width: 200,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${waktutontonan}m",
                                        style: TextStyleCustom.h5(
                                            ColorPallete.neutralWhite),
                                      ),
                                      Stack(children: [
                                        Container(
                                          width: 200 - 24,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  79, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        Container(
                                          width: (200 - 24) -
                                              (waktutontonan.toDouble() /
                                                  totaldurasi.toDouble() *
                                                  (200 - 24)),
                                          height: 4,
                                          decoration: BoxDecoration(
                                              gradient:
                                                  const LinearGradient(colors: [
                                                ColorPallete.secondaryButton,
                                                Color(0xff7F1A88)
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ]),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          namafilmsedangdiputar,
                                          style: TextStyleCustom.s5(
                                              ColorPallete.neutralWhite),
                                        ),
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
