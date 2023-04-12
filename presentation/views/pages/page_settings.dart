// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/domanin/entities/theme_entity.dart';
import 'package:arzan_tm/presentation/providers/data/data_provider_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(elevation: 0),
      ),
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
    final DataThemeProvider providT = DataThemeProvider.of(context);
    final DataThemeProvider providTdo =
        DataThemeProvider.of(context, listen: false);
    this.context = context;
    return Column(
      children: [
        ModeSwitchBtn(
          iconD: Icons.phonelink_setup,
          text: "Systema režim",
          startVal: providT.entity.isSystem,
          onChange: (bool val) {
            providTdo
                .save(ThemeEntity(isDark: true, isSystem: false, isLight: val));
            print("skdasdjaskd $val");
          },
        ),
        Opacity(
          opacity: providT.entity.isSystem ? 0.2 : 1,
          child: ModeSwitchBtn(
            iconD: Icons.light_mode_outlined,
            text: "Gijeki režim",
            startVal: !providT.entity.isSystem && providT.entity.isLight,
            onChange: (bool val) {
              print("skdasdjaskd $val");
            },
          ),
        ),
      ],
    );
  }
}

class ModeSwitchBtn extends StatefulWidget {
  final IconData iconD;
  final String text;
  final bool startVal;
  final Function? onChange;
  const ModeSwitchBtn({
    required this.iconD,
    this.text = "",
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
    return SwitchListTile.adaptive(
        contentPadding: const EdgeInsets.all(10),
        dense: true,
        title: buildSwitchTitle,
        value: _isDark,
        onChanged: (bool val) {
          if (widget.onChange != null) widget.onChange!(val);
          setState(() {
            _isDark = !_isDark;
          });
        });
  }

  Widget get buildSwitchTitle => Row(
        children: [
          Icon(widget.iconD),
          const SizedBox(width: 10),
          Text(widget.text,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: MySize.arentir * 0.045)),
        ],
      );
}
