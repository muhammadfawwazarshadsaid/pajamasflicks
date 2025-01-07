import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/constant/iconSize.dart';

class ElevatedButtonCustom {
  static Widget _buildButton({
    required Color backgroundColor,
    required Color textColor,
    required ButtonStyle buttonStyle,
    required String textButton,
    required String iconPosition,
    required String iconFile,
    required VoidCallback? onPressed,
  }) {
    bool iconLeft = iconPosition == "left";
    bool iconRight = iconPosition == "right";

    return Center(
      child: IntrinsicHeight(
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconLeft) ...[
                  IconImage.customSize(iconFile, 24, 24),
                  const SizedBox(width: 16),
                ],
                Text(
                  textButton,
                  style: TextStyleCustom.s4(textColor),
                ),
                if (iconRight) ...[
                  const SizedBox(width: 16),
                  IconImage.customSize(iconFile, 24, 24),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget primaryButtonFillContainer(String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return _buildButton(
      backgroundColor: ColorPallete.primaryButton,
      textColor: ColorPallete.neutralWhite,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: ColorPallete.primaryButton,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      textButton: textButton,
      iconPosition: icon,
      iconFile: iconFile,
      onPressed: onPressed,
    );
  }

  static Widget primaryButtonHug(String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return Center(
      child: IntrinsicWidth(
        child: _buildButton(
          backgroundColor: ColorPallete.primaryButton,
          textColor: ColorPallete.neutralWhite,
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: ColorPallete.primaryButton,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
          textButton: textButton,
          iconPosition: icon,
          iconFile: iconFile,
          onPressed: onPressed,
        ),
      ),
    );
  }

  static Widget secondaryButtonFillContainer(String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return _buildButton(
      backgroundColor: ColorPallete.secondaryButton,
      textColor: ColorPallete.neutralWhite,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: ColorPallete.secondaryButton,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      textButton: textButton,
      iconPosition: icon,
      iconFile: iconFile,
      onPressed: onPressed,
    );
  }

  static Widget secondaryButtonHug(String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return Center(
      child: IntrinsicWidth(
        child: _buildButton(
          backgroundColor: ColorPallete.secondaryButton,
          textColor: ColorPallete.neutralWhite,
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: ColorPallete.secondaryButton,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
          textButton: textButton,
          iconPosition: icon,
          iconFile: iconFile,
          onPressed: onPressed,
        ),
      ),
    );
  }

  static Widget primaryButtonFillContainerOutline(
      String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return _buildButton(
      backgroundColor: Colors.transparent,
      textColor: ColorPallete.primaryButton,
      buttonStyle: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2, color: ColorPallete.primaryButton),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      textButton: textButton,
      iconPosition: icon,
      iconFile: iconFile,
      onPressed: onPressed,
    );
  }

  static Widget primaryButtonHugOutline(String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return Center(
      child: IntrinsicWidth(
        child: _buildButton(
          backgroundColor: Colors.transparent,
          textColor: ColorPallete.primaryButton,
          buttonStyle: OutlinedButton.styleFrom(
            side: const BorderSide(width: 2, color: ColorPallete.primaryButton),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
          textButton: textButton,
          iconPosition: icon,
          iconFile: iconFile,
          onPressed: onPressed,
        ),
      ),
    );
  }

  static Widget secondaryButtonFillContainerOutline(
      String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return _buildButton(
      backgroundColor: Colors.transparent,
      textColor: ColorPallete.secondaryButton,
      buttonStyle: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2, color: ColorPallete.secondaryButton),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      textButton: textButton,
      iconPosition: icon,
      iconFile: iconFile,
      onPressed: onPressed,
    );
  }

  static Widget secondaryButtonHugOutline(String iconFile, String textButton,
      {String icon = "", VoidCallback? onPressed}) {
    return Center(
      child: IntrinsicWidth(
        child: _buildButton(
          backgroundColor: Colors.transparent,
          textColor: ColorPallete.secondaryButton,
          buttonStyle: OutlinedButton.styleFrom(
            side:
                const BorderSide(width: 2, color: ColorPallete.secondaryButton),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
          textButton: textButton,
          iconPosition: icon,
          iconFile: iconFile,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
