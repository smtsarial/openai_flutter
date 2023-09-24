import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool _showLoading = false;
  bool _userIsSubscribed = false;
  List<StoreProduct> _products = [];
  bool _showRestoreButton = false;

  @override
  void initState() {
    setState(() {
      _showLoading = true;
    });
    initilizeIAP();
    Purchases.addCustomerInfoUpdateListener((customerInfo) {
      updateCustomerInfo();
    });
    updateCustomerInfo();
    initilazeApp();
    super.initState();
  }

  Future restorePurchase() async {
    try {
      setState(() {
        _showLoading = true;
      });

      await Purchases.restorePurchases().then((value) {
        print(
            'data' + value.entitlements.all['pro_access']!.isActive.toString());
        setState(() {
          _showLoading = false;
        });
      });
    } catch (e) {
      print(e);

      setState(() {
        _showLoading = false;
      });
    }
  }

  Future initilazeApp() async {
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      print('data1' +
          customerInfo.entitlements.all['pro_access']!.productIdentifier
              .toString());
      if (customerInfo.entitlements.all['pro_access']!.isActive) {
        setState(() {
          _showRestoreButton = true;
        });
        return customerInfo;
      } else {
        setState(() {
          _showRestoreButton = false;
        });
      }
      return customerInfo;
    } on PlatformException catch (e) {
      // Error restoring purchases
      setState(() {
        _showRestoreButton = false;
      });
      return e;
    }
  }

  @override
  void dispose() {
    Purchases.removeCustomerInfoUpdateListener((customerInfo) {
      updateCustomerInfo();
    });
    super.dispose();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              _userIsSubscribed
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.doorbell_rounded,
                            color: Colors.green,
                            size: 175,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'You have subscribed to My AI Helper!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ])
                  : Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 150,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Unlock My AI Helper Features',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.done, color: Colors.green),
                                  SizedBox(width: 10),
                                  Text(
                                    'Unlimited Usage',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.done, color: Colors.green),
                                  SizedBox(width: 10),
                                  Text(
                                    'Most Advanced AI Model',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.done, color: Colors.green),
                                  SizedBox(width: 10),
                                  Text(
                                    'Cancel Anytime',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 40),
              _showLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.orange,
                        color: Colors.black,
                        strokeWidth: 8,
                      ),
                    )
                  : Column(
                      children: [
                        true
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: InkWell(
                                      onTap: () async {
                                        await restorePurchase();
                                      },
                                      child: ListTile(
                                        title: Text(
                                          'Restore Purchase',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                          'Restore your previous purchase',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text('OR',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.orange,
                                  color: Colors.black,
                                  strokeWidth: 8,
                                ),
                              ),
                        SizedBox(height: 10),
                        _products.length == 0
                            ? Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.orange,
                                  color: Colors.black,
                                  strokeWidth: 8,
                                ),
                              )
                            : Column(
                                children: _products
                                    .map((e) => _buildProduct(product: e))
                                    .toList(),
                              ),
                      ],
                    ),
            ],
          ),
        ));
  }

  Container _buildProduct({required StoreProduct product}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: InkWell(
        onTap: () async {
          try {
            setState(() {
              _showLoading = true;
            });
            try {
              await Purchases.purchaseProduct(product.identifier);

              setState(() {
                _showLoading = false;
              });
            } catch (e) {
              print(e);

              setState(() {
                _showLoading = false;
              });
            }
          } catch (e) {
            print(e);
          }
        },
        child: ListTile(
          title: Text(
            product.title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            '${product.priceString}',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void initilizeIAP() async {
    try {
      List<StoreProduct> offerings =
          await Purchases.getProducts(['weekly', 'monthly', 'yearly']);
      setState(() {
        _products = offerings;
      });
      //sort _products by price
      _products.sort((a, b) => a.price.compareTo(b.price));
      setState(() {
        _showLoading = false;
      });
    } on PlatformException catch (e) {
      // optional error handling
      print(e);
    }
  }

  void updateCustomerInfo() async {
    setState(() {
      _showLoading = true;
    });
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    setState(() {
      _userIsSubscribed =
          customerInfo.entitlements.all['pro_access']?.isActive ?? false;
    });
    setState(() {
      _showLoading = false;
    });
  }
}
