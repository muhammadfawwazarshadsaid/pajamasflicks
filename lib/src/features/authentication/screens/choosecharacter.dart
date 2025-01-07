// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pajamasflicks/src/common_widgets/button.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/homepage.dart';

class ChooseCharacter extends StatefulWidget {
  const ChooseCharacter({
    super.key,
  });

  @override
  State<ChooseCharacter> createState() => _ChooseCharacterState();
}

class _ChooseCharacterState extends State<ChooseCharacter> {
  Map<dynamic, dynamic> characterAvail = {
    "chosen": 1,
    1: ["JammyBig", "Ungu"],
    2: ["CummyBig", "Pink"],
    3: ["SammyBig", "Merah"],
    "finalchosen": 0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ColorPallete.backgroundDarker,
          child: Stack(
            children: [
              Positioned(
                  top: 60,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/image/BackgroundView.png",
                    height: 420,
                    fit: BoxFit.fitHeight,
                  )),
              Positioned(
                  top: 280,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/image/Bowl.png",
                    height: 420,
                  )),
              Positioned(
                  top: -260,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/image/Light.png",
                    height: 850,
                  )),
              Positioned(
                  top: 240,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    characterAvail["chosen"] == 1
                        ? "assets/image/${characterAvail[1][0]}.png"
                        : characterAvail["chosen"] == 2
                            ? "assets/image/${characterAvail[2][0]}.png"
                            : characterAvail["chosen"] == 3
                                ? "assets/image/${characterAvail[3][0]}.png"
                                : "assets/iconImage/DefaultBig.png",
                    height: 260,
                  )),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 28, right: 28),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.chevron_left_outlined,
                          color: ColorPallete.neutralWhite,
                          size: 28,
                        ),
                        const Spacer(),
                        Text(
                          "Karakter Kamu",
                          style: TextStyleCustom.h4(ColorPallete.neutralWhite),
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 28,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(12, 255, 255, 255),
                                  Color.fromARGB(0, 88, 49, 186)
                                ],
                                stops: [
                                  0,
                                  1
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(28),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        characterAvail["chosen"] == 1
                                            ? characterAvail["chosen"] = 0
                                            : characterAvail["chosen"] = 1;
                                        characterAvail["finalchosen"] = 0;
                                      });
                                    },
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: ColorPallete
                                                      .backgroundDarker,
                                                  shape: BoxShape.rectangle,
                                                  border: characterAvail[
                                                              "chosen"] ==
                                                          1
                                                      ? Border.all(
                                                          color: ColorPallete
                                                              .neutralGrey3,
                                                          width: 2)
                                                      : Border.all(
                                                          color: ColorPallete
                                                              .neutralGrey5,
                                                          width: 2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                            ),
                                            Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                    color: ColorPallete
                                                        .primaryButton,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12))),
                                              ),
                                            ),
                                            characterAvail["chosen"] == 1
                                                ? Center(
                                                    child: Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration: const BoxDecoration(
                                                          color: Color.fromARGB(
                                                              46,
                                                              255,
                                                              255,
                                                              255),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                    ),
                                                  )
                                                : Container(),
                                            characterAvail["chosen"] == 1
                                                ? const Center(
                                                    child: Icon(
                                                    Icons
                                                        .check_circle_outline_rounded,
                                                    color: ColorPallete
                                                        .neutralWhite,
                                                  ))
                                                : Container(),
                                          ],
                                        )),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        characterAvail["chosen"] == 2
                                            ? characterAvail["chosen"] = 0
                                            : characterAvail["chosen"] = 2;
                                        characterAvail["finalchosen"] = 0;
                                      });
                                    },
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: ColorPallete
                                                      .backgroundDarker,
                                                  shape: BoxShape.rectangle,
                                                  border: characterAvail[
                                                              "chosen"] ==
                                                          2
                                                      ? Border.all(
                                                          color: ColorPallete
                                                              .neutralGrey3,
                                                          width: 2)
                                                      : Border.all(
                                                          color: ColorPallete
                                                              .neutralGrey5,
                                                          width: 2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                            ),
                                            Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                    color: ColorPallete
                                                        .redDecoration,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12))),
                                              ),
                                            ),
                                            characterAvail["chosen"] == 2
                                                ? Center(
                                                    child: Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration: const BoxDecoration(
                                                          color: Color.fromARGB(
                                                              46,
                                                              255,
                                                              255,
                                                              255),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                    ),
                                                  )
                                                : Container(),
                                            characterAvail["chosen"] == 2
                                                ? const Center(
                                                    child: Icon(
                                                    Icons
                                                        .check_circle_outline_rounded,
                                                    color: ColorPallete
                                                        .neutralWhite,
                                                  ))
                                                : Container()
                                          ],
                                        )),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        characterAvail["chosen"] == 3
                                            ? characterAvail["chosen"] = 0
                                            : characterAvail["chosen"] = 3;
                                        characterAvail["finalchosen"] = 0;
                                      });
                                    },
                                    child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: ColorPallete
                                                      .backgroundDarker,
                                                  shape: BoxShape.rectangle,
                                                  border: characterAvail[
                                                              "chosen"] ==
                                                          3
                                                      ? Border.all(
                                                          color: ColorPallete
                                                              .neutralGrey3,
                                                          width: 2)
                                                      : Border.all(
                                                          color: ColorPallete
                                                              .neutralGrey5,
                                                          width: 2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                            ),
                                            Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                    color: ColorPallete
                                                        .pinkDecoration,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12))),
                                              ),
                                            ),
                                            characterAvail["chosen"] == 3
                                                ? Center(
                                                    child: Container(
                                                      width: 16,
                                                      height: 16,
                                                      decoration: const BoxDecoration(
                                                          color: Color.fromARGB(
                                                              46,
                                                              255,
                                                              255,
                                                              255),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                    ),
                                                  )
                                                : Container(),
                                            characterAvail["chosen"] == 3
                                                ? const Center(
                                                    child: Icon(
                                                    Icons
                                                        .check_circle_outline_rounded,
                                                    color: ColorPallete
                                                        .neutralWhite,
                                                  ))
                                                : Container()
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          "Pilih warna avatar",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyleCustom.s6(
                                              ColorPallete.neutralGrey3),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          characterAvail["chosen"] == 1
                                              ? characterAvail[1][1]
                                              : characterAvail["chosen"] == 2
                                                  ? characterAvail[2][1]
                                                  : characterAvail["chosen"] ==
                                                          3
                                                      ? characterAvail[3][1]
                                                      : "Pilih",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyleCustom.h5(
                                              ColorPallete.neutralWhite),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  characterAvail["finalchosen"] == 0 &&
                                          characterAvail["chosen"] == 0
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: Color.fromARGB(
                                                  10, 255, 255, 255)),
                                          child: ElevatedButtonCustom
                                              .primaryButtonHug(
                                            "assets/iconImage/ConfettiWhite.png",
                                            "Terapkan",
                                            icon: "left",
                                          ),
                                        )
                                      : (characterAvail["finalchosen"] != 0 &&
                                              characterAvail["chosen"] != 0)
                                          ? ElevatedButtonCustom
                                              .secondaryButtonHug(
                                              "assets/iconImage/ConfettiWhite.png",
                                              "Diterapkan",
                                              onPressed: () {
                                                setState(() {
                                                  characterAvail[
                                                      "finalchosen"] = 0;
                                                  characterAvail["chosen"] = 0;
                                                  print(characterAvail[
                                                      "finalchosen"]);
                                                });
                                              },
                                              icon: "left",
                                            )
                                          : ElevatedButtonCustom
                                              .primaryButtonHug(
                                              "assets/iconImage/ConfettiWhite.png",
                                              "Terapkan",
                                              onPressed: () {
                                                setState(() {
                                                  characterAvail[
                                                          "finalchosen"] =
                                                      characterAvail["chosen"];
                                                  print(characterAvail[
                                                      "finalchosen"]);
                                                });
                                              },
                                              icon: "left",
                                            )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
