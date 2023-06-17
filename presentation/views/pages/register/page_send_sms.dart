// ignore_for_file: must_be_immutable, use_build_context_synchronously

import '../../../../config/services/device_info.dart';
import '../../../providers/data/hive_provider.dart';
import '/domanin/entities/register/check_entity.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../config/services/launcher_service.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../widgets/my_pop_widget.dart';
import '/presentation/views/widgets/ReadyInput/ready_input_base.dart';
import 'package:flutter/material.dart';

import '../../../../config/vars/constants.dart';
import '../../scaffold/recovery_scaffold.dart';
import '../../widgets/next_btn.dart';
import 'page_pass.dart';

class SendSmsPage extends StatelessWidget {
  final bool isRecover;
  SendSmsPage({this.isRecover = false, super.key});
  int raund = 0;

  void _funcSend() async {
    raund = 0;
    final status = await Permission.sms.request();
    if (status != PermissionStatus.granted) {
      throw "I Need Mic";
    }
    // LauncherService.sms(Words.phone);
    LauncherService().sendSMS(Words.phone, "ArzanTm");
    MyPopUpp.popLoading(context);

    checkTimer();
    // SuccessPop.pop(context, true);

    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   final providAdo = AcauntP.of(context, listen: false);
    //   // providAdo.signUp;
    //   providAdo.changeScreen(0);
    //   Navigator.popUntil(context, (route) => route.isFirst);
    // });
  }

  void checkTimer() async {
    raund++;
    final String unicID = await MyDevice.getUnic;
    Future.delayed(const Duration(seconds: 5)).then((value) {
      AcauntP.of(context, listen: false)
          .checkActivate(
        CheckEntity(
          uniqueId: unicID,
          phone: "993${RIBase.getText(Tags.rISignPhone)}",
        ),
      )
          .then((response) {
        if (response.status) {
          // final hiveP = HiveP.of(context, listen: false);
          // hiveP.saveStr(response.token!, Tags.hiveToken);
          // hiveP.saveBool(true, Tags.isLogin);
          // // hiveP.saveStr(response.role ??"user", Tags.hiveRole);
          // hiveP.saveStr("user", Tags.hiveRole);

          MyPopUpp.popMessage(context, () {
            // AcauntP.of(context, listen: false).changeScreen(0);
            isRecover ? _signUpFunc() : _recoverFunc(response.token!);
          }, "Siz üstünlükli tassyklandyňyz!", !response.status);
        } else if (raund < 5) {
          checkTimer();
        }
      });
    });
    if (raund == 5) {
      MyPopUpp.popMessage(
          context,
          null,
          "Anyklanylmady! Siz sms ugratmadyk bolmagyňyz mümkin. Täzeden synanşyň!",
          true);
    }
  }

  void _signUpFunc() => AcauntP.of(context, listen: false).changeScreen(0);

  void _recoverFunc(String token) {
    // Recover
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PasswordPage(token: token)));
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
