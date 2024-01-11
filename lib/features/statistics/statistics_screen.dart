import 'package:e_wallet/common/common_color.dart';
import 'package:e_wallet/common/common_textstyle.dart';
import 'package:e_wallet/features/statistics/screen/month_tab.dart';
import 'package:e_wallet/features/statistics/screen/week_tab.dart';
import 'package:e_wallet/features/statistics/screen/year_tab.dart';
import 'package:e_wallet/features/wallet/screen/card_tab.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
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
              SizedBox(
                width: 120,
              ),
              const Text(
                "Statistics",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Spacer(),
              const SizedBox(
                width: 10,
              )
            ],
            backgroundColor: CommonColor().backgorund1,
            snap: true,
            floating: true,
            expandedHeight: 130.0,
            bottom: TabBar(
              unselectedLabelStyle: TextStyle(),
              padding: EdgeInsets.only(left: 10, right: 10),
              dividerHeight: 0,
              indicatorPadding: EdgeInsets.all(10),
              tabAlignment: TabAlignment.fill,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: CommonTextStyle().style1,
              indicatorWeight: 2,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CommonColor().shine),
                gradient: LinearGradient(
                    colors: [CommonColor().backgorund1, CommonColor().shine]),
              ),
              tabs: [
                const Tab(text: 'Week'),
                const Tab(text: 'Month'),
                const Tab(text: 'Year'),
              ],
              controller: controller,
            )),
        SliverFillRemaining(
          child: TabBarView(
            controller: controller,
            children: <Widget>[WeekTab(), MonthTab(), YearTab()],
          ),
        ),
      ]),
    );
  }
}
