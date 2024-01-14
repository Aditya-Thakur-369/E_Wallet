// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_wallet/common/common_color.dart';
import 'package:e_wallet/common/common_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.image,
    required this.name,
    required this.date,
    required this.ammount,
  }) : super(key: key);
  final String image;
  final String name;
  final String date;
  final String ammount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(60),
        child: CupertinoContextMenu(
          enableHapticFeedback: true,
          actions: const [
            CupertinoContextMenuAction(child: Text("Ok")),
            CupertinoContextMenuAction(child: Text("")),
            CupertinoContextMenuAction(child: Text("Ok")),
            CupertinoContextMenuAction(child: Text("Ok")),
          ],
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                color: CommonColor().backgorund1,
                border: Border.all(color: const Color(0xFF19173D)),
                // borderRadius: BorderRadius.circular(60),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(image),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        name,
                        style: CommonTextStyle().style1,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        date,
                        style: CommonTextStyle().style2,
                      ),
                      const Spacer()
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 44,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: CommonColor().bluebg),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade50,
                              spreadRadius: 0.1,
                              blurRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(60),
                        color: CommonColor().backgorund1),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          ammount,
                          style: CommonTextStyle().style1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
