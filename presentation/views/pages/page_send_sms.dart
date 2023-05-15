// ignore_for_file: must_be_immutable

import '/presentation/views/widgets/ReadyInput/ready_input_base.dart';
import 'package:flutter/material.dart';

import '../../../config/vars/constants.dart';
import '../../providers/data/provider_acaunt.dart';
import '../scaffold/recovery_scaffold.dart';
import '../widgets/next_btn.dart';
import '../widgets/success_pop.dart';

class SendSmsPage extends StatelessWidget {
  SendSmsPage({super.key});

  void _funcSend() {
    SuccessPop.pop(context, true);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      AcauntP.of(context, listen: false).signUp;
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return RecoveryScaffold(
      title: "Tassyklama",
      text: '''+993 ${RIBase.getText(Tags.rISignPhone)} belgiden ${Words.phone}
belgä boş sms ugradyň. Ugradanyňyzdan soň
kabul edilýänçä biraz garaşyň!''',
      content: NextBtn(func: _funcSend, text: "Boş sms ugratmak"),
    );
  }
}
