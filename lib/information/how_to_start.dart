import 'package:flutter/material.dart';
import 'package:stop_frod/resources/color.dart';
import 'package:stop_frod/resources/text.dart';
import 'package:stop_frod/theme.dart';

class HowToStart extends StatelessWidget {
  const HowToStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.allBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded,
                    size: MediaQuery.of(context).size.width / 13.4,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8.0,),
                  Text(
                    TextResources.howStartInformation,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 13.4,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 0.36,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 29.0,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 29.0),
              decoration: const BoxDecoration(
                color: ColorResources.containerColor,
                borderRadius: BorderRadius.all(Radius.circular(28.0))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextResources.turnSafari,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/17.04,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff)
                    ),
                  ),
                  const SizedBox(height: 29.0,),
                  Row(
                    children: [
                      Image.asset('assets/image/settings.png',
                        width: 28.0,
                      ),
                      const SizedBox(width: 8.0,),
                      Text.rich(
                          TextSpan(text: 'Open',
                              style: TextStyle(
                                color: ColorResources.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.width/22.05,
                              ),
                              children: [
                                TextSpan(text: ' Settings',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: MediaQuery.of(context).size.width/22.06,
                                  ),
                                )
                              ]
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0,),
                  Row(
                    children: [
                      Image.asset('assets/image/safari.png',
                      width: 28.0
                      ),
                      const SizedBox(width: 8.0,),
                      Text.rich(
                          TextSpan(text: 'Go to',
                              style: TextStyle(
                                color: ColorResources.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.width/22.05,
                              ),
                              children: [
                                TextSpan(text: ' Safari > Extensions',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: MediaQuery.of(context).size.width/22.06,
                                  ),
                                )
                              ]
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0,),
                  Row(
                    children: [
                      Image.asset('assets/image/easy_blocker.png',
                        height: 28.0,
                      ),
                      const SizedBox(width: 8.0,),
                      Expanded(
                        child: Text.rich(
                            TextSpan(text: 'Allow all',
                                style: TextStyle(
                                  color: ColorResources.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: MediaQuery.of(context).size.width/22.05,
                                ),
                                children: [
                                  TextSpan(text: ' EasyBlocker ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: MediaQuery.of(context).size.width/22.06,
                                    ),
                                  ),
                                  TextSpan(text: 'content blockingrules to apply',
                                    style: TextStyle(
                                      color: ColorResources.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: MediaQuery.of(context).size.width/22.06,
                                    ),
                                  ),
                                ]
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
