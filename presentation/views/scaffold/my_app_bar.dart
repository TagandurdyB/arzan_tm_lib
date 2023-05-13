// ignore_for_file: must_be_immutable
import '../../../config/vars/constants.dart';
import '../../providers/view/provider_navigation.dart';
import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/ReadyInput/search_input.dart';

import '/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return const MainBar();
  }
}

class MainBar extends StatefulWidget {
  const MainBar({super.key});

  @override
  State<MainBar> createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> with TickerProviderStateMixin {
  late AnimationController _controller;
  final Duration animDuration = const Duration(milliseconds: 500);
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: animDuration, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      height: kToolbarHeight,
      child: Row(
        children: [
          buildMenue,
          Expanded(child: buildInput),
          buildBell,
        ],
      ),
    );
  }

  Widget get buildMenue {
    return MyContainer(
        color: Colors.transparent,
        onTap: () {
          final providN = ProviderNav.of(context, listen: false);
          if (focus.hasFocus) focus.unfocus();
          if (providN.isSearch) {
            _controller.reverse();
            providN.changeSearch(false);
            RIBase.eraseDate(Tags.rIMainSearch);
          } else {
            Scaffold.of(context).openDrawer();
          }
        },
        padding: const EdgeInsets.all(16),
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          color: Theme.of(context).appBarTheme.iconTheme!.color,
          progress: _controller,
        ) //ThemeP.of(context).icons.menu,
        );
  }

  Widget get buildInput {
    final themeColors = Theme.of(context).inputDecorationTheme;
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 16),
      child: SearchInput(
        focus: focus,
        tag: Tags.rIMainSearch,
        hidden: "Gözle...",
        onTap: () {
          final providN = ProviderNav.of(context, listen: false);
          providN.changeSearch(true);
          providN.changeSearchBg(
              ThemeP.of(context, listen: false).colors.searchCanvas);
          providN.changeSaved(false);
          _controller.forward();
        },
        onEditingComplete: () {
          if (focus.hasFocus) focus.unfocus();
          final providN = ProviderNav.of(context, listen: false);
          providN.changeSearchBg(Theme.of(context).canvasColor);
          providN.changeSaved(true);
        },
      ),
    );
  }

  Widget get buildBell {
    return AnimatedCrossFade(
      duration: animDuration,
      firstChild: MyContainer(
          alignment: Alignment.center,
          color: Colors.transparent,
          // margin: const EdgeInsets.only(right: 16, top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onTap: () {},
          child: Icon(
            color: Theme.of(context).appBarTheme.iconTheme!.color,
            Icons.notifications_none,
            size: 35,
          )),
      secondChild: const SizedBox(),
      crossFadeState: !ProviderNav.of(context).isSearch
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}

// class SearchBar extends StatelessWidget {
//   SearchBar({super.key});
//   late BuildContext context;

//   @override
//   Widget build(BuildContext context) {
//     this.context = context;
//     return Container(
//         color: ProviderNav.of(context).isSearch
//             ? ThemeP.of(context).colors.searchCanvas
//             : Colors.transparent,
//         child: Container(
//             clipBehavior: Clip.hardEdge,
//             decoration: BoxDecoration(
//               color: Theme.of(context).appBarTheme.backgroundColor,
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(MySize.arentir * 0.03),
//               ),
//             ),
//             height: kToolbarHeight,
//             child: buildContent));
//   }

//   Widget get buildContent => Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Keyboard.close(context);
//               ProviderNav.of(context, listen: false).changeSearch(false);
//             },
//             child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   color: Theme.of(context).appBarTheme.iconTheme!.color!,
//                 ) // BackButton(),
//                 ),
//           ),
//           Expanded(child: buildInput),
//         ],
//       );

//   Widget get buildInput {
//     final themeColors = Theme.of(context).inputDecorationTheme;
//     return Container(
//       height: 40,
//       margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
//       child: Material(
//         type: MaterialType.transparency,
//         child: ReadyInput(
//           cursorColor: Colors.grey,
//           inputStyle: themeColors.counterStyle!,
//           enabledBorderColor: themeColors.fillColor!,
//           focusedBorderColor: themeColors.focusColor!,
//           labelColor: const Color(0xffC4C4C4),
//           hintColor: const Color(0xffC4C4C4),
//           label: "Gözle...",
//           hidden: "Gözle...",
//           // autoFocus: true,
//           reightWidget: const SizedBox(),
//           tag: Tags.rIMainSearch,
//           shape: true,
//           borderRad: 8,
//         ),
//       ),
//     );
//   }
// }
