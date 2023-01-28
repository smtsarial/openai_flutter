import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';
//import for AppStoreProductDetails
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
//import for SKProductWrapper
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool _showLoading = false;
  bool _available = true;
  List<ProductDetails> _products = [];

  List<PurchaseDetails> _purchases = [];
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  @override
  void initState() {
    _initialize();

    super.initState();
  }

  void _initialize() async {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;

    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      print('purchaseDetailsList: ');
      setState(() {
        _purchases.addAll(purchaseDetailsList);
        _listenToPurchaseUpdated(purchaseDetailsList);
      });
    }, onDone: () {
      _subscription!.cancel();
    }, onError: (error) {
      _subscription!.cancel();
    });

    _available = await _inAppPurchase.isAvailable();

    List<ProductDetails> products = await _getProducts(
      productIds: Set<String>.from(
        ['weekly', 'monthly', 'yearly'],
      ),
    );

    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    //create a 3 subscription plans with different prices and durations
    //create a button to subscribe to the plan
    return Scaffold(
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Subscription'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.system_security_update,
                color: Colors.white,
                size: 75,
              ),
              SizedBox(height: 20),
              Text(
                'Unlock Butler AI PRO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.done, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    'Unlimited Usage',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.done, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    'Most Advanced AI Model',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.done, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    'Cancel Anytime',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        return _buildProduct(
                          product: _products[index],
                        );
                      },
                    ),
            ],
          ),
        ));
  }

  Container _buildProduct({required ProductDetails product}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: InkWell(
        onTap: () {
          _subscribe(product: product);
        },
        child: ListTile(
          title: Text(
            product.title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            '${product.price}',
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

  Future<List<ProductDetails>> _getProducts(
      {required Set<String> productIds}) async {
    ProductDetailsResponse response =
        await _inAppPurchase.queryProductDetails(productIds);

    return response.productDetails;
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
          //  _showPendingUI();
          break;
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          // bool valid = await _verifyPurchase(purchaseDetails);
          // if (!valid) {
          //   _handleInvalidPurchase(purchaseDetails);
          // }
          break;
        case PurchaseStatus.error:
          print(purchaseDetails.error!);
          // _handleError(purchaseDetails.error!);
          break;
        default:
          break;
      }

      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
        print(purchaseDetails.pendingCompletePurchase);
        setState(() {
          _showLoading = false;
        });
      }
    });
  }

  void _subscribe({required ProductDetails product}) {
    setState(() {
      _showLoading = true;
    });
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _inAppPurchase.buyNonConsumable(
      purchaseParam: purchaseParam,
    );
  }

  @override
  void dispose() {
    _subscription!.cancel();
    super.dispose();
  }
}
