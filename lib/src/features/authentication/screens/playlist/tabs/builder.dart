// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';

class TabBuilder extends StatefulWidget {
  List<Map<String, dynamic>> playlistPage;
  int onSelectedTab;
  final ValueChanged<int> onTabChanged;

  TabBuilder({
    super.key,
    required this.playlistPage,
    required this.onSelectedTab,
    required this.onTabChanged,
  });
  @override
  State<TabBuilder> createState() => _TabBuilderState();
}

class _TabBuilderState extends State<TabBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.playlistPage.length - 1,
          itemBuilder: (context, index) {
            final filmcategory = widget.playlistPage[index + 1];
            return Column(
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (widget.onSelectedTab == index)
                            ? ColorPallete.neutralGrey5
                            : Colors.transparent,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: ColorPallete.neutralGrey2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(99))),
                      ),
                      onPressed: () {
                        widget.onTabChanged(index);
                      },
                      child: Text(
                        filmcategory.isNotEmpty ? filmcategory["kategori"] : '',
                        style: TextStyleCustom.p4(ColorPallete.neutralWhite),
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
