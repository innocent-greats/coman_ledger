import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:commodity_man/theme/theme.dart';
import 'package:commodity_man/widget/column_builder.dart';

class DropOffLocation extends StatefulWidget {
  const DropOffLocation({super.key});

  @override
  State<DropOffLocation> createState() => _DropOffLocationState();
}

class _DropOffLocationState extends State<DropOffLocation> {
  final recent = [
    {
      "name": "Whiteshell Avenue, Winnipeg",
      "address": "38 Whiteshell Avenue, Winnipeg, MB R2C 2X5"
    },
    {
      "name": "Island Pkwy, Kamloops",
      "address": "1655 Island Pkwy, Kamloops, BC V2B 6Y9"
    },
    {
      "name": "Richmond Street, Charlottetown",
      "address": "145 Richmond Street, Charlottetown, PE C1A 1J1"
    },
    {
      "name": "McKercher Drive, Saskatoon",
      "address": "1535 McKercher Drive, Saskatoon, SK S7H 5L3"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: false,
        foregroundColor: blackColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding),
        children: [
          whereToGoField(),
          heightSpace,
          heightSpace,
          goToHome(),
          goForWork(),
          heightSpace,
          recentTitle(),
          recentList(),
        ],
      ),
    );
  }

  recentList() {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/bookNow');
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyF0Color,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.history,
                  color: greyShade3,
                  size: 18,
                ),
              ),
              minLeadingWidth: 0,
              title: Text(
                recent[index]['name'].toString(),
                style: semibold16black,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                recent[index]['address'].toString(),
                style: regular15Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            recent.length == index + 1
                ? const SizedBox()
                : Container(
                    height: 1,
                    width: double.maxFinite,
                    color: lightGreyColor,
                  )
          ],
        );
      },
      itemCount: recent.length,
    );
  }

  recentTitle() {
    return const Text(
      "Recent",
      style: bold18Black,
    );
  }

  goForWork() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bookNow');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: fixPadding),
        child: Row(
          children: [
            Icon(
              Icons.work,
              color: primaryColor,
              size: 20,
            ),
            widthSpace,
            widthSpace,
            Expanded(
              child: Text(
                "Work",
                style: semibold16black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  goToHome() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bookNow');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: fixPadding),
        child: Row(
          children: [
            Icon(
              Icons.home_rounded,
              color: primaryColor,
              size: 21,
            ),
            widthSpace,
            widthSpace,
            Expanded(
                child: Text(
              "Home",
              style: semibold16black,
            ))
          ],
        ),
      ),
    );
  }

  whereToGoField() {
    return Container(
      width: double.maxFinite,
      height: 110,
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding, horizontal: fixPadding * 1.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 6,
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: fixPadding * 1.2),
            child: Column(
              children: [
                const Icon(
                  Icons.radio_button_checked,
                  color: secondaryColor,
                  size: 20,
                ),
                Expanded(
                  child: DottedBorder(
                    padding: EdgeInsets.zero,
                    strokeWidth: 1.2,
                    dashPattern: const [2, 3],
                    color: blackColor,
                    strokeCap: StrokeCap.round,
                    child: Container(),
                  ),
                ),
                const Icon(
                  Icons.location_on,
                  color: primaryColor,
                  size: 20,
                )
              ],
            ),
          ),
          widthSpace,
          width5Space,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Current Location",
                      style: semibold15black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 1,
                  color: lightGreyColor,
                ),
                const Expanded(
                  child: TextField(
                    cursorColor: primaryColor,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Where to go?",
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
