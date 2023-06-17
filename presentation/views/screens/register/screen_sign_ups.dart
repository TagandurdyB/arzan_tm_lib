import 'package:flutter/material.dart';

import '../../../providers/data/provider_acaunt.dart';
import 'screen_sign_name.dart';
import 'screen_sign_pass.dart';
import 'screen_sign_phone.dart';

class SignUpsScreen extends StatelessWidget {
  SignUpsScreen({super.key});

  final List<Widget> _screens = [
    const SignPhoneScreen(),
    const SignNameScreen(),
    const SignPassScreen(),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    final providA = AcauntP.of(context);
    return PageView.builder(
      controller: providA.pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _screens.length,
      itemBuilder: (context, index) =>
          Padding(padding: const EdgeInsets.all(16), child: _screens[index]),
    );
  }
}
