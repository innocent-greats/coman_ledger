import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:commodity_man/theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedPageIndex = 0;

  DateTime? backpressTime;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pageModelList = [
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/onboarding/undraw_my_location3.png",
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              heightBox(size.height * 0.09),
              const Text(
                "Select Location",
                style: bold18Black,
                textAlign: TextAlign.center,
              ),
              heightSpace,
              heightSpace,
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit Nunc, purus quis mi nulla vehicula",
                style: regular14Grey,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/onboarding/undraw_my_location2.png",
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              heightBox(size.height * 0.09),
              const Text(
                "Choose Your Ride",
                style: bold18Black,
                textAlign: TextAlign.center,
              ),
              heightSpace,
              heightSpace,
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit Nunc, purus quis mi nulla vehicula",
                style: regular14Grey,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/onboarding/undraw_city_driver1.png",
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              heightBox(size.height * 0.09),
              const Text(
                "Enjoy Your Ride",
                style: bold18Black,
                textAlign: TextAlign.center,
              ),
              heightSpace,
              heightSpace,
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit Nunc, purus quis mi nulla vehicula",
                style: regular14Grey,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillpop(context);
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Onboarding(
                  pages: pageModelList,
                  startPageIndex: selectedPageIndex,
                  onPageChange: (pageIndex) {
                    setState(() {
                      selectedPageIndex = pageIndex;
                    });
                  },
                  footerBuilder:
                      (context, netDragDistance, pagesLength, setIndex) {
                    return nextAndSkipBuilder(pagesLength, context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  nextAndSkipBuilder(int pagesLength, BuildContext context) {
    return Column(
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pagesLength, (index) {
            return _buildDot(index);
          }),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            selectedPageIndex < pagesLength - 1
                ? TextButton(
                    style: ButtonStyle(
                      alignment: AlignmentDirectional.centerStart,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Skip",
                      style: bold16Primary,
                    ),
                  )
                : TextButton(
                    style: ButtonStyle(
                      alignment: AlignmentDirectional.centerStart,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: null,
                    child: const Text(
                      "",
                      style: bold16Primary,
                    ),
                  ),
            FloatingActionButton(
              backgroundColor: whiteColor,
              onPressed: () {
                if (selectedPageIndex < pagesLength - 1) {
                  setState(() {
                    selectedPageIndex++;
                  });
                } else {
                  Navigator.pushNamed(context, '/login');
                }
              },
              child: const Icon(
                Icons.arrow_forward,
                color: primaryColor,
                size: 28,
              ),
            )
          ],
        ),
      ],
    );
  }

  _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
      height: 10,
      width: selectedPageIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        color: selectedPageIndex == index ? primaryColor : whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
    );
  }

  onWillpop(context) {
    DateTime now = DateTime.now();
    if (backpressTime == null ||
        now.difference(backpressTime!) >= const Duration(seconds: 2)) {
      backpressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: blackColor,
          content: Text(
            "Press back once again to exit",
            style: bold15White,
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1500),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
