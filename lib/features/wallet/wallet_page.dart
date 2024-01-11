import 'package:e_wallet/common/common_color.dart';
import 'package:e_wallet/common/common_textstyle.dart';
import 'package:e_wallet/features/wallet/screen/account.dart';
import 'package:e_wallet/features/wallet/screen/card_tab.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor().backgorund1,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
            actions: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/icons/Arrow - Left 2.png",
                scale: 0.8,
              ),
              const Spacer(),
              const Text(
                "Wallet",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Spacer(),
              Image.asset(
                "assets/images/icons/More_Vertical.png",
                scale: 0.8,
              ),
              const SizedBox(
                width: 10,
              )
            ],
            backgroundColor: CommonColor().backgorund1,
            // pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 130.0,
            bottom: TabBar(
              indicatorColor: CommonColor().shine,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: CommonTextStyle().style1,
              tabs: [
                Tab(text: 'Cards'),
                const Tab(text: 'Account'),
              ],
              controller: controller,
            )),
        SliverFillRemaining(
          child: TabBarView(
            controller: controller,
            children: <Widget>[CardTab(), AccountTab()],
          ),
        ),
      ]),
    );
  }
}
