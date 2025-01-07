// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pajamasflicks/src/common_widgets/button.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/features/authentication/screens/choosecharacter.dart';
import 'package:pajamasflicks/src/features/authentication/screens/joinLink.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<Map<int, dynamic>> listPage = [
    {
      1: Image.asset("assets/image/ob1.png"),
      2: "Nonton Bareng",
      3: "Cari tontonan menarik dan tonton bareng hingga 10 bestie"
    },
    {
      1: Image.asset("assets/image/ob2.png"),
      2: "Sensasi Lesehan",
      3: "Interaksi secara real-time dengan bestiemu di layar tancap pijama flicks!",
    },
    {
      1: Image.asset("assets/image/ob3.png"),
      2: "Bingewatching",
      3: "Tonton berbagai film dan series tanpa iklan, kapanpun dan dimanapun!"
    },
    {
      1: Image.asset("assets/image/ob4.png"),
      2: "Kumpulkan Koin",
      3: "Kumpulkan koin sebanyak-banyaknya untuk nonton semua film Gratis! "
    },
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundDark,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: _pageController,
              pageSnapping: true,
              children: listPage.map((page) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  color: ColorPallete.backgroundDarker,
                  child: Stack(
                    children: [
                      page[1],
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.63,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: FractionallySizedBox(
                          widthFactor: 2,
                          heightFactor: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: ColorPallete.backgroundDark,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(320))),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const Spacer(),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    listPage[_currentPage][2].toString(),
                    style: TextStyleCustom.h1(ColorPallete.neutralWhite),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    listPage[_currentPage][3].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyleCustom.p3(ColorPallete.neutralGrey1),
                  ),
                ]),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(listPage.length, (index) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? ColorPallete.secondaryButton
                            : ColorPallete.backgroundDark2,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButtonCustom.secondaryButtonFillContainer(
                  "assets/iconImage/ConfettiWhite.png",
                  "Mulai dengan Akun",
                  icon: "left",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCharacter()),
                    );
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButtonCustom.primaryButtonFillContainer(
                  "assets/iconImage/LinkSimpleWhite.png",
                  "Join Langsung Pakai Link",
                  icon: "left",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JoinLink()),
                    );
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
