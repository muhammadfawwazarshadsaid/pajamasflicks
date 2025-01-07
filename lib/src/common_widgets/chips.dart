import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';

class ChipsCustom {
  static Container neutral(String teks) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
          color: ColorPallete.neutralGrey1,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorPallete.neutralGrey5,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          teks,
          style: TextStyleCustom.p5(ColorPallete.neutralWhite),
        ),
      ),
    );
  }

  static Container neutralIcon(String teks) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
          color: ColorPallete.neutralGrey1,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorPallete.neutralGrey5,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: IntrinsicWidth(
          child: Row(
            children: [
              const Icon(
                Icons.abc,
                color: ColorPallete.neutralWhite,
              ),
              const SizedBox(width: 4),
              Text(
                teks,
                style: TextStyleCustom.p5(ColorPallete.neutralWhite),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }

  static Container pink(String teks) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
          color: ColorPallete.pinkDecoration,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 75, 21, 70),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: IntrinsicWidth(
          child: Row(
            children: [
              const SizedBox(width: 4),
              Text(
                teks,
                style: TextStyleCustom.p5(ColorPallete.neutralWhite),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.check_circle_outline_outlined,
                color: Color.fromARGB(255, 255, 159, 247),
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  static ActionChip pinkChip(String teks) {
    return ActionChip(
      onPressed: () {},
      label: Text(
        "teks",
        style: TextStyleCustom.p5(ColorPallete.neutralWhite),
      ),
      backgroundColor: Color.fromARGB(255, 75, 21, 70),
      surfaceTintColor: ColorPallete.pinkDecoration,
      shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      avatar: const Icon(
        Icons.abc,
        color: ColorPallete.neutralWhite,
      ),
    );
  }

  static Container pinkIcon(String teks) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
          color: ColorPallete.pinkDecoration,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 75, 21, 70),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: IntrinsicWidth(
          child: Row(
            children: [
              const Icon(
                Icons.abc,
                color: ColorPallete.neutralWhite,
              ),
              const SizedBox(width: 4),
              Text(
                teks,
                style: TextStyleCustom.p5(ColorPallete.neutralWhite),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.check_circle_outline_outlined,
                color: Color.fromARGB(255, 255, 159, 247),
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
