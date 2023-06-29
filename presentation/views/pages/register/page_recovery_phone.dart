// ignore_for_file: must_be_immutable, avoid_print

import '/domanin/entities/register/user_http_entity.dart';
import '/presentation/views/widgets/my_pop_widget.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/services/my_size.dart';
import '../../../../config/vars/constants.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../scaffold/recovery_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/ReadyInput/login_arzan_input.dart';
import '../../widgets/ReadyInput/ready_input_base.dart';
import '../../widgets/form_error_message.dart';
import '../../widgets/next_btn.dart';

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
        MyPopUpp.popLoading(context);
        AcauntP.of(context, listen: false)
            .exist(UserRequestEntity(phone: "+993${RIBase.getText(Tags.rISignPhone)}"))
            .then((response) {
          if (!response.status) {
            MyPopUpp.popMessage(
                context, null, "Telefon belgi tapylmady!", true);
          } else {
            Navigator.pop(context);
            print("here1");
            Navigator.pushNamed(context, Rout.sendRecoverSMS);
          }
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

  String? _haveError() {
    if (isPressedBefore) {
      final String phone = RIBase.getText(Tags.rISignPhone);
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

  Widget get buildInput => ArzanInputs(
        validator: (String? value) => _haveError(),
        tag: Tags.rISignPhone,
        // iconD: Icons.phone,
        prefix: Container(
            // color: Colors.red,
            width: MySize.arentir * 0.23,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 8),
            child: Row(
              children: const [
                Icon(Icons.phone),
                Text(
                  " +993 |",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
        label: "Telefon belgisi",
        hidden: "   Telefon belgisi",
        type: TextInputType.phone,
      );
}
