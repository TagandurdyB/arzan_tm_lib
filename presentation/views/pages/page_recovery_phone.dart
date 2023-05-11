// ignore_for_file: must_be_immutable, avoid_print

import '../../../config/routes/my_route.dart';
import '../../../config/services/my_size.dart';
import '../../../config/vars/constants.dart';
import '../scaffold/recovery_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/ReadyInput/login_arzan_input.dart';
import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/form_error_message.dart';
import '../widgets/next_btn.dart';

class RecoveryPhonePage extends StatefulWidget {
  const RecoveryPhonePage({super.key});

  @override
  State<RecoveryPhonePage> createState() => _RecoveryPhonePageState();
}

class _RecoveryPhonePageState extends State<RecoveryPhonePage> {
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
         Navigator.pushNamed(context, Rout.recoveryVerifi);
        //RecoveryP.of(context, listen: false).nextPage;
      } else {
        haveError = true;
      }
    });
  }

  String? _haveError() {
    if (isPressedBefore) {
      final String phone = RIBase.getText(Tags.rIPhone);
      if (phone == "") {
        return "";
      } else if (phone.length < 8) {
        return "";
      } else if (phone[0] != "6") {
        return "";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RecoveryScaffold(
      text: "Telefon belgiňizi giriziň:",
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            buildInput,
            FormErrorMessage(visible: haveError, message: "Nädogry belgi!"),
            const SizedBox(height: 20),
            NextBtn(func: _funcNext),
          ],
        ),
      ),
    );
  }

  Widget get buildInput => LoginArzanInputs(
        maxLength: 8,
        type: TextInputType.phone,
        tag: Tags.rIPhone,
        prefix: Container(
            // color: Colors.red,
            width: MySize.arentir * 0.17,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(
              " +993 |",
              style: TextStyle(
                color: Colors.grey,
                fontSize: MySize.arentir * 0.04,
              ),
            )),
        validator: (String? val) => _haveError(),
      );
}
