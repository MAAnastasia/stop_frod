import 'package:flutter/material.dart';
import 'package:stop_frod/function.dart';
import 'package:stop_frod/my_icon_icons.dart';
import 'package:stop_frod/onboarding/onboarding_widgets.dart';
import 'package:stop_frod/paywall/paywall_widget.dart';
import 'package:stop_frod/resources/text.dart';
import 'package:stop_frod/theme.dart';

class PaywallPage extends StatefulWidget {
  const PaywallPage({Key? key}) : super(key: key);

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  final PageController _controller = PageController();

  int _pageIndex = 0;
  int primary = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.allBackgroundColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2.1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/image4.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment(0, -0.7),
                colorFilter: ColorFilter.mode(Color(0xB3181818), BlendMode.srcOver)
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/16.24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          },
                              icon: const Icon(MyIcon.cancel,
                                size: 28.0,
                                color: Color(0x80ffffff),))
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        children: [
                          InformationPaywall(label: TextResources.pageLabel1, content: TextResources.pageContent1),
                          InformationPaywall(label: TextResources.pageLabel2, content: TextResources.pageContent2),
                          InformationPaywall(label: TextResources.pageLabel3, content: TextResources.pageContent3),
                          InformationPaywall(label: TextResources.pageLabel4, content: TextResources.pageContent4),
                        ],
                        onPageChanged: (index){
                          _pageIndex = index;
                          setState(() {});
                        },
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(4, _pageIndex)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/20.3,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PremiumBlocked(title: TextResources.premiumStartFree,
                      content: TextResources.premiumWeek, border: primary,
                    onTap: () {
                    setState(() {
                      primary = 1;
                    });
                    }, index: 1,),
                  PremiumBlocked(title: TextResources.premiumStartFree,
                      content: TextResources.premiumMonth, border: primary,
                    onTap: () {
                      setState(() {
                        primary = 2;
                      });
                    }, index: 2,),
                  PremiumBlocked(title: TextResources.premiumStartFree,
                      content: TextResources.premiumYears, border: primary,
                    onTap: () {
                      setState(() {
                        primary = 3;
                      });
                    }, index: 3,),
                  const SizedBox(height: 24.0),
                  Button(
                      onPressed: (){
                        DioFunction().dioSubs();
                        Navigator.pop(context);
                      }, height: 67.0,
                      child: const Text(
                        TextResources.premiumStartFree,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0
                        ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
