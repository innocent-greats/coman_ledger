import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:commodity_man/controllers/main_controller.dart';
import 'package:commodity_man/pages/myWarehouse/my_warehouse.dart';
import 'package:umoja_client/umoja_client.dart';

abstract class CommodityController extends MainController {
  var loading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await _callAPiServer();
    debugPrint("Main Controller onInit been called");
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("Main Controller onReady been called");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("Main Controller onClose been called");
  }

  _callAPiServer() async {
    try {
      final result = await client.example.hello('Geza is Live');
      resultMessage = result;
      debugPrint("Server Responded:  $result");

      update();
    } on Exception catch (e) {
      errorMessage = '$e';
      debugPrint("Server Responded:  $e");
      update();
    }
  }

  Future<void> onCreateNewCommodity(
    String phone,
    String username,
    String firstName,
    String lastName,
    String location,
    String password,
  ) async {
    debugPrint("onRegister method called");
    var commodity = Commodity(
        assetType: 'assetType',
        accountId: 'accountId',
        category: 'category',
        name: 'name',
        species: 'species',
        marketPrice: 0.0,
        weight: 0.0,
        trackerId: 'trackerId',
        location: 'location',
        imageUrl: 'imageUrl',
        ownershipDeedUrl: 'ownershipDeedUrl',
        medicalCertificateUrl: 'medicalCertificateUrl',
        publicDescription: 'publicDescription',
        tradingStatus: 'tradingStatus',
        orderTradingStep: 0,
        orderTrackerHash: 'orderTrackerHash',
        ownerOrg: 'ownerOrg');
    debugPrint("onRegister person  $commodity");
    debugPrint("onRegister Form is valid");
    loading(true);
    update();
    try {
      // delete(person, person);
      var res = await client.commodity.createCommodity(commodity);
      if (res) {
        debugPrint("createPerson res is: $res");
        Get.to(const MyWarehouseScreen());
      }
    } on Exception catch (e) {
      debugPrint('server had an error');
      debugPrint(e.toString());
    }
    // Get.to(SignUpScreen());
    loading(false);
    update();
  }
}
