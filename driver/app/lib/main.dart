import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rc_fl_cabwind_driver/theme/theme.dart';
import 'pages/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FL CabWind Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: whiteColor,
        primaryColor: primaryColor,
        fontFamily: 'NunitoSans',
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
                child: const SplashScreen(),
                type: PageTransitionType.fade,
                settings: settings);
          case '/login':
            return PageTransition(
                child: const LoginScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/register':
            return PageTransition(
                child: const RegisterScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/verification':
            return PageTransition(
                child: const VerificationScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/home':
            return PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/chat':
            return PageTransition(
                child: const ChatWithPassenger(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/gotoPickup':
            return PageTransition(
                child: const GoToPickUpScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/beginRide':
            return PageTransition(
                child: const BeginRidesScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/endRide':
            return PageTransition(
                child: const EndRideScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/editProfile':
            return PageTransition(
                child: const EditProfileScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/myRides':
            return PageTransition(
                child: const MyRideScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/rideDetail':
            return PageTransition(
                child: const RideDetailScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/myrating':
            return PageTransition(
                child: const MyRatingScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/wallet':
            return PageTransition(
                child: const WalletScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/notification':
            return PageTransition(
                child: const NotificationScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/inviteFriends':
            return PageTransition(
                child: const InviteFriendsScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/faqs':
            return PageTransition(
                child: const FAQsScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          case '/contactus':
            return PageTransition(
                child: const ContactUsScreen(),
                type: PageTransitionType.rightToLeft,
                settings: settings);
          default:
            return null;
        }
      },
    );
  }
}
