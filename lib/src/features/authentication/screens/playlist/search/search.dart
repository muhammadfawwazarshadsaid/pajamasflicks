// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  TextEditingController textEditingController;
  Search({super.key, required this.textEditingController});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 84,
          child: TextField(
            style: TextStyleCustom.p4(ColorPallete.neutralWhite),
            cursorColor: ColorPallete.pinkDecoration,
            cursorWidth: 2,
            cursorHeight: 16,
            controller: widget.textEditingController,
            decoration: InputDecoration(
                hintText: "Cari film...",
                hintStyle: TextStyleCustom.p4(ColorPallete.neutralGrey2),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: ColorPallete.neutralGrey4),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorPallete.pinkDecoration),
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        IconButton(
            onPressed: () {
              print(widget.textEditingController);
            },
            icon: Image.asset(
              "assets/iconImage/SearchWhite.png",
              width: 24,
              height: 24,
            ),
            style: IconButton.styleFrom(
              backgroundColor: ColorPallete.pinkDecoration,
            )),
      ],
    );
  }
}
