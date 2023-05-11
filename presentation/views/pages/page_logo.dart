import '/presentation/providers/data/data_provider_theme.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/services/my_size.dart';
import '../../../config/vars/constants.dart';
import '../../providers/view/provider_theme.dart';
import '../widgets/my_container.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  late DataThemeProvider themeProvider;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Dutrations.logoTime).then((value) {
      if (_selectedIndex != 5) _goHome;
    });
  }

  void get _goHome => Navigator.pushReplacementNamed(context, Rout.home);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MySize().changeSize(size.width, size.height);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
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

  Widget buildLogo() => Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 200,
            child: Container(
              width: MySize.arentir * 0.65,
              height: MySize.arentir * 0.5,
              decoration: const BoxDecoration(
                  //   color: Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: ExactAssetImage("assets/logo_png.png"))),
            ),
          ),
          Positioned(
              bottom: 50,
              child: SizedBox(
                //color: Colors.red,
                width: MySize.arentir * 0.5,
                child: Column(
                  children: [
                    Text("www.arzan.info",
                        style: ThemeP.of(context).styles.site),
                    Text("MAGLUMAT PLATFORMASY",
                        style: ThemeP.of(context).styles.siteSub),
                  ],
                ),
              ))
        ],
      );
}
