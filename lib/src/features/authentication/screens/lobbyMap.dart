import 'package:flutter/material.dart';
import 'package:pajamasflicks/src/common_widgets/button.dart';
import 'package:pajamasflicks/src/constant/color.dart';
import 'package:pajamasflicks/src/constant/font.dart';
import 'package:pajamasflicks/src/constant/iconSize.dart';
import 'package:pajamasflicks/src/features/authentication/screens/playlist/homepage.dart';
import 'package:pajamasflicks/src/features/authentication/screens/onboarding.dart';

class LobbyMap extends StatefulWidget {
  const LobbyMap({super.key});

  @override
  State<LobbyMap> createState() => _LobbyMapState();
}

class _LobbyMapState extends State<LobbyMap> {
  int? selectedSeat; // Kursi yang dipilih oleh pengguna
  int? mySeat; // Kursi pengguna saat ini
  String myName = "Jammy";
  bool isCancelled = false; // Status pembatalan

  // Map untuk menyimpan status kursi dan karakter
  Map<int, Map<String, dynamic>> seats = {
    0: {'occupied': true, 'character': 'JammySit.png', 'user': 'Jammie'},
    1: {'occupied': true, 'character': 'SammySit.png', 'user': 'User 1'},
    2: {'occupied': true, 'character': 'ChummySit.png', 'user': 'User 2'},
    3: {'occupied': false, 'character': '', 'user': ''},
    4: {'occupied': false, 'character': '', 'user': ''},
    5: {'occupied': false, 'character': '', 'user': ''},
    6: {'occupied': false, 'character': '', 'user': ''},
    7: {'occupied': false, 'character': '', 'user': ''},
    8: {'occupied': false, 'character': '', 'user': ''},
    9: {'occupied': false, 'character': '', 'user': ''},
    // Tambahkan lebih banyak kursi sesuai kebutuhan
  };

  String myCharacter = 'JammySit.png'; // Karakter default pengguna

  @override
  void initState() {
    super.initState();
    _initializeSeat();
  }

  void _initializeSeat() {
    // Menetapkan selectedSeat jika nama pengguna ada dalam daftar kursi
    for (int i in seats.keys) {
      if (seats[i]?['user'] == myName) {
        setState(() {
          selectedSeat = i;
          mySeat = i;
        });
        break; // Keluar dari loop jika ditemukan
      }
    }
  }

  void _handleSeatTap(int i) {
    setState(() {
      if (selectedSeat == i) {
        // Batalkan pilihan kursi jika pengguna memilih kursi yang sedang ditempati
        if (mySeat == i && !isCancelled) {
          // Ubah status kursi menjadi kosong jika kursi yang diklik adalah kursi pengguna
          seats[i]!['occupied'] = false;
          seats[i]!['user'] = ''; // Kosongkan pengguna
          seats[i]!['character'] = ''; // Kosongkan karakter
          mySeat = null; // Reset kursi pengguna
          isCancelled = true; // Tandai sebagai dibatalkan
        }
        selectedSeat = null; // Reset kursi yang dipilih
      } else if (!(seats[i]?['occupied'] ?? false)) {
        // Pilih kursi jika kursi kosong
        if (mySeat != null) {
          // Set kursi yang lama menjadi kosong jika pengguna sudah duduk di kursi lain
          seats[mySeat]!['occupied'] = false;
          seats[mySeat]!['user'] = '';
          seats[mySeat]!['character'] = '';
        }
        selectedSeat = i;
        mySeat = i;
        seats[i]!['occupied'] = true;
        seats[i]!['user'] = myName; // Tandai kursi dengan nama pengguna
        seats[i]!['character'] =
            myCharacter; // Tandai kursi dengan karakter pengguna
        isCancelled = false; // Reset status pembatalan
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/lm.png",
          ),
          for (int i in seats.keys)
            Positioned(
              top: MediaQuery.of(context).size.height * seatPositions[i].top,
              left: MediaQuery.of(context).size.width * seatPositions[i].left,
              child: GestureDetector(
                onTap: () => _handleSeatTap(i),
                child: Image.asset(
                  width: 101,
                  // Mengatur gambar kursi berdasarkan statusnya
                  mySeat == i
                      ? "assets/image/ChairOccupied.png"
                      : (seats[i]?['occupied'] ?? false)
                          ? "assets/image/Chair.png"
                          : "assets/image/Chair.png",
                  color: (seats[i]?['occupied'] ?? false) && mySeat != i
                      ? Colors
                          .grey // Kursi yang sudah ditempati diwarnai abu-abu
                      : null,
                ),
              ),
            ),
          if (selectedSeat == null)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.83,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          myName,
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleCustom.s6(ColorPallete.neutralWhite),
                        ),
                      ),
                      Text(
                        "(you)",
                        style: TextStyleCustom.s6(ColorPallete.neutralWhite),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Fungsi untuk mengganti karakter
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Pilih Karakter"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (String character in [
                                "JammySit.png",
                                "SammySit.png",
                                "ChummySit.png"
                              ])
                                ListTile(
                                  leading: Image.asset(
                                      "assets/image/$character",
                                      scale: 4),
                                  title: Text(character.split('Sit.png')[0]),
                                  onTap: () {
                                    setState(() {
                                      myCharacter = character;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/image/$myCharacter",
                      scale: 4,
                    ),
                  )
                ],
              ),
            ),
          for (int i = 0; i < seats.length; i++)
            if (seats[i]?['occupied'] ?? false)
              if (seats[i]?['user'] != myName)
                Positioned(
                  top: MediaQuery.of(context).size.height *
                      (seatPositions[i].top - 0.02),
                  left: MediaQuery.of(context).size.width *
                      (seatPositions[i].left + 0.05),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          seats[i]?['user'] ?? 'User',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleCustom.s6(ColorPallete.neutralWhite),
                        ),
                      ),
                      Image.asset(
                        "assets/image/${seats[i]?['character'] ?? 'JammySit.png'}",
                        scale: 4,
                      ),
                    ],
                  ),
                ),
          for (int i = 0; i < seats.length; i++)
            if (seats[i]?['occupied'] ?? false)
              if (seats[i]?['user'] == myName)
                Positioned(
                  top: MediaQuery.of(context).size.height *
                      (seatPositions[i].top - 0.02),
                  left: MediaQuery.of(context).size.width *
                      (seatPositions[i].left + 0.025),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 52,
                            child: Text(
                              seats[i]?['user'] ?? 'User',
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleCustom.s6(
                                  const Color.fromARGB(255, 255, 212, 57)),
                            ),
                          ),
                          Text('(you)',
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleCustom.s6(
                                  const Color.fromARGB(255, 255, 212, 57)))
                        ],
                      ),
                      Image.asset(
                        "assets/image/${seats[i]?['character'] ?? 'JammySit.png'}",
                        scale: 4,
                      ),
                    ],
                  ),
                ),
          Positioned(
            top: 60,
            left: 20,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromARGB(20, 255, 255, 255),
              ),
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children: [
                  IconButton(
                    style:
                        IconButton.styleFrom(padding: const EdgeInsets.all(0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    },
                    icon: IconImage.customSize(
                        "assets/iconImage/SignOutRed.png", 28, 28),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Reuni SMA 1 Kebayoran Lama",
                      style: TextStyleCustom.s5(ColorPallete.neutralWhite),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF271654),
                              Color(0xFF5731BA),
                              Color(0xFF5731BA),
                            ],
                            stops: [0.0, 0.67, 0.96],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 107, 64, 216),
                                      Color.fromARGB(255, 180, 177, 173)
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                            child: Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/image/Jammy.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text(
                                  myName,
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleCustom.s6(
                                      ColorPallete.neutralWhite),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          IconImage.customSize(
                              "assets/iconImage/Coin.png", 24, 24),
                          const SizedBox(
                            width: 8,
                          ),
                          IntrinsicWidth(
                            child: Container(
                              width: 32,
                              child: Text(
                                "100",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyleCustom.p5(
                                    ColorPallete.neutralWhite),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          Positioned(
              top: 180,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.68,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(children: [
                            const Row(),
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              width: 180,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/iconImage/FilmSlateWhite.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text("Alice in the Borderline",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyleCustom.s6(
                                            ColorPallete.neutralWhite)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(),
                            SizedBox(
                              width: 180,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/iconImage/ClockWhite.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text("Mulai Pukul 12.00",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyleCustom.s6(
                                            ColorPallete.neutralWhite)),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.only(right: 24),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/iconImage/UsersThreeWhite.png",
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "4/20",
                                  style: TextStyleCustom.h6(
                                      ColorPallete.neutralGrey1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButtonCustom.secondaryButtonHug(
                          "assets/iconImage/TelevisionSimpleWhite.png",
                          "Start Film",
                          icon: "left",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Onboarding()));
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.primaryButton,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Onboarding()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 14),
                              child: Image.asset(
                                "assets/iconImage/GearSixWhite.png",
                                width: 24,
                                height: 24,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class SeatPosition {
  final double top;
  final double left;

  SeatPosition({required this.top, required this.left});
}

List<SeatPosition> seatPositions = [
  SeatPosition(top: 0.4, left: 0.4),
  SeatPosition(top: 0.4, left: 0.65),
  SeatPosition(top: 0.55, left: 0.1),
  SeatPosition(top: 0.55, left: 0.35),
  SeatPosition(top: 0.7, left: 0.0),
  SeatPosition(top: 0.7, left: 0.25),
  SeatPosition(top: 0.7, left: 0.5),
  SeatPosition(top: 0.7, left: 0.75),
  SeatPosition(top: 0.85, left: 0.45),
  SeatPosition(top: 0.85, left: 0.7),
];
