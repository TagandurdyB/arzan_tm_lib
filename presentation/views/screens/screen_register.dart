// ignore_for_file: must_be_immutable

import '/presentation/views/screens/screen_login.dart';
import '/presentation/views/screens/screen_sign_up.dart';
import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  int _selectedScreen = 0;

  final List<Widget> screens = [
    const LoginScreen(),
    const SignUpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          buildTopBar,
          buildPageChanger(_selectedScreen),
          const SizedBox(height: 20),
          Expanded(child: screens[_selectedScreen]),
        ],
      ),
    );
  }

  Widget get buildTopBar => Container(
        // color: Colors.red,
        color: Colors.transparent,
        height: kToolbarHeight,
        child: Row(
          children: [
            Text(
              "Agza bol",
              style: TextStyle(
                  fontSize: MySize.arentir * 0.06, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget buildPageChanger(int screenIndex) {
    return Row(
      children: [
        Expanded(
            child: buildChangeBtn(screenIndex == 0, true, "Ulgama girmek")),
        Expanded(child: buildChangeBtn(screenIndex == 1, false, "Agza bolmak")),
      ],
    );
  }

  Widget buildChangeBtn(bool isActive, bool isLeftShape, String name) {
    return InkWell(
      onTap: () => setState(() {
        _selectedScreen = _selectedScreen == 0 ? 1 : 0;
      }),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //border: Border.symmetric(horizontal: ),
          borderRadius: BorderRadius.horizontal(
            left: isLeftShape ? const Radius.circular(8) : Radius.zero,
            right: !isLeftShape ? const Radius.circular(8) : Radius.zero,
          ),
          border: !isActive
              ? Border.all(width: 1, color: const Color(0xffD8D8D8))
              : null,
          color: isActive ? const Color(0xff0EC243) : const Color(0xffF9FAFC),
        ),
        child: Text(
          name,
          style: TextStyle(
              color: isActive ? Colors.white : const Color(0xffAAAAAA),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
