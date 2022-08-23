import 'package:flutter/material.dart';
import 'package:stop_frod/resources/color.dart';

class InformationPaywall extends StatelessWidget {
  InformationPaywall({Key? key, required this.label, required this.content}) : super(key: key);

  String label;
  String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/11.7,
              fontWeight: FontWeight.w800,
              color: const Color(0xffffffff)
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/20.8,
              fontWeight: FontWeight.w400,
              color: const Color(0xffffffff)
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class PremiumBlocked extends StatelessWidget {
  PremiumBlocked({Key? key,
    required this.title,
    required this.content,
    required this.border,
    required this.index,
    required this.onTap,}) : super(key: key);

  String title;
  String content;
  int border;
  int index;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60.0,
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: ColorResources.containerColor,
          border: border == index ? Border.all(
            color: ColorResources.numberTextColor,
            width: 2.0
          ) : null,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Color(0xffffffff)
              ),
            ),
            Text(content,
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0x80ffffff)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

