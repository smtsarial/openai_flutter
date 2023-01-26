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
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 38, 56, 1),
          border: Border.all(color: Colors.grey[800]!),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: widget.onTap as void Function()?,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon.icon, color: Colors.white),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
