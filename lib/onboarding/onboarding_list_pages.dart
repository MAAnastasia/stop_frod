import 'package:flutter/material.dart';
import 'package:stop_frod/onboarding/onboarding_widgets.dart';
import 'package:stop_frod/resources/color.dart';
import 'package:stop_frod/resources/text.dart';
import 'package:stop_frod/theme.dart';

class OnboardingListPage extends StatefulWidget {
  const OnboardingListPage({Key? key}) : super(key: key);

  @override
  State<OnboardingListPage> createState() => _OnboardingListPageState();
}

class _OnboardingListPageState extends State<OnboardingListPage> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.allBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorResources.onboardingColor,
        elevation: 0.0,
        leading: _pageIndex > 0
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex -= 1;
                    _controller.jumpToPage(_pageIndex);
                  });
                },
                icon: const Icon(Icons.arrow_back),
              )
            : Container(),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                TextResources.skip,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 28.9,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.5),
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: ColorResources.onboardingColor,
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.maxFinite,
            child: Center(
                child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.61,
              width: MediaQuery.of(context).size.height / 3.61,
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: [
                    Image.asset(
                      'assets/image/image1.png',
                    ),
                    Image.asset(
                      'assets/image/image2.png',
                    ),
                    Image.asset(
                      'assets/image/image3.png',
                    ),
                  ]),
            )),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (_pageIndex == 0)
                ContentInformation(
                    heading: TextResources.heading1,
                    content: TextResources.content1),
              if (_pageIndex == 1)
                ContentInformation(
                    heading: TextResources.heading2,
                    content: TextResources.content2),
              if (_pageIndex == 2)
                ContentInformation(
                    heading: TextResources.heading2,
                    content: TextResources.content2),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicators(3, _pageIndex)),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 23.4,
                  ),
                  child: Button(
                    onPressed: () {
                      if (_pageIndex != 2) {
                        setState(() {
                          _pageIndex += 1;
                          _controller.jumpToPage(_pageIndex);
                        });
                      } else {}
                    },
                    height: MediaQuery.of(context).size.height / 12.7,
                    child: Text(
                      _pageIndex == 2 ? TextResources.start : TextResources.next,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20.8,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ],
          )),
        ],
      ),
    );
  }
}
