// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';

// ignore: must_be_immutable
class Navbar extends StatefulWidget {
  PageController pageController;
  int selectedindex;
  Navbar({
    super.key,
    required this.pageController,
    required this.selectedindex,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorPallete.primaryButton,
                ColorPallete.primaryButton
              ], stops: [
                0.57,
                1
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: ColorPallete.primaryButton,
                      padding: const EdgeInsets.all(0),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      widget.pageController.jumpToPage(0);
                      widget.selectedindex = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: widget.selectedindex == 0
                            ? const Color.fromARGB(40, 245, 242, 254)
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border(
                            left: widget.selectedindex == 0
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none,
                            top: widget.selectedindex == 0
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none)),
                    child: widget.selectedindex == 0
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/iconImage/QueueWhite.png",
                                width: 28,
                                height: 28,
                              ),
                              Text(
                                "Playlist",
                                style: TextStyleCustom.p5(
                                    ColorPallete.neutralWhite),
                              ),
                            ],
                          )
                        : Image.asset(
                            "assets/iconImage/QueueWhite.png",
                            width: 28,
                            height: 28,
                          ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: ColorPallete.primaryButton,
                      padding: const EdgeInsets.all(0),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      widget.pageController.jumpToPage(1);
                      widget.selectedindex = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: widget.selectedindex == 1
                            ? const Color.fromARGB(40, 245, 242, 254)
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border(
                            left: widget.selectedindex == 1
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none,
                            top: widget.selectedindex == 1
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none)),
                    child: widget.selectedindex == 1
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/iconImage/UsersThreeWhite.png",
                                width: 28,
                                height: 28,
                              ),
                              Text(
                                "Community",
                                style: TextStyleCustom.p5(
                                    ColorPallete.neutralWhite),
                              ),
                            ],
                          )
                        : Image.asset(
                            "assets/iconImage/UsersThreeWhite.png",
                            width: 28,
                            height: 28,
                          ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: ColorPallete.primaryButton,
                      padding: const EdgeInsets.all(0),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      widget.pageController.jumpToPage(2);
                      widget.selectedindex = 2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: widget.selectedindex == 2
                            ? const Color.fromARGB(40, 245, 242, 254)
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border(
                            left: widget.selectedindex == 2
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none,
                            top: widget.selectedindex == 2
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none)),
                    child: widget.selectedindex == 2
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/iconImage/PopcornWhite.png",
                                width: 28,
                                height: 28,
                              ),
                              Text(
                                "Bingewatch",
                                style: TextStyleCustom.p5(
                                    ColorPallete.neutralWhite),
                              ),
                            ],
                          )
                        : Image.asset(
                            "assets/iconImage/PopcornWhite.png",
                            width: 28,
                            height: 28,
                          ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: ColorPallete.primaryButton,
                      padding: const EdgeInsets.all(0),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  onPressed: () {
                    setState(() {
                      widget.pageController.jumpToPage(3);
                      widget.selectedindex = 3;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: widget.selectedindex == 3
                            ? const Color.fromARGB(40, 245, 242, 254)
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border(
                            left: widget.selectedindex == 3
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none,
                            top: widget.selectedindex == 3
                                ? const BorderSide(
                                    color: ColorPallete.neutralWhite,
                                  )
                                : BorderSide.none)),
                    child: widget.selectedindex == 3
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/iconImage/GearSixWhite.png",
                                width: 28,
                                height: 28,
                              ),
                              Text(
                                "Settings",
                                style: TextStyleCustom.p5(
                                    ColorPallete.neutralWhite),
                              ),
                            ],
                          )
                        : Image.asset(
                            "assets/iconImage/GearSixWhite.png",
                            width: 28,
                            height: 28,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
