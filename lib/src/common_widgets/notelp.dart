import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/constant/iconSize.dart';

class NotelpInputField extends StatefulWidget {
  final String hintText;
  final String labelName;
  final IconData labelIcon;
  final List<String> listItem;

  const NotelpInputField(
      {Key? key,
      required this.hintText,
      required this.labelName,
      required this.labelIcon,
      required this.listItem})
      : super(key: key);

  @override
  _NotelpInputFieldState createState() => _NotelpInputFieldState();
}

class _NotelpInputFieldState extends State<NotelpInputField> {
  String? valueChoose; // Menggunakan String? untuk menangani nilai null

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, bottom: 8),
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
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              ColorPallete.neutralGrey5,
              ColorPallete.backgroundDarker,
              ColorPallete.neutralGrey5,
            ]),
            border: Border.all(
              width: 1,
              color: ColorPallete.neutralGrey4,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              IntrinsicWidth(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(117, 95, 84, 139),
                      Color.fromARGB(255, 45, 37, 77),
                    ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIconColor: ColorPallete.neutralGrey1,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          gapPadding: 0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                      ),
                      icon: IconImage.customSize(
                          "assets/iconImage/CaretDownWhite.png", 16, 16),
                      dropdownColor: ColorPallete.neutralGrey4,
                      hint: Text("+62",
                          style: TextStyleCustom.s4(
                            ColorPallete.neutralWhite,
                          )),
                      items: widget.listItem.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style:
                                TextStyleCustom.s4(ColorPallete.neutralWhite),
                          ),
                        );
                      }).toList(),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.only(right: 8, left: 4),
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: TextField(
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
                            ))),
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
