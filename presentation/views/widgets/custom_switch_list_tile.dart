// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';

enum Mode { adaptive, cupertino, android }

class CustomSwitchListTile extends StatelessWidget {
  CustomSwitchListTile({
    this.onChanged,
    this.value = false,
    this.title,
    this.secondary,
    this.contentPadding,
    this.mode = Mode.adaptive,
    super.key,
  });

  final Function? onChanged;
  final bool value;
  final Widget? title;
  final Widget? secondary;
  final EdgeInsetsGeometry? contentPadding;
  final Mode mode;

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ListTile(
      contentPadding: contentPadding,
      onTap: () => _onChange(),
      leading: secondary,
      title: title,
      trailing: mode == Mode.adaptive
          ? buildAdaptiv
          : mode == Mode.android
              ? buildAndroid
              : buildCupertino,
    );
  }

  Widget get buildAdaptiv => Switch.adaptive(
        value: value,
        onChanged: (bool isChecked) => _onChange(),
      );

  Widget get buildAndroid => Switch(
        value: value,
        onChanged: (bool isChecked) => _onChange(),
      );

  Widget get buildCupertino {
    final colors = ThemeP.of(context).colors;
    return CupertinoSwitch(
      trackColor: colors.switchBg,
      activeColor: colors.switchBg,
      thumbColor: value ? colors.switchActiv : colors.switchUnActiv,
      value: value,
      onChanged: (bool isChecked) => _onChange(),
    );
  }

  void _onChange() {
    if (onChanged != null) onChanged!(value);
  }
}
