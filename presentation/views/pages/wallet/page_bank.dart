import '../../../../config/services/my_size.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        const SizedBox(height: 40),
        // SettingsContent()
      ]),
    );
  }

  Widget get buildTopBar => Container(
        color: Colors.white54,
        height: kToolbarHeight,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const BackButton(),
            Text(
              "Bank",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );
}
