import '../widgets/like_effect_widget.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        const SizedBox(height: 40),
        // SettingsContent()
        Expanded(child: buildContent)
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
              "Habarlaşmak",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );

  bool isLiked = false;

  Widget get buildContent {
    return LikeEffect(
      duration: const Duration(seconds: 6),
      bubbleCount: 500,
      onTap: (bool val) {
        print("Like:::=$val");
        setState(() {});
        isLiked = val;
      },
      child: Icon(isLiked ? Icons.favorite : Icons.favorite_border_outlined,
          color: Colors.red, size: 40),
    );
  }
}
