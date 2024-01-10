import 'package:e_wallet/common/common_color.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    Key? key,
    required this.child,
    required int selectedIndex,
  }) : super(key: key);
  final Widget child;
  final int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (selectedIndex != 0) {
          context.go(Routes.homescreen.path);
        }
      },
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: CommonColor().bluebg),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    // color: Colors.pink.shade200,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                    offset: const Offset(
                      0,
                      7,
                    ),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                child: CustomNavBar(
                  colors: Colors.pink,
                  selectedColor: Colors.white,
                  icons: [
                    selectedIndex == 0 ? Iconsax.home5 : Iconsax.home_1,
                    selectedIndex == 1 ? Iconsax.heart5 : Iconsax.heart,
                    selectedIndex == 2 ? Iconsax.add : Iconsax.add,
                    selectedIndex == 3 ? Iconsax.message5 : Iconsax.message,
                  ],
                  currentIndex: selectedIndex,
                  onItemTap: (index) => context.go(_indexToTab(index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _indexToTab(int index) {
    switch (index) {
      case 0:
        return Routes.homescreen.path;
      case 1:
        return Routes.wallet.path;
      case 2:
        return Routes.account.path;
      case 3:
        return Routes.statisticsscreen.path;
      default:
        return Routes.homescreen.path;
    }
  }
}

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    required this.icons,
    required this.currentIndex,
    required this.onItemTap,
    required this.selectedColor,
    required this.colors,
  });

  final List<IconData> icons;
  final int currentIndex;
  final void Function(int index) onItemTap;
  final Color selectedColor;
  final Color colors;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double lineSize = constraints.maxWidth / widget.icons.length;
      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 350),
              margin: EdgeInsets.only(left: widget.currentIndex * lineSize),
              height: 80,
              width: lineSize,
              decoration: BoxDecoration(
                color: const Color(0xFFBE8E9B),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.pink,
                    blurRadius: 10,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.icons.map(
                (e) {
                  int index = widget.icons.indexOf(e);
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: (lineSize - 48) / 2),
                    child: SizedBox(
                      width: 48,
                      child: MaterialButton(
                        elevation: 0,
                        minWidth: 10,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        splashColor: const Color(0xFFBE8E9B),
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        onPressed: widget.currentIndex == index
                            ? null
                            : () {
                                widget.onItemTap(index);
                              },
                        child: Icon(
                          e,
                          color: widget.currentIndex == index
                              ? widget.selectedColor
                              : widget.colors,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      );
    });
  }
}
