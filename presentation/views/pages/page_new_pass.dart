// ignore_for_file: must_be_immutable, avoid_print

import '../../../config/services/my_size.dart';
import '../../../config/vars/constants.dart';
import '../scaffold/recovery_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/ReadyInput/login_arzan_input.dart';
import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/form_error_message.dart';
import '../widgets/my_pop_widget.dart';
import '../widgets/next_btn.dart';
import '../widgets/success_pop.dart';

class NewPassPage extends StatefulWidget {
  const NewPassPage({super.key});

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
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
        _showPopSuccess();
        //  Navigator.popUntil(context, (route) => route.isFirst);
        //RecoveryP.of(context, listen: false).nextPage;
      } else {
        haveError = true;
      }
    });
  }

  void _showPopSuccess() {
    SuccessPop.pop(context, true);
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.popUntil(context, (route) => route.isFirst));
  }

  String? _haveError() {
    if (isPressedBefore) {
      final String pass = RIBase.getText(Tags.rINewPass);
      final String passAgain = RIBase.getText(Tags.rINewPassAgain);
      if (pass != passAgain) {
        return "";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RecoveryScaffold(
      text: "Täze açar sözi giriziň:",
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              buildContent,
              FormErrorMessage(
                  visible: haveError,
                  message: "Ýatda saklanylmady. Açar sözleri gabat gelenok!"),
              const SizedBox(height: 20),
              NextBtn(text: "Ýatda sakla", func: _funcNext),
            ],
          ),
        ),
      ),
    );
  }

  Widget get buildContent {
    return Column(children: [
      ArzanInputs(
        validator: (String? value) => _haveError(),
        tag: Tags.rINewPass,
        iconD: Icons.vpn_key_outlined,
        label: "Açar sözi giriziň",
        hidden: "Açar sözi giriziň",
        type: TextInputType.visiblePassword,
      ),
      const SizedBox(height: 20),
      ArzanInputs(
        validator: (String? value) => _haveError(),
        tag: Tags.rINewPassAgain,
        iconD: Icons.vpn_key_outlined,
        label: "Açar sözi tassyklaň",
        hidden: "Açar sözi tassyklaň",
        type: TextInputType.visiblePassword,
      ),
    ]);
  }
}
