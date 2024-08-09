import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Stack(
        children: [
          Image.asset(
            "assets/icons/searchBanner.jpeg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
              right: 35,
              top: 68,
              child: SizedBox(
                width: 250,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.blue.shade500, width: 2)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "جستجو کنید",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Color(0xFF7F7F7F)),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    prefixIcon: Image.asset(
                      "assets/icons/searc1.png",
                      width: 5,
                      height: 10,
                    ),
                    suffixIcon: Image.asset(
                      "assets/icons/cam.png",
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              )),
          Positioned(
              right: 311,
              top: 73,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    width: 31,
                    height: 31,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icons/bell.png"))),
                  ),
                ),
              )),
          Positioned(
              right: 354,
              top: 73,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    width: 31,
                    height: 31,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icons/message.png"))),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
