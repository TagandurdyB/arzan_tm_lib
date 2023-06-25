// ignore_for_file: must_be_immutable

import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';
import '../../providers/data/values_provider.dart';
import '../../providers/view/provider_navigation.dart';
import '../screens/acaunt_screens.dart';
import '../screens/screen_add_post.dart';
import '../screens/screen_main.dart';
import '../widgets/custom_future.dart';
import '/presentation/views/scaffold/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../scaffold/custom_navigation_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    const ScreenMain(),
    const SizedBox(),
    AddPostScreen(),
    const SizedBox(),
    AcauntScreens(),
  ];

  bool isConnect = false;

  @override
  void initState() {
    super.initState();
  }

  // checkConnect() async {
  //   isConnect = await ConnectionService.isConnected();
  //   if (isConnect) fillBanner();
  // }

  // void fillBanner() {
  //   final hiveP = HiveP.of(context, listen: false);
  //   final welayatId = hiveP.readInt(Tags.hiveLocationId);
  //   final valuesP = ValuesP.of(context, listen: false);
  //   valuesP.fillBanner(welayatId ?? 0, 1);
  // }

  @override
  Widget build(BuildContext context) {
    final provid = ProviderNav.of(context);
    final welayatId = HiveP.of(context).readInt(Tags.hiveLocationId);
    final valueDo = ValuesP.of(context, listen: false);
    return ScaffoldNo(
      drawer: CustomDrawer(),
      bottomNavigationBar: const CustomNavigationBar(),
      body: CustomFuture(
          future: valueDo.getBanner(welayatId ?? 0, 1),
          builder: (context, banners) {
            return Stack(
              children: List.generate(
                  screens.length,
                  (index) => Builder(
                        builder: (context) => Offstage(
                          offstage: index != provid.selectScreen,
                          child: screens[index],
                        ),
                      )),
            );
          }),
    );
  }
}
