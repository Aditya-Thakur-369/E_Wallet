import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.baby_changing_station),
          onPressed: () {
            GoRouter.of(context).pushNamed(Routes.homescreen.name);
          },
        ),
      ),
    );
  }
}
