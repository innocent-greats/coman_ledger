import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:commodity_man/pages/drawer.dart';
import 'package:commodity_man/theme/theme.dart';
import 'package:commodity_man/widget/column_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? backpressTime;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final placeList = [
    {
      "name": "Bailey Drive, Fredericton",
      "address": "9 Bailey Drive, Fredericton, NB E3B 5A3"
    },
    {
      "name": "Belleville St, Victoria",
      "address": "225 Belleville St, Victoria, BC V8V 1X1"
    },
  ];

  GoogleMapController? mapController;

  static const CameraPosition currentPosition = CameraPosition(
    target: LatLng(37.9826161, -122.0323782),
    zoom: 14.00,
  );

  List<Marker> allMarkers = [];

  List cabMarkers = [
    {
      "image": "assets/home/cab1.png",
      "latLng": const LatLng(37.9826161, -122.0323782),
      "id": "cab1",
      "size": 100
    },
    {
      "image": "assets/home/cab2.png",
      "latLng": const LatLng(37.9901, -122.0390),
      "id": "cab2",
      "size": 70
    },
    {
      "image": "assets/home/cab3.png",
      "latLng": const LatLng(37.9836, -122.0451),
      "id": "cab3",
      "size": 95
    },
    {
      "image": "assets/home/cab4.png",
      "latLng": const LatLng(37.9870, -122.0209),
      "id": "cab4",
      "size": 80
    },
    {
      "image": "assets/home/cab5.png",
      "latLng": const LatLng(37.9971, -122.0329),
      "id": "cab5",
      "size": 100
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        key: scaffoldKey,
        drawer: DrawerWidget(),
        body: Stack(
          children: [
            googleMap(),
            currentLoationBox(),
            whereToGoBottomSheet(size),
          ],
        ),
        // floatingActionButton: currentLocationButton(),
        // bottomSheet: whereToGoBottomSheet(size),
      ),
    );
  }

  currentLocationButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: fixPadding, right: fixPadding),
        child: FloatingActionButton(
          backgroundColor: whiteColor,
          mini: true,
          onPressed: _goCurrentPosition,
          child: const Icon(
            Icons.my_location,
            color: blackColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  googleMap() {
    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.terrain,
      initialCameraPosition: currentPosition,
      onMapCreated: mapCreated,
      markers: Set.from(allMarkers),
    );
  }

  mapCreated(GoogleMapController controller) async {
    mapController = controller;
    await marker();
    setState(() {});
  }

  marker() async {
    allMarkers.add(
      Marker(
        markerId: const MarkerId("your location"),
        position: const LatLng(37.9894, -122.0242),
        icon: BitmapDescriptor.fromBytes(
          await getBytesFromAsset("assets/home/pickup_Location.png", 130),
        ),
      ),
    );
    for (int i = 0; i < cabMarkers.length; i++) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(cabMarkers[i]['id'].toString()),
          position: cabMarkers[i]['latLng'] as LatLng,
          icon: BitmapDescriptor.fromBytes(
            await getBytesFromAsset(
                cabMarkers[i]['image'], cabMarkers[i]['size']),
          ),
        ),
      );
    }
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  _goCurrentPosition() async {
    final GoogleMapController controller = mapController!;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
  }

  currentLoationBox() {
    return Container(
      margin: EdgeInsets.only(
          top: (Platform.isIOS) ? fixPadding * 6.0 : fixPadding * 4.0,
          left: fixPadding * 2.0,
          right: fixPadding * 2.0),
      padding: const EdgeInsets.symmetric(
        vertical: fixPadding * 1.5,
        horizontal: fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(
              Icons.notes,
              color: blackColor,
            ),
          ),
          widthSpace,
          widthSpace,
          const Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: primaryColor,
                  size: 20,
                ),
                width5Space,
                Expanded(
                  child: Text(
                    "Current Location",
                    style: semibold15black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  whereToGoBottomSheet(size) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          curve: Curves.easeIn,
          delay: const Duration(milliseconds: 350),
          child: BottomSheet(
            enableDrag: false,
            constraints: BoxConstraints(maxHeight: size.height * 0.6),
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            onClosing: () {},
            builder: (context) {
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  currentLocationButton(),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.25),
                          blurRadius: 15,
                          offset: const Offset(10, 0),
                        )
                      ],
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 2.0, vertical: fixPadding),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Center(
                          child: Container(
                            width: 60,
                            height: 5,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        heightSpace,
                        heightSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/dropOffLocation');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: fixPadding),
                            width: double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: greyF0Color,
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  CupertinoIcons.search,
                                  color: primaryColor,
                                  size: 22,
                                ),
                                widthSpace,
                                width5Space,
                                Expanded(
                                  child: Text(
                                    "Where to go?",
                                    style: semibold15black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        heightSpace,
                        ColumnBuilder(
                          itemCount: placeList.length,
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
                                      Icons.star_border_rounded,
                                      color: greyShade3,
                                      size: 18,
                                    ),
                                  ),
                                  minLeadingWidth: 0,
                                  title: Text(
                                    placeList[index]['name'].toString(),
                                    style: semibold16black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    placeList[index]['address'].toString(),
                                    style: regular15Grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                placeList.length == index + 1
                                    ? const SizedBox()
                                    : Container(
                                        height: 1,
                                        width: double.maxFinite,
                                        color: lightGreyColor,
                                      )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  userInformation(Size size) {
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

  closeButton(Size size) {
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

  drawerItems() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(fixPadding * 1.5),
        physics: const BouncingScrollPhysics(),
        children: [
          drawerItemWidget(Icons.home_rounded, "Home", () {
            Navigator.pop(context);
          }),
          divider(),
          drawerItemWidget(Icons.drive_eta, "My Rides", () {
            Navigator.pushNamed(context, '/myride')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(Icons.account_balance_wallet_rounded, "Wallet", () {
            Navigator.pushNamed(context, '/wallet')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(Icons.notifications_sharp, "Notification", () {
            Navigator.pushNamed(context, '/notification')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(CupertinoIcons.gift_fill, "Invite Friends", () {
            Navigator.pushNamed(context, '/invitefriends')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(CupertinoIcons.question_circle_fill, "FAQs", () {
            Navigator.pushNamed(context, '/faqs')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(Icons.email, "Contact us", () {
            Navigator.pushNamed(context, '/contactUs')
                .then((value) => Navigator.pop(context));
          }),
          divider(),
          drawerItemWidget(
            Icons.logout,
            "Logout",
            () {
              logoutDialog();
            },
          ),
        ],
      ),
    );
  }

  logoutDialog() {
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
          behavior: SnackBarBehavior.fixed,
          duration: Duration(milliseconds: 1500),
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 10, 10, 19);
    path.conicTo(width, height / 2, 5, height - 18, 1.0);
    path.conicTo(0, height - 12, 0, height, 1.4);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
