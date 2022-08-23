import 'package:flutter/material.dart';
import 'package:stop_frod/my_icon_icons.dart';
import 'package:stop_frod/resources/color.dart';

class ModelLists extends StatelessWidget {
  ModelLists({Key? key, required this.textList, required this.onTap, required this.length}) : super(key: key);

  String textList;
  void Function() onTap;
  int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
          color: ColorResources.containerColor,
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).textScaleFactor * 12))),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 23.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.height / 12.1,
                  height: MediaQuery.of(context).size.height / 12.1,
                  decoration: BoxDecoration(
                      color: const Color(0xff181818),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).textScaleFactor * 12)),
                  child: Center(
                    child: Text(
                      length.toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 11.7,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.36,
                        color: ColorResources.numberTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'links',
                  style: TextStyle(
                      color: Color(0x80ffffff),
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width / 20.8,
                      letterSpacing: 0.36),
                )
              ],
            ),
            Text(
              textList,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 13.4,
                  letterSpacing: 0.36,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xffffffff)),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height/14.5,
                decoration: BoxDecoration(
                    color: const Color(0xff181818),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).textScaleFactor * 16)),
                child: const Icon(MyIcon.arrow_right, color: Color(0xd9ffffff),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
