import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';

class DefaultInputField extends StatefulWidget {
  final String hintText;
  final String labelName;
  final IconData labelIcon;
  final bool isPassword;

  const DefaultInputField({
    Key? key,
    required this.hintText,
    required this.labelName,
    required this.labelIcon,
    required this.isPassword,
  }) : super(key: key);

  @override
  _DefaultInputFieldState createState() => _DefaultInputFieldState();
}

class _DefaultInputFieldState extends State<DefaultInputField> {
  String? valueChoose; // Menggunakan String? untuk menangani nilai null
  bool _obscureText = true; // Untuk mengontrol visibilitas kata sandi

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8, left: 20),
          child: Row(
            children: [
              Icon(
                widget.labelIcon,
                color: ColorPallete.pinkDecoration,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.labelName,
                style: TextStyleCustom.p4(ColorPallete.neutralWhite),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorPallete.neutralGrey4,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    height: 56,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          ColorPallete.neutralGrey5,
                          ColorPallete.backgroundDarker,
                          ColorPallete.neutralGrey5,
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextField(
                      obscureText: widget.isPassword ? _obscureText : false,
                      style: const TextStyle(
                        color: ColorPallete.neutralWhite,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle:
                            TextStyleCustom.s4(ColorPallete.neutralGrey4),
                        fillColor: ColorPallete.neutralWhite,
                        focusColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          gapPadding: 12,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPallete.pinkDecoration,
                            width: 2,
                          ),
                        ),
                        suffixIcon: widget.isPassword
                            ? IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _obscureText
                                      ? ColorPallete.neutralGrey1
                                      : ColorPallete.neutralGrey3,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
