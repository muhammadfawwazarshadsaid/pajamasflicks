// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/common_widgets/button.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/features/authentication/screens/lobbyMap.dart';

class JoinLink extends StatelessWidget {
  const JoinLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundDarker,
      appBar: AppBar(
        backgroundColor: ColorPallete.backgroundDarker,
        centerTitle: false,
        iconTheme: const IconThemeData(color: ColorPallete.neutralWhite),
        title: Image.asset(
          "assets/image/logo.png",
          width: 160,
        ),
        actions: const [],
      ),
      body: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/image/jl.png",
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: Column(
                    children: [
                      Text(
                        "Masukkan Tautan",
                        style: TextStyleCustom.h2(ColorPallete.neutralWhite),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Anda akan bergabung sebagai tamu.",
                        style: TextStyleCustom.p4(ColorPallete.neutralGrey2),
                      ),
                    ],
                  ),
                ),
                Text(
                  "pajama.link/",
                  style: TextStyleCustom.s3(ColorPallete.neutralGrey1),
                ),
                const SizedBox(
                  height: 12,
                ),
                Stack(
                  children: [
                    TextField(
                      cursorHeight: 20,
                      maxLines: 1,
                      style: TextStyleCustom.s4(ColorPallete.neutralWhite),
                      decoration: InputDecoration(
                          hintText: "Masukkan 4 kode tautan",
                          hintStyle:
                              TextStyleCustom.p4(ColorPallete.neutralGrey4),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  color: ColorPallete.neutralGrey5, width: 2)),
                          fillColor: ColorPallete.neutralWhite,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorPallete.neutralGrey1, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButtonCustom.secondaryButtonHug(
                            "", "Gabung", onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LobbyMap()));
                        }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
