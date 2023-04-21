import 'package:arzan_tm/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

class ChosenPage extends StatelessWidget {
  const ChosenPage({super.key});

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
              "Saylananlar",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );
}
