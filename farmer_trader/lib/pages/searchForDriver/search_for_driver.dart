import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:commodity_man/constants/key.dart';
import 'package:commodity_man/theme/theme.dart';

class SearchForDriverScreen extends StatefulWidget {
  const SearchForDriverScreen({super.key});

  @override
  State<SearchForDriverScreen> createState() => _SearchForDriverScreenState();
}

class _SearchForDriverScreenState extends State<SearchForDriverScreen> {
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
      body: Stack(
        children: [
          googlmap(),
          customInfoWindow(size),
          header(context),
          searchingDriverBottomsheet(size),
        ],
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

  searchingDriverBottomsheet(size) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          curve: Curves.easeIn,
          delay: const Duration(milliseconds: 350),
          child: BottomSheet(
            backgroundColor: Colors.transparent,
            enableDrag: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            onClosing: () {},
            builder: (context) {
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
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
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
                    height5Space,
                    Image.asset(
                      "assets/searchForDriver/undraw_searching.png",
                      height: size.height * 0.15,
                    ),
                    heightSpace,
                    height5Space,
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: fixPadding * 4.0),
                      child: Text(
                        "Hold on!! We are searching for nearby driver for you",
                        style: regular16Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    heightSpace,
                    height5Space,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: const LinearProgressIndicator(
                          value: 0.7,
                          minHeight: 7,
                          color: secondaryColor,
                          backgroundColor: lightGreyColor,
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(fixPadding * 1.3),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: buttonShadow,
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Cancel Ride",
                                style: bold18White,
                              ),
                            ),
                          ),
                        ),
                        widthBox(3.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/driverDetail');
                            },
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(fixPadding * 1.3),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: buttonShadow,
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Continue",
                                style: bold18White,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
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
