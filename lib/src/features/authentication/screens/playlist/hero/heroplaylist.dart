// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/common_widgets/button.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';

class _HeroplaylistState extends State<Heroplaylist> {
  @override
  Widget build(BuildContext context) {
    final page = widget.page;

    // Ensure non-null values and provide default values
    final imageUrl = page["image"] as String? ?? "DummyHome.png";
    final waktutontonan = page["waktutontonan"] as int? ?? 0;
    final totaldurasi =
        page["totaldurasi"] as int? ?? 1; // Avoid division by zero
    final judul = page["judul"] as String? ?? "";

    return Stack(
      children: [
        Image.asset("assets/image/$imageUrl"),
        Positioned(
          bottom: 108,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${waktutontonan}m",
                  style: TextStyleCustom.h1(ColorPallete.neutralWhite),
                ),
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: 8,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(79, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 56) -
                        (waktutontonan.toDouble() /
                            totaldurasi.toDouble() *
                            (MediaQuery.of(context).size.width - 56)),
                    height: 8,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          ColorPallete.secondaryButton,
                          Color(0xff7F1A88)
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ]),
                Text(
                  judul,
                  style: TextStyleCustom.s1(ColorPallete.neutralWhite),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(50, 125, 87, 220),
                      Color.fromARGB(25, 139, 105, 224),
                      Color(0xFF110329)
                    ], stops: [
                      0.00,
                      0.29,
                      1.00
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/iconImage/PenontonHome.png",
                            width: 24,
                            height: 24,
                          ),
                          Image.asset(
                            "assets/iconImage/PenontonHome.png",
                            width: 24,
                            height: 24,
                          ),
                          Image.asset(
                            "assets/iconImage/PenontonHome.png",
                            width: 24,
                            height: 24,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffD7612C),
                                      Color(0xffBC35B0)
                                    ],
                                    stops: [
                                      0,
                                      1
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              "+7",
                              style:
                                  TextStyleCustom.s6(ColorPallete.neutralWhite),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      IntrinsicWidth(
                        child: SizedBox(
                          width: 148,
                          child: Wrap(
                            runSpacing: 0,
                            spacing: 0,
                            children: [
                              Text(
                                "@yoyo, @dino, @rara",
                                style: TextStyleCustom.p6(
                                    ColorPallete.neutralWhite),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                              Text(
                                "dan 7 lainnya",
                                style: TextStyleCustom.p6(
                                    ColorPallete.neutralWhite),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButtonCustom.secondaryButtonHug(
                      "assets/iconImage/TelevisionSimpleWhite.png",
                      "Balik ke Room",
                      icon: "left",
                      onPressed: () {})
                ],
              ),
            ))
      ],
    );
  }
}

// ignore: must_be_immutable
class Heroplaylist extends StatefulWidget {
  final Map<String, dynamic> page;
  const Heroplaylist({super.key, required this.page});

  @override
  State<Heroplaylist> createState() => _HeroplaylistState();
}
