import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/common_widgets/button.dart';
import 'package:pajamasflicks/src/common_widgets/chips.dart';
import 'package:pajamasflicks/src/common_widgets/dropdown.dart';
import 'package:pajamasflicks/src/common_widgets/inputfield.dart';
import 'package:pajamasflicks/src/common_widgets/notelp.dart';
import 'package:pajamasflicks/src/constant/color.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  List<String> listChip = ["a", "b"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundDarker,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 100),
          ElevatedButtonCustom.primaryButtonFillContainer(
              "assets/iconImage/CaretRightWhite.png", "",
              icon: "left"),
          const SizedBox(height: 12),
          ElevatedButtonCustom.primaryButtonHug(
              "iconImage/CaretRightWhite.png", "",
              icon: ""),
          const SizedBox(height: 12),
          ElevatedButtonCustom.secondaryButtonFillContainer(
              "assets/iconImage/CaretRightWhite.png", "",
              icon: ""),
          const SizedBox(height: 12),
          ElevatedButtonCustom.secondaryButtonHug(
              "assets/iconImage/CaretRightWhite.png", "",
              icon: "right"),
          const SizedBox(height: 12),
          const SizedBox(height: 12),
          ElevatedButtonCustom.primaryButtonFillContainerOutline(
              "assets/iconImage/CaretRightPurple.png", "",
              icon: "left"),
          const SizedBox(height: 12),
          ElevatedButtonCustom.primaryButtonHugOutline(
              "assets/iconImage/CaretRightPurple.png", "",
              icon: ""),
          const SizedBox(height: 12),
          ElevatedButtonCustom.secondaryButtonFillContainerOutline(
              "assets/iconImage/CaretRightOrange.png", "",
              icon: ""),
          const SizedBox(height: 12),
          ElevatedButtonCustom.secondaryButtonHugOutline(
              "assets/iconImage/CaretRightOrange.png", "",
              icon: "right"),
          const SizedBox(height: 12),
          const NotelpInputField(
            listItem: ["abc", "bcd"],
            hintText: "Masukkan Nomor Telepon",
            labelName: "Label",
            labelIcon: Icons.abc,
          ),
          const SizedBox(height: 12),
          const DefaultInputField(
              isPassword: true,
              hintText: "Masukkan Nomor Telepon",
              labelName: "Label",
              labelIcon: Icons.lock),
          const SizedBox(height: 12),
          const DefaultInputField(
              isPassword: false,
              hintText: "Masukkan Nomor Telepon",
              labelName: "Label",
              labelIcon: Icons.person),
          const SizedBox(height: 12),
          const DropdownCustom(
              labelIcon: Icons.abc,
              labelName: "Label",
              listItem: ["abc", "bcd"]),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ChipsCustom.pinkChip("j"),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: listChip.map((teks) {
              return ChipsCustom.neutral(teks);
            }).toList(),
          ),
          const SizedBox(height: 120),
        ]),
      ),
    );
  }
}
