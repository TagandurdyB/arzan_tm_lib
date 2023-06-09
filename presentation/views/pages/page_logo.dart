import '../../../config/themes/styles.dart';
import '../../providers/data/provider_gallery.dart';
import '../../providers/data/values_provider.dart';
import '../../providers/data/video_data_provider.dart';
import '/presentation/providers/data/discount_data_provider.dart';

import '../../../config/services/connection.dart';
import '/presentation/providers/data/provider_acaunt.dart';

import '../../providers/data/hive_provider.dart';
import '/presentation/providers/data/data_provider_theme.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/services/my_size.dart';
import '../../../config/vars/constants.dart';
import '../../providers/view/provider_theme.dart';
import '../widgets/my_container.dart';
import 'package:lottie/lottie.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  late DataThemeProvider themeProvider;
  int _selectedIndex = 0;
  late bool isConnect;

  @override
  void initState() {
    super.initState();
    Future.delayed(Dutrations.logoTime).then((value) {
      if (_selectedIndex != 5) _goHome;
    });
    checkConnect();
  }

  checkConnect() async {
    isConnect = await ConnectionService.isConnected();
    if (isConnect) {
      checkUserInfo();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final discountDo = DiscountDataP.of(context, listen: false);
        discountDo.fillDiscounts(0,0);
        discountDo.fillBadge();
        discountDo.fillCategories();
        VideoDataP.of(context, listen: false).fillBadge();
        GalleryP.of(context, listen: false).fillBadge();
        final int welayatId =
            HiveP.of(context, listen: false).readInt(Tags.hiveLocationId) ?? 0;
        final valueDo = ValuesP.of(context, listen: false);
        valueDo.fillLocations();
        valueDo.getBanner(welayatId, 1, 0);
      });
    }
  }

  void checkUserInfo() async {
    final hiveP = HiveP.of(context, listen: false);
    final token = hiveP.readStr(Tags.hiveToken);
    final phone = hiveP.readStr(Tags.hivePhone);
    if (token != null && phone != null) {
      ////////Check User Info
      // final acauntP = AcauntP.of(context, listen: false);
      // acauntP
      //     .checkUser(UserRequestEntity(phone: phone, token: token))
      //     .then((response) {
      //   acauntP.saveUserInfo(context, response);
      // });
    }
  }

  void get _goHome async {
    if (isConnect) {
      final hiveP = HiveP.of(context, listen: false);
      if (hiveP.readBool(Tags.isLogin) == true) {
        AcauntP.of(context, listen: false).logIned;
      }

      // Navigator.pushReplacementNamed(context, Rout.home);

      if (hiveP.readStr(Tags.hiveLocation) != null) {
        Navigator.pushReplacementNamed(context, Rout.home);
      } else {
        Navigator.pushReplacementNamed(context, Rout.region);
      }
    } else {
      Navigator.pushReplacementNamed(context, Rout.disconnect);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MySize().changeSize(size.width, size.height);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1D823B), Color(0xff2D8346), Color(0xff03C93E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: ExactAssetImage("assets/logo_bg.png")),
        ),
        child: Stack(
          children: [
            Center(child: buildLogo()),
            buildSifr(),
            Visibility(
              visible: _selectedIndex == 4,
              child: MyContainer(
                  color: Colors.transparent,
                  onTap: () => _goHome,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(Words.avtor,
                      style: ThemeP.of(context).styles.avatar)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSifr() {
    return Wrap(
        children: List.generate(
            4,
            (index) => MyContainer(
                  onTap: () => _sifrFunc(index),
                  color: Colors.transparent,
                  width: MySize.width * 0.5,
                  height: MySize.height * 0.5,
                  borderColor: Colors.transparent,
                )));
  }

  void _sifrFunc(int index) {
    if (_selectedIndex != 4) {
      if (index == _selectedIndex) {
        _selectedIndex++;
        setState(() {});
      } else {
        {
          _selectedIndex = 0;
        }
      }
      // debugPrint("+++++++++++++++++++++$_selectedIndex");
    }
  }

  Widget buildLogo() {
    final double arentir = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 200,
          child: Container(
            width: arentir * 0.7,
            height: arentir * 0.7,
            decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: ExactAssetImage("assets/logo_png.png"))),
          ),
        ),
        Positioned(
            bottom: 50,
            child: SizedBox(
              //color: Colors.red,
              width: arentir * 0.5,
              child: Column(
                children: [
                  Text("www.arzan.info",
                      style: StylesLight().site(arentir * 0.06)),
                  Text("MAGLUMAT PLATFORMASY",
                      style: StylesLight().site(arentir * 0.027)),
                ],
              ),
            )),
        Positioned(
            bottom: arentir * 0.3,
            child: SizedBox(
              width: arentir * 0.3,
              height: arentir * 0.3,
              child: Lottie.asset(
                "assets/loading0.json",
                repeat: true,
                // reverse: true,
              ),
            )),
      ],
    );
  }
}
