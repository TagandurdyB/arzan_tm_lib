import '/domanin/entities/register/log_in_entity.dart';

import '../../../config/services/device_info.dart';
import '../../../config/services/my_size.dart';
import '../widgets/my_pop_widget.dart';
import '/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/vars/constants.dart';
import '../../providers/data/provider_acaunt.dart';
import '../widgets/ReadyInput/login_arzan_input.dart';
import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/form_error_message.dart';
import '../widgets/next_btn.dart';

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
      if (RIBase.getText(Tags.rILoginPass).length < 5) {
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
        //Login post
        haveError = false;
        _popLoading();
        AcauntP.of(context, listen: false)
            .logIn(LogInEntity(
              uniqueId: unicID,
              userName: RIBase.getText(Tags.rILoginUser),
              userPassword: RIBase.getText(Tags.rILoginPass),
            ))
            .then((response) =>
                _popMessage(response.message, !response.succsess));
      } else {
        haveError = true;
      }
    });
  }

  void _popLoading() {
    MyPopUpp(
        width: arentir * 0.6,
        height: arentir * 0.4,
        borderRadius: 10,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text(
                "Garaşmagyňyzy haýyş edýeris!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: arentir * 0.04),
              ),
            ],
          ),
        )).pop(context);
  }

  void _popMessage(String message, bool isError) {
    MyPopUpp(
        width: arentir * 0.6,
        height: arentir * 0.4,
        borderRadius: 10,
        content: Column(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outlined,
              color: isError ? Colors.red : Colors.green,
              size: arentir * 0.15,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: arentir * 0.04),
              textAlign: TextAlign.center,
            ),
          ],
        )).pop(context);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);

      // AcauntP.of(context, listen: false).changeScreen(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          ArzanInputs(
            validator: (String? value) => _haveAnyValid(),
            tag: Tags.rILoginUser,
            iconD: Icons.assignment_ind_outlined,
            label: "Ulanyjy ady",
            hidden: "Ulanyjy ady",
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
