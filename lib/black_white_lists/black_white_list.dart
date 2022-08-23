import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_frod/onboarding/onboarding_widgets.dart';
import 'package:stop_frod/resources/color.dart';
import 'package:stop_frod/resources/text.dart';
import 'package:stop_frod/theme.dart';

class BlackWhiteList extends StatefulWidget {
  BlackWhiteList({Key? key, required this.list}) : super(key: key);

  List list;

  @override
  State<BlackWhiteList> createState() => _BlackWhiteListState();
}

class _BlackWhiteListState extends State<BlackWhiteList> {

  final TextEditingController _controller = TextEditingController();

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
                      TextResources.titleBlackList,
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
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                    mainAxisAlignment: widget.list.isEmpty ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.list.isEmpty ?
                      const Text(
                        TextResources.listEmpty,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ) : LimitedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.list.length,
                            itemBuilder: (context, index){
                              return Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  decoration: const BoxDecoration(
                                    color: ColorResources.containerColor,
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0, left: 23.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          widget.list[index],
                                          style: const TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44.0,
                                          width: 44.0,
                                          decoration: BoxDecoration(
                                            color: ColorResources.onboardingColor.withOpacity(1.0),
                                            borderRadius: const BorderRadius.all(Radius.circular(8.0))
                                          ),
                                          child: IconButton(
                                              onPressed: () async{
                                            await showCupertinoDialog(context: context,
                                                builder: (BuildContext context) => Theme(
                                              data: ThemeData.dark(),
                                              child: CupertinoAlertDialog(
                                                title: const Text(TextResources.deleteLink),
                                                content: const Text(TextResources.deleteLinkContent),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: const Text(
                                                      TextResources.cancel,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff007aff)
                                                      ),
                                                    ),
                                                    onPressed: (){
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: const Text(
                                                      TextResources.delete,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(0xff007aff)
                                                      ),
                                                    ),
                                                    onPressed: (){
                                                      widget.list.removeAt(index);
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ));
                                            setState(() {});
                                          }, icon: const Icon(
                                            Icons.clear,
                                            color: Color(0xffffffff),
                                            size: 28.0,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                      ),
                      Container(
                        width: 215.0,
                        margin: widget.list.isNotEmpty ? const EdgeInsets.only(top: 32.0) : null,
                        child: Text(
                          TextResources.addText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Button(
                onPressed: () async{
                  await showCupertinoDialog(context: context,
                      builder: (BuildContext context) => Theme(
                        data: ThemeData.dark(),
                        child: CupertinoAlertDialog(
                          title: const Text(TextResources.addLink),
                          content: Column(
                            children: [
                              const Text(TextResources.addLinkContent),
                              const SizedBox(
                                height: 16.0,
                              ),
                              CupertinoTextField(
                                controller: _controller,
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                                placeholder: TextResources.pasteURL,
                                placeholderStyle: const TextStyle(
                                    color: Color(0x998b8b8b),
                                  fontWeight: FontWeight.w400
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffffffff)
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text(
                                TextResources.cancel,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff007aff)
                                ),
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                                if(_controller.text.isNotEmpty){
                                  _controller.clear();
                                }
                              },
                            ),
                            CupertinoDialogAction(
                              child: const Text(
                                TextResources.add,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff007aff)
                                ),
                              ),
                              onPressed: (){
                                if(_controller.text.isNotEmpty) {
                                  widget.list.add(_controller.text);
                                  _controller.clear();
                                      Navigator.pop(context);
                                    } else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(TextResources.pasteURL)));
                                }
                                  },
                            )
                          ],
                        ),
                      ));
                  setState(() {});
                },
                height: MediaQuery.of(context).size.height/16.24,
                child: Text(
                  TextResources.addLink,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
