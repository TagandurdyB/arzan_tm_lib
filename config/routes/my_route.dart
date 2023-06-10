import '/presentation/views/pages/lotties/page_disconntect.dart';
import '/presentation/views/pages/lotties/page_not_found.dart';

import '../../presentation/views/pages/lotties/page_404.dart';
import '/presentation/views/pages/wallet/page_boughts.dart';

import '/presentation/views/pages/wallet/page_bank.dart';

import '../../presentation/views/pages/wallet/page_buy_service.dart';
import '/presentation/views/pages/wallet/page_buy_coin.dart';

import '../../presentation/views/pages/page_contest.dart';
import '/presentation/views/pages/page_contact.dart';
import '/presentation/views/pages/page_shear.dart';

import '../../presentation/views/pages/page_favorites.dart';
import '../../presentation/views/pages/page_officials.dart';
import '../../presentation/views/pages/page_region.dart';
import '/presentation/views/pages/page_legal_info.dart';

import '../../presentation/views/pages/discount/page_discounts.dart';
import '/presentation/views/pages/page_tops.dart';

import '/presentation/views/pages/page_images.dart';
import '/presentation/views/pages/page_videos.dart';

import '../../presentation/views/pages/page_acaunt.dart';
import '../../presentation/views/pages/chosen/page_chosen.dart';

import '/presentation/views/pages/page_send_sms.dart';
import 'package:flutter/material.dart';

import '../../presentation/providers/data/provider_acaunt.dart';
import '../../presentation/views/pages/page_about.dart';
import '../../presentation/views/pages/page_home.dart';
import '../../presentation/views/pages/page_logo.dart';
import '../../presentation/views/pages/page_new_pass.dart';
import '../../presentation/views/pages/page_recovery_phone.dart';
import '../../presentation/views/screens/screen_search.dart';
import '../../presentation/views/pages/page_settings.dart';
import '../../presentation/views/pages/page_verification.dart';
import '../../presentation/views/widgets/success_pop.dart';

class Rout {
  static const String logo = "/";
  static const String region = "/RegionPage";
  static const String home = "/HomePage";
  static const String about = "/AboutPage";
  static const String settings = "/SettingsPage";
  static const String search = "/SearchPage";
  static const String recoveryPhone = "/RecoveryPhonePage";
  static const String recoveryVerifi = "/RecoveryVerificarionPage";
  static const String signUpVerifi = "/SignUpVerificarionPage";
  static const String newPass = "/NewPassPage";
  static const String sendSMS = "/SendSmsPage";
  static const String chosen = "/ChosenPage";
  static const String acaunt = "/AcauntPage";
  static const String images = "/ImagesPage";
  // static const String imagesDetal = "/ImagesDetalPage";
  static const String videos = "/VideosPage";
  static const String tops = "/TopsPage";
  static const String discounts = "/DiscountsPage";
  static const String legalInfo = "/LegalInfoPage";
  static const String officials = "/OfficialsPage";
  static const String favorites = "/FavotitesPage";
  static const String contact = "/ContactPage";
  static const String share = "/SharePage";
  static const String contest = "/ContestPage";

  static const String buyCoin = "/BuyCoinPage";
  static const String buyService = "/BuyServicePage";
  static const String bank = "/BankPage";
  static const String boughts = "/BoughtsPage";

  //Lotties=============================================
  static const String page404 = "/Page404";
  static const String pageNotFound = "/PageNotFound";
  static const String disconnect = "/PageDisconnect";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    region: (context) => RegionPage(),
    home: (context) => HomePage(),
    about: (context) => const AboutPage(),
    settings: (context) => SettingsPage(),
    search: (context) => ScreenSearch(),
    recoveryPhone: (context) => const RecoveryPhonePage(),
    recoveryVerifi: (context) => VerificarionPage(
          btnFunc: () => Navigator.pushNamed(context, Rout.newPass),
        ),
    signUpVerifi: (context) => VerificarionPage(
          title: "Tassyklama",
          btnName: "Tassykla",
          btnFunc: () {
            SuccessPop.pop(context, true);
            Future.delayed(const Duration(seconds: 2)).then((value) {
              AcauntP.of(context, listen: false).signUp;
              Navigator.popUntil(context, (route) => route.isFirst);
            });
          },
        ),
    newPass: (context) => const NewPassPage(),
    sendSMS: (context) => SendSmsPage(),
    chosen: (context) => ChosenPage(),
    acaunt: (context) => AcauntPage(),
    images: (context) => const ImagesPage(),
    // imagesDetal:(context)=> const ImageDetalPage(),
    videos: (context) => VideosPage(),
    tops: (context) => TopsPage(),
    discounts: (context) => const DiscountsPage(),
    legalInfo: (context) => const LegalInfoPage(),
    officials: (context) => const OfficialsPage(),
    favorites: (context) => const FavoritesPage(),
    contact: (context) => const ContactPage(),
    share: (context) => const SharePage(),
    contest: (context) => const ContestPage(),
    buyCoin: (context) => BuyCionPage(),
    buyService: (context) => const BuyServicePage(),
    bank: (context) => const BankPage(),
    boughts: (context) => const BoughtsPage(),
    //Lotties=============================================
    page404: (context) => Page404(),
    pageNotFound: (context) => PageNotFound(),
    disconnect: (context) => PageDisconnect(),
    //====================================================
  };
}
