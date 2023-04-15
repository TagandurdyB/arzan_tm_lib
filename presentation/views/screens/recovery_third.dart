import 'package:flutter/material.dart';

import '../widgets/form_error_message.dart';
import '../widgets/recovery_label.dart';
import '../widgets/recovery_next_btn.dart';

class RecoveryThrid extends StatefulWidget {
  const RecoveryThrid({super.key});

  @override
  State<RecoveryThrid> createState() => _RecoveryThridState();
}

class _RecoveryThridState extends State<RecoveryThrid> {
  final formKey = GlobalKey<FormState>();
  bool isPressedBefore = false;
  bool haveError = false;

  void _funcNext() {}
  @override
  Widget build(BuildContext context) {
    return RecoveryLabel(
      text: "Täze açar sözi giriziň:",
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            // buildInput,
            FormErrorMessage(visible: haveError, message: "Nädogry belgi!"),
            const SizedBox(height: 20),
            RecovertNextBtn(text: "Ýatda sakla", func: _funcNext),
          ],
        ),
      ),
    );
  }
}
