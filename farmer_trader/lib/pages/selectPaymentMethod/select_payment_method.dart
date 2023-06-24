import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:commodity_man/constants/key.dart';
import 'package:commodity_man/theme/theme.dart';
import 'package:commodity_man/widget/column_builder.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  State<SelectPaymentMethodScreen> createState() =>
      _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen>
    with TickerProviderStateMixin {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  static const CameraPosition currentPosition = CameraPosition(
    target: LatLng(22.572645, 88.363892),
    zoom: 12.00,
  );

  LatLng endLocation = const LatLng(22.610658, 88.400720);
  LatLng startLocation = const LatLng(22.555501, 88.347469);
  List<Marker> allMarkers = [];
  Map<PolylineId, Polyline> polylines = {};

  final paymentList = [
    {
      "image": "assets/payment/visa.png",
      "title": "**** **** **56 7896",
      "subtitle": "Expires 04/25",
      "isSubtitle": true,
    },
    {
      "image": "assets/payment/mastercard.png",
      "title": "**** **** **56 7896",
      "subtitle": "Expires 04/25",
      "isSubtitle": true,
    },
    {
      "image": "assets/payment/cash.png",
      "title": "Cash",
      "isSubtitle": false,
    },
    {
      "image": "assets/payment/wallet.png",
      "title": "Wallet",
      "isSubtitle": false,
    }
  ];

  int selectedpayment = 3;

  @override
  void initState() {
    getDirections();
    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleMapApiKey,
        PointLatLng(startLocation.latitude, startLocation.longitude),
        PointLatLng(endLocation.latitude, endLocation.longitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: 'Kolkata')]);

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: primaryColor,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            googlmap(),
            customInfoWindow(size),
            header(context),
            paymentBottomsheet(size),
          ],
        ),
      ),
    );
  }

  customInfoWindow(Size size) {
    return CustomInfoWindow(
      controller: _customInfoWindowController,
      width: size.width * 0.7,
      height: 40,
      offset: 50,
    );
  }

  googlmap() {
    return GoogleMap(
      onTap: (position) {
        _customInfoWindowController.hideInfoWindow!();
      },
      onCameraMove: (position) {
        _customInfoWindowController.onCameraMove!();
      },
      zoomControlsEnabled: false,
      mapType: MapType.terrain,
      initialCameraPosition: currentPosition,
      onMapCreated: mapCreated,
      markers: Set.from(allMarkers),
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  paymentBottomsheet(Size size) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        curve: Curves.easeIn,
        delay: const Duration(milliseconds: 350),
        child: DraggableScrollableSheet(
          initialChildSize: 0.45,
          minChildSize: 0.45,
          maxChildSize: 0.8,
          snap: true,
          builder: (context, ScrollController scrollController) {
            return Container(
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
              child: Column(
                children: [
                  heightSpace,
                  heightSpace,
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
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        pickupAndDropAddress(),
                        heightSpace,
                        heightSpace,
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: fixPadding * 2.0),
                          child: Text(
                            "Payment Method ",
                            style: bold18Black,
                          ),
                        ),
                        paymentMethodList(),
                      ],
                    ),
                  ),
                  bookRideButton(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  pickupAndDropAddress() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.radio_button_checked,
                color: secondaryColor,
                size: 20,
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Text(
                  "9 Bailey Drive, Fredericton, NB E3B 5A3",
                  style: semibold15black,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: fixPadding),
                child: DottedBorder(
                  padding: EdgeInsets.zero,
                  strokeWidth: 1.2,
                  dashPattern: const [1, 3],
                  color: blackColor,
                  strokeCap: StrokeCap.round,
                  child: Container(
                    height: 40,
                  ),
                ),
              ),
              widthSpace,
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  height: 1,
                  color: lightGreyColor,
                ),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.location_on,
                color: primaryColor,
                size: 20,
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Text(
                  "1655 Island Pkwy, Kamloops, BC V2B 6Y9",
                  style: semibold15black,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bookRideButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/searchForDriver');
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(fixPadding * 1.3),
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: buttonShadow,
        ),
        child: const Text(
          "Book Ride",
          style: bold18White,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  paymentMethodList() {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedpayment = index;
            });
          },
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(fixPadding),
            margin: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0, vertical: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: lightGreyColor),
            ),
            child: Row(
              children: [
                Image.asset(
                  paymentList[index]['image'].toString(),
                  height: 40,
                  width: 40,
                ),
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        paymentList[index]['title'].toString(),
                        style: semibold16black,
                      ),
                      paymentList[index]['isSubtitle'] == true
                          ? Text(
                              paymentList[index]['subtitle'].toString(),
                              style: semibold12Grey,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: selectedpayment == index
                      ? secondaryColor
                      : lightGreyColor,
                )
              ],
            ),
          ),
        );
      },
      itemCount: paymentList.length,
    );
  }

  header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: fixPadding,
        right: fixPadding,
        top: (Platform.isIOS) ? fixPadding * 6.0 : fixPadding * 4.0,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: blackColor,
            ),
          ),
          const Expanded(
            child: Text(
              "Payment",
              style: extrabold20Black,
            ),
          )
        ],
      ),
    );
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

  mapCreated(GoogleMapController controller) async {
    mapController = controller;
    _customInfoWindowController.googleMapController = controller;
    await marker();
    setState(() {});
  }

  marker() async {
    allMarkers.add(
      Marker(
        markerId: const MarkerId("drop location"),
        position: endLocation,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              width: double.maxFinite,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ]),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "10km",
                      style: bold10White,
                    ),
                  ),
                  widthSpace,
                  const Expanded(
                    child: Text(
                      "1655 Island Pkwy, Kamloops, BC V2B 6Y9",
                      style: semibold14black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            endLocation,
          );
        },
        icon: BitmapDescriptor.fromBytes(
          await getBytesFromAsset("assets/bookNow/dropLocation.png", 130),
        ),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: const MarkerId("your location"),
        position: startLocation,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              width: double.maxFinite,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ]),
              alignment: Alignment.center,
              child: const Text(
                "9 Bailey Drive, Fredericton, NB E3B 5A3",
                style: semibold14black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            startLocation,
          );
        },
        icon: BitmapDescriptor.fromBytes(
          await getBytesFromAsset("assets/bookNow/currentLocation.png", 60),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }
}
