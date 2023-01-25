import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingItemWidget extends StatefulWidget {
  const SettingItemWidget(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});
  final Function onTap;
  final Icon icon;
  final String title;

  @override
  State<SettingItemWidget> createState() => _SettingItemWidgetState();
}

class _SettingItemWidgetState extends State<SettingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          onTap: widget.onTap as void Function()?,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon.icon),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ));
  }
}
