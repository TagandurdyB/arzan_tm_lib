import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
              "Hamarlaşmak",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );
}
