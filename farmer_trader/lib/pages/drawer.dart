import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commodity_man/pages/home/home.dart';
import 'package:commodity_man/theme/theme.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(20.0),
            ),
          ),
          width: size.width * 0.75,
          backgroundColor: whiteColor,
          child: Column(
            children: [
              userInformation(size, context),
              drawerItems(context),
            ],
          ),
        ),
        closeButton(size, scaffoldKey),
      ],
    );
  }

  userInformation(Size size, context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 5.0, horizontal: fixPadding * 1.5),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: size.height * 0.09,
            width: size.height * 0.09,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: size.height * 0.085,
                    width: size.height * 0.085,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/home/User.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/editProfile')
                          .then((value) => Navigator.pop(context));
                    },
                    child: Container(
                      height: size.height * 0.038,
                      width: size.height * 0.038,
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.border_color,
                        size: 15,
                        color: primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          widthSpace,
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Samantha Smith",
                  style: bold16White,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "samanthasmith@gmail.com",
                  style: regular14White,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  drawerItems(context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(fixPadding * 1.5),
        physics: const BouncingScrollPhysics(),
        children: [
          drawerItemWidget(Icons.home_rounded, "Home", () {
            Navigator.pop(context);
          }),
          divider(),
          // drawerItemWidget(Icons.drive_eta, "My Rides", () {
          //   Navigator.pushNamed(context, '/myride')
          //       .then((value) => Navigator.pop(context));
          // }),
          // divider(),
          drawerItemWidget(Icons.account_balance_wallet_rounded, "Wallet", () {
            Navigator.pushNamed(context, '/wallet')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(Icons.notifications_sharp, "Notification", () {
            Navigator.pushNamed(context, '/notification')
                .then((value) => Navigator.pop(context));
          }),
          // divider(),
          // drawerItemWidget(CupertinoIcons.gift_fill, "Invite Friends", () {
          //   Navigator.pushNamed(context, '/invitefriends')
          //       .then((value) => Navigator.pop(context));
          // }),
          divider(),
          drawerItemWidget(CupertinoIcons.question_circle_fill, "FAQs", () {
            Navigator.pushNamed(context, '/faqs')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(Icons.email, "Contact Umoja Support", () {
            Navigator.pushNamed(context, '/contactUs')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(
            Icons.logout,
            "Logout",
            () {
              logoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  closeButton(Size size, scaffoldKey) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
          clipper: CustomMenuClipper(),
          child: Container(
            width: size.width * 0.22,
            height: 130,
            decoration: const BoxDecoration(
              color: whiteColor,
            ),
            padding: const EdgeInsets.only(left: fixPadding / 3),
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                }
              },
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.5),
                      blurRadius: 6,
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  divider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: fixPadding / 4),
      width: double.maxFinite,
      color: lightGreyColor,
    );
  }

  drawerItemWidget(IconData icon, String title, Function() onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: primaryColor.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 6))
          ],
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: whiteColor,
          size: 16,
        ),
      ),
      minLeadingWidth: 0,
      title: Text(
        title,
        style: bold17Black,
      ),
    );
  }

  logoutDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          insetPadding: const EdgeInsets.all(fixPadding * 2.0),
          contentPadding: const EdgeInsets.all(fixPadding * 2.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Icon(
                    CupertinoIcons.question_circle_fill,
                    color: primaryColor,
                  ),
                  widthSpace,
                  Expanded(
                    child: Text(
                      "Do You Want to Logout...?",
                      style: semibold16black,
                    ),
                  )
                ],
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: fixPadding, horizontal: fixPadding * 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: greyShade3),
                        color: whiteColor,
                      ),
                      child: const Text(
                        "Cancel",
                        style: bold16Grey,
                      ),
                    ),
                  ),
                  widthSpace,
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: fixPadding, horizontal: fixPadding * 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: buttonShadow,
                        color: primaryColor,
                      ),
                      child: const Text(
                        "Logout",
                        style: bold16White,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
