// ignore_for_file: must_be_immutable, avoid_print

import '/domanin/entities/register/user_http_entity.dart';
import '/presentation/views/widgets/my_pop_widget.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/vars/constants.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../scaffold/recovery_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/ReadyInput/login_arzan_input.dart';
import '../../widgets/ReadyInput/ready_input_base.dart';
import '../../widgets/form_error_message.dart';
import '../../widgets/next_btn.dart';

class PasswordPage extends StatefulWidget {
  // final String? token;
  const PasswordPage({ super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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
        MyPopUpp.popLoading(context);
        AcauntP.of(context, listen: false)
            .recover(UserRequestEntity(
          phone: "+993${RIBase.getText(Tags.rISignPhone)}",
          pass: RIBase.getText(Tags.rISignPass),
        ))
            .then((response) {
          final status = response.status;
          MyPopUpp.popMessage(context, () {
            if (status) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Rout.home, (route) => route.isFirst);
            }
          }, status ? Words.recoverOK : Words.recoverNO, !status);
        });
        // MyPopUpp.popMessage(context, () {}, "", true);
        //======================================
        // Navigator.pushNamed(context, Rout.recoveryVerifi);
        //======================================
      } else {
        haveError = true;
      }
    });
  }

  String? _validatorPass() {
    if (isPressedBefore) {
      final String pass = RIBase.getText(Tags.rISignPass);
      final String passAgain = RIBase.getText(Tags.rISignPassAgain);
      if (pass != passAgain || pass == "" || pass.length < 8) {
        return "";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RecoveryScaffold(
      title: "Açar sözi",
      text: "",
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            ArzanInputs(
              validator: (String? value) => _validatorPass(),
              tag: Tags.rISignPass,
              iconD: Icons.vpn_key_outlined,
              label: "Açar sözi",
              hidden: "Açar sözi",
              type: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20),
            //===============================================================================
            ArzanInputs(
              validator: (String? value) => _validatorPass(),
              tag: Tags.rISignPassAgain,
              iconD: Icons.vpn_key_outlined,
              label: "Açar sözi (tassykla)",
              hidden: "Açar sözi (tassykla)",
              type: TextInputType.visiblePassword,
            ),
            FormErrorMessage(
                visible: haveError,
                message: "Dogry ýazmagyňyzy haýyş edýeris!"),
            const SizedBox(height: 20),
            NextBtn(func: _funcNext),
          ],
        ),
      ),
    );
  }
}
