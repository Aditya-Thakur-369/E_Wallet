import 'package:e_wallet/common/common_color.dart';
import 'package:e_wallet/common/common_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YearTab extends StatefulWidget {
  const YearTab({super.key});

  @override
  State<YearTab> createState() => _YearTabState();
}

class _YearTabState extends State<YearTab> with SingleTickerProviderStateMixin {
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
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Container(
              child: const Column(
                children: [
                  Text(
                    "Total Spendings",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF7B78AA)),
                  ),
                  Text(
                    "\$125,280.00",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.5 + 5,
            decoration: BoxDecoration(
                color: CommonColor().backgorund1.withOpacity(0.9),
                border: Border.all(color: CommonColor().shine.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                      color: CommonColor().shine,
                      blurRadius: 70,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 3)
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                  elevation: 0,
                  titleSpacing: 0,
                  forceMaterialTransparency: true,
                  backgroundColor: CommonColor().backgorund1,
                  bottom: PreferredSize(
                    preferredSize: Size.zero,
                    child: TabBar(
                      indicatorColor: CommonColor().shine,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: CommonTextStyle().style1,
                      tabs: [
                        Tab(text: 'Income'),
                        const Tab(text: 'Outcome'),
                      ],
                      controller: controller,
                    ),
                  )),
              SliverFillRemaining(
                child: TabBarView(
                  controller: controller,
                  children: [Income(), Outcome()],
                ),
              ),
            ]),
          )
        ]));
  }
}

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  int selected = 0;
  List<String> days = ['Mon', 'Tue', 'Wen', 'Thus', "Fri", 'Sat', 'Sun'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 300, top: 10),
              child: Text(
                "Overview",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 50,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/Statistics.png",
              scale: 0.5,
            ),
          ),
          Positioned(
            bottom: 1,
            child: SizedBox(
              height: 30,
              width: 400,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  var data = days[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 350,
                        ),
                        child: Text(
                          data,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              color: index == selected
                                  ? CommonColor().shine
                                  : Color(0xFF7B78AA)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Outcome extends StatefulWidget {
  const Outcome({super.key});

  @override
  State<Outcome> createState() => _OutcomeState();
}

class _OutcomeState extends State<Outcome> {
  int selected = 0;
  List<String> days = ['Mon', 'Tue', 'Wen', 'Thus', "Fri", 'Sat', 'Sun'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 300, top: 10),
              child: Text(
                "Overview",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 50,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/Statistics.png",
              scale: 0.5,
            ),
          ),
          Positioned(
            bottom: 1,
            child: SizedBox(
              height: 30,
              width: 400,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  var data = days[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 350,
                        ),
                        child: Text(
                          data,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              color: index == selected
                                  ? CommonColor().shine
                                  : Color(0xFF7B78AA)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
