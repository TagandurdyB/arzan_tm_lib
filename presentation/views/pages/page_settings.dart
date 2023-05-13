// ignore_for_file: must_be_immutable, avoid_print

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';

import '../../../config/services/my_size.dart';
import '/presentation/providers/data/data_provider_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_switch_list_tile.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          buildTopBar,
          const SizedBox(height: 40),
          SettingsContent()
        ]),
      ),
    );
  }

  Widget get buildTopBar => Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          Text(
            "Sazlamalar",
            style: TextStyle(fontSize: MySize.arentir * 0.065),
          ),
        ],
      );
}

class SettingsContent extends StatelessWidget {
  SettingsContent({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    final providT = DataThemeProvider.of(context);
    final providTdo = DataThemeProvider.of(context, listen: false);
    this.context = context;
    return Column(
      children: [
        ModeSwitchBtn(
          iconD: Icons.phonelink_setup,
          text: "Systema režim",
          startVal: providT.isSystem,
          onChange: (bool val) {
            providTdo.tongleSystem;
            print("skdasdjaskd $val");
          },
        ),
        ModeSwitchBtn(
          iconD: Icons.light_mode_outlined,
          text: "Gijeki režim",
          startVal: !providT.isLight,
          isLocked: providT.isSystem,
          onChange: (bool val) {
            providTdo.tongleLight;
            print("skdasdjaskd $val");
          },
        ),
      ],
    );
  }
}

class ModeSwitchBtn extends StatefulWidget {
  final IconData iconD;
  final String text;
  final bool startVal;
  final bool isLocked;
  final Function? onChange;
  const ModeSwitchBtn({
    required this.iconD,
    this.text = "",
    this.isLocked = false,
    this.startVal = false,
    this.onChange,
    super.key,
  });

  @override
  State<ModeSwitchBtn> createState() => _ModeSwitchBtnState();
}

class _ModeSwitchBtnState extends State<ModeSwitchBtn> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _isDark = widget.startVal;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isLocked ? 0.2 : 1,
      child: CustomSwitchListTile(
          mode: Mode.cupertino,
          contentPadding: const EdgeInsets.all(10),
          title: Text(widget.text,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: MySize.arentir * 0.045)),
          secondary: Icon(
            widget.iconD,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
          ),
          value: _isDark,
          onChanged: (bool val) {
            if (!widget.isLocked) {
              if (widget.onChange != null) widget.onChange!(val);
              setState(() {
                _isDark = !_isDark;
              });
            }
          }),
    );
  }
}
