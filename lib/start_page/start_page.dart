import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stop_frod/global.dart';
import 'package:stop_frod/resources/color.dart';
import 'package:stop_frod/resources/icon.dart';
import 'package:stop_frod/resources/text.dart';
import 'package:stop_frod/start_page/black_white_midel.dart';
import 'package:stop_frod/function.dart';
import 'package:stop_frod/theme.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool tapStartStop = false;

  @override
  void initState() {
    // TODO: implement initState
    DioFunction().dioValidation();
    DioFunction().dioInstall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextResources.title),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/settings');
          }, icon: const Icon(IconResources.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              height: MediaQuery.of(context).size.height / 3.6,
              width: MediaQuery.of(context).size.height / 3.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeApp.allBackgroundColor,
                border: Border.all(
                  color: tapStartStop ? const Color(0xff2AAD49) : ColorResources.shadowColor,
                  width: 6.0,
                ),
                boxShadow: tapStartStop ? [
                  const BoxShadow(
                    color: Color(0xff0DCC14),
                    blurRadius: 34.0,
                  ),
                  const BoxShadow(
                    color: ThemeApp.allBackgroundColor,
                    blurRadius: 34.0,
                    spreadRadius: -2,

                  )
                ] : null,
                gradient: const RadialGradient(
                  colors: ColorResources.gradientColor,
                ),
              ),
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
              child: InkWell(
                onTap: (){
                  tapStartStop = !tapStartStop;
                  if(tapStartStop == true){
                    DioFunction().setAdplexity();
                  }
                  setState(() {});
                },
                child: Center(
                    child: Text(
                  tapStartStop ? TextResources.tapStop : TextResources.tapStart,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.36,
                      fontSize: MediaQuery.of(context).size.width / 17,
                      color: Colors.white),
                )),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/information/Start');
                },
                child: Text(
                  TextResources.howStart,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: MediaQuery.of(context).size.width / 20.8,
                    letterSpacing: 0.36
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ModelLists(textList: 'Blacklist', length: blackList.length,
                    onTap: (){
                  Navigator.of(context).pushNamed('/blacklist').then((value) {
                    setState(() {});
                  });
                }),
                ModelLists(textList: 'Whitelist', length: whiteList.length,
                    onTap: (){
                  Navigator.of(context).pushNamed('/whitelist').then((value) {
                    setState(() {});
                  });
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
