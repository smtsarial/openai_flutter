import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    //create a 3 subscription plans with different prices and durations
    //create a button to subscribe to the plan
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.system_security_update),
          Text('Unlock Butler AI PRO'),
          Row(
            children: [
              Icon(Icons.done),
              Text('1 Month'),
            ],
          )
        ],
      ),
    );
  }
}
