import '/presentation/providers/data/provider_revovery.dart';
import 'recovery_first.dart';
import 'recovery_second.dart';
import 'recovery_third.dart';
import 'package:flutter/material.dart';

class RecoveryScreens extends StatefulWidget {
  const RecoveryScreens({super.key});

  @override
  State<RecoveryScreens> createState() => _RecoveryScreensState();
}

class _RecoveryScreensState extends State<RecoveryScreens>
    with SingleTickerProviderStateMixin {
  late TabController revoveryScreen;

  @override
  void initState() {
    super.initState();
    revoveryScreen = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    revoveryScreen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    revoveryScreen.index = RecoveryP.of(context).index;
    return TabBarView(
      controller: revoveryScreen,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        RecoveryFirst(),
        RecoverySecond(),
        RecoveryThrid(),
      ],
    );
  }
}
