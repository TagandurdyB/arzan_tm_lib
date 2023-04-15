import '../../providers/data/provider_revovery.dart';
import '../widgets/form_error_message.dart';
import '../widgets/recovery_next_btn.dart';
import '/presentation/views/widgets/recovery_label.dart';
import 'package:flutter/material.dart';

import '../../../config/vars/constants.dart';
import '../widgets/ReadyInput/ready_input_base.dart';

class RecoverySecond extends StatefulWidget {
  const RecoverySecond({super.key});

  @override
  State<RecoverySecond> createState() => _RecoverySecondState();
}

class _RecoverySecondState extends State<RecoverySecond> {
  final formKey = GlobalKey<FormState>();
  bool isPressedBefore = false;
  bool haveError = false;

  void _funcNext() {
    setState(() {
      isPressedBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        //Login post
        haveError = false;
        RecoveryP.of(context, listen: false).nextPage;
      } else {
        haveError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RecoveryLabel(
      text: '''+993 ${RIBase.getText(Tags.rIRecoveryPhone)} belgä ugradylan 
6-belgili tassyklama kodyny giriziň:''',
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            // buildInput,
            FormErrorMessage(visible: haveError, message: "Nädogry belgi!"),
            const SizedBox(height: 20),
            RecovertNextBtn(func: _funcNext),
          ],
        ),
      ),
    );
  }
}
