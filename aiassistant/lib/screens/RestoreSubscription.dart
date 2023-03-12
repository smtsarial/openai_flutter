import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RestorePurchases extends StatefulWidget {
  const RestorePurchases({super.key});

  @override
  State<RestorePurchases> createState() => _RestorePurchasesState();
}

class _RestorePurchasesState extends State<RestorePurchases> {
  late CustomerInfo customerInfo;

  @override
  void initState() {
    initilazeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Subscription'),
          elevation: 0,
        ),
        body: SingleChildScrollView());
  }

  Future initilazeApp() async {
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      print('data1' + customerInfo.entitlements.all.toString());
      return customerInfo;
    } on PlatformException catch (e) {
      // Error restoring purchases
      return e;
    }
  }
}
