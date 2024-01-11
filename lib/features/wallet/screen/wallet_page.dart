import 'package:e_wallet/common/common_color.dart';
import 'package:e_wallet/common/common_textstyle.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor().backgorund1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/icons/Arrow - Left 2.png",
                    scale: 0.8,
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Image.asset(
                    "assets/images/icons/More_Vertical.png",
                    scale: 0.8,
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
