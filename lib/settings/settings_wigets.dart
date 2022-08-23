import 'package:flutter/material.dart';
import 'package:stop_frod/resources/color.dart';

class CellSettings extends StatelessWidget {
  CellSettings({Key? key, required this.text, required this.onTap}) : super(key: key);

  String text;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60.0,
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8.0, left: 23.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: const BoxDecoration(
          color: ColorResources.containerColor,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
        child: Row(
          children: [
            Text(text,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Color(0xffffffff),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Color(0xffffffff),),
          ],
        ),
      ),
    );
  }
}
