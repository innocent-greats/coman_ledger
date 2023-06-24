import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:commodity_man/pages/account/account.dart';
import 'package:commodity_man/pages/commodityDetail/commodity_detail.dart';
import 'package:commodity_man/pages/contactUs/contact_us.dart';
import 'package:commodity_man/pages/createNewCommodity/create_new_commodity.dart';
import 'package:commodity_man/pages/faqs/faqs.dart';
import 'package:commodity_man/pages/inviteFriends/invite_friends.dart';
import 'package:commodity_man/pages/myWarehouse/my_warehouse.dart';
import 'package:commodity_man/pages/tradingCertificateDetail/trading_certificate_detail.dart';
import 'package:commodity_man/pages/tradingCertificates/trading_certificates.dart';

import 'package:commodity_man/theme/theme.dart';
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
      title: 'FL CabWind User App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: whiteColor,
        primaryColor: primaryColor,
        fontFamily: 'NunitoSans',
      ),
      home: const AccountScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
              child: const SplashScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case '/account':
            return PageTransition(
              child: const AccountScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/onboarding':
            return PageTransition(
              child: const OnboardingScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case '/login':
            return PageTransition(
              child: const LoginScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/register':
            return PageTransition(
              child: const RegisterScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/verification':
            return PageTransition(
              child: const VerificationScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/home':
            return PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/dropOffLocation':
            return PageTransition(
              child: const DropOffLocation(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/bookNow':
            return PageTransition(
              child: const BookNowScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/selectCab':
            return PageTransition(
              child: const SelectCabScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/paymentMethod':
            return PageTransition(
              child: const SelectPaymentMethodScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/searchForDriver':
            return PageTransition(
              child: const SearchForDriverScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/driverDetail':
            return PageTransition(
              child: const DriverDetailScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/chatWithDriver':
            return PageTransition(
              child: const ChatWithDriver(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/rideStart':
            return PageTransition(
              child: const RideStartScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/rideEnd':
            return PageTransition(
              child: const RideEndScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/rating':
            return PageTransition(
              child: const RatingScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/editProfile':
            return PageTransition(
              child: const EditProfile(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/myride':
            return PageTransition(
              child: const MyRidesScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/rideDetail':
            return PageTransition(
              child: const RideDetailScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/myWarehouse':
            return PageTransition(
              child: const MyWarehouseScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/commodityDetail':
            return PageTransition(
              child: const CommodityDetailScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );

          case '/createNewCommodity':
            return PageTransition(
              child: CreateNewCommodity(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/tradingCertificates':
            return PageTransition(
              child: const TradingCertificatesScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/tradingCertificateDetail':
            return PageTransition(
              child: const TradingCertificateDetailScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/wallet':
            return PageTransition(
              child: const WalletScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/payments':
            return PageTransition(
              child: const PaymentMethodsScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/newpaymentMethod':
            return PageTransition(
              child: const NewPaymentMethod(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/notification':
            return PageTransition(
              child: const NotificationScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/invitefriends':
            return PageTransition(
              child: const InviteFriendsScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/faqs':
            return PageTransition(
              child: const FAQsScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/contactUs':
            return PageTransition(
              child: const ContactUsScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          default:
            return null;
        }
      },
      localizationsDelegates: const [
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}
