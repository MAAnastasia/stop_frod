import 'package:flutter/material.dart';

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 9.0,
      height: 9.0,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? Color(0xff2AAD49)
              : Colors.white.withOpacity(0.5),
          shape: BoxShape.circle),
    );
  });
}

class ContentInformation extends StatelessWidget {
  ContentInformation({Key? key, required this.heading, required this.content})
      : super(key: key);

  String heading;
  String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          heading,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 7.9,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12.5,
          ),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 22.1,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.5)),
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  Button({Key? key, required this.child, required this.onPressed, required this.height}) : super(key: key);

  Widget child;
  void Function() onPressed;
  double height;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff2FAA73),
              Color(0xff24B117),
            ],
          ),
          boxShadow: const [
            BoxShadow(
                color: Color(0x5928c12f),
                blurRadius: 32.0,
                offset: Offset(0, 9.0))
          ],
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 23.4),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width / 23.4),
            ),
          ),
          child: child
        ));
  }
}
