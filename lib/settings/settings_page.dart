import 'package:flutter/material.dart';
import 'package:stop_frod/my_icon_icons.dart';
import 'package:stop_frod/onboarding/onboarding_widgets.dart';
import 'package:stop_frod/resources/text.dart';
import 'package:stop_frod/settings/settings_wigets.dart';
import 'package:stop_frod/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                    TextResources.settingsText,
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
            const SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  CellSettings(text:TextResources.privacyPolicy, onTap: (){},),
                  CellSettings(text:TextResources.termsUse, onTap: (){},),
                  CellSettings(text:TextResources.purchase, onTap: (){},),
                  CellSettings(text:TextResources.howStartInformation, onTap: (){
                    Navigator.pushNamed(context, '/information/Start');
                  },),
                ],
              ),
            ),
            Button(
              onPressed: () {
                Navigator.pushNamed(context, '/paywall');
              },
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(MyIcon.star, size: 20.0,),
                  SizedBox(width: 4.0,),
                  Text(TextResources.premium,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0
                    ),
                  )
                ],
              ),
              
            )
          ],
        ),
      ),
    );
  }
}
