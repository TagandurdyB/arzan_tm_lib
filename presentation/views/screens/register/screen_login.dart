import 'package:flutter/material.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/services/device_info.dart';
import '../../../../config/services/my_size.dart';
import '../../../../config/vars/constants.dart';
import '../../../../config/vars/formater.dart';
import '../../../providers/data/hive_provider.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../widgets/ReadyInput/login_arzan_input.dart';
import '../../widgets/ReadyInput/ready_input_base.dart';
import '../../widgets/form_error_message.dart';
import '../../widgets/my_container.dart';
import '../../widgets/my_pop_widget.dart';
import '../../widgets/next_btn.dart';
import '/domanin/entities/register/log_in_entity.dart';

import '/presentation/providers/view/provider_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassShow = false;
  bool isPressBefore = false;
  bool haveError = false;
  final double arentir = MySize.arentir;
  @override
  late BuildContext context;
  final formKey = GlobalKey<FormState>();

  String? _haveAnyValid() {
    if (isPressBefore) {
      if (RIBase.getText(Tags.rILoginPhone).length < 8) {
        //return "Enter min 7 char at Name";
        return "";
      }
    }
    return null;
  }

  Future get _loginFunc async {
    final String unicID = await MyDevice.getUnic;
    debugPrint("ID:=$unicID");
    setState(() {
      isPressBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        haveError = false;
        MyPopUpp.popLoading(context);
        AcauntP.of(context, listen: false)
            .logInPost(LoginEntity(
          uniqueId: unicID,
          phone: "+993${RIBase.getText(Tags.rILoginPhone)}",
          userPassword: RIBase.getText(Tags.rILoginPass),
        ))
            .then((response) {
          final bool status = response.status;
          if (status) ProviderNav.of(context, listen: false).changeScreen(0);
          MyPopUpp.popMessage(
            context,
            () {
              if (status) {
                print("Login Status $status   token=${response.token}");
                print("token decode=${Formater.jWTDecode(response.token!)}");
                final acauntP = AcauntP.of(context, listen: false);
                // acauntP.saveUserInfo(context, response);
                final hiveP = HiveP.of(context, listen: false);
                hiveP.saveStr(
                    "+993${RIBase.getText(Tags.rILoginPhone)}", Tags.hivePhone);
                hiveP.saveStr(response.token, Tags.hiveToken);
                final String role =
                    Formater.jWTDecode(response.token!)["subscription_type"]["type"];
                final int userId = Formater.jWTDecode(response.token!)["id"];
                hiveP.saveStr(role, Tags.hiveRole);
                hiveP.saveInt(userId, Tags.hiveUserId);
                print("Role := $role");
                hiveP.saveBool(true, Tags.isLogin);
                acauntP.logIned;
                // Navigator.pushNamedAndRemoveUntil(
                //     context, Rout.home, (route) => route.isFirst);
              }
            },
            status ? Words.loginOK : Words.loginNO,
            !status,
          );
        });
      } else {
        haveError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          ArzanInputs(
            validator: (String? value) => _haveAnyValid(),
            tag: Tags.rILoginPhone,
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
          ),
          const SizedBox(height: 20),
          ArzanInputs(
            validator: (String? value) => _haveAnyValid(),
            tag: Tags.rILoginPass,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi",
            hidden: "Açar sözi",
            type: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          FormErrorMessage(
              visible: haveError,
              message: "Ulanyjy ady ýada açar sözi nädogry girizildi!"),
          buildBottomSide,
          const SizedBox(height: 20),
          NextBtn(text: "Ulgama gir", func: () async => await _loginFunc),
        ]),
      ),
    );
  }

  Widget get buildBottomSide {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      //  color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildRememberMe,
          buildRecovery,
        ],
      ),
    );
  }

  bool isRemember = true;
  Widget get buildRememberMe {
    return GestureDetector(
      onTap: _funcRememberMe,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyContainer(
            shape: MySize.arentir * 0.01,
            width: MySize.arentir * 0.05,
            height: MySize.arentir * 0.05,
            color: isRemember ? const Color(0xff0EC243) : Colors.transparent,
            borderWidth: 1,
            borderColor: isRemember ? Colors.green : Colors.grey,
            child: Visibility(
              visible: isRemember,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: MySize.arentir * 0.04,
              ),
            ),
          ),
          SizedBox(width: MySize.arentir * 0.02),
          Text("Ýatda sakla",
              style: TextStyle(fontSize: MySize.arentir * 0.043)),
        ],
      ),
    );
  }

  void _funcRememberMe() {
    setState(() {
      isRemember = !isRemember;
    });
  }

  Widget get buildRecovery {
    return TextButton(
      onPressed: () {
        //  AcauntP.of(context, listen: false).resetPage;
        Navigator.pushNamed(context, Rout.recoveryPhone);
      },
      child: Text(
        "Açar sözi unutdym",
        style: TextStyle(
            color: const Color(0xffAAAAAA),
            decoration: TextDecoration.underline,
            fontSize: MySize.arentir * 0.043),
      ),
    );
  }
}
