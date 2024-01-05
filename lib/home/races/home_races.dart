import 'package:flutter/material.dart';
import 'package:rts_web/home/races/home_race_page.dart';
import 'package:tab_container/tab_container.dart';

import '../../NFTs/NFTModel.dart';

class HomeRaces extends StatelessWidget {
  const HomeRaces({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: TabContainer(
        // selectedTextStyle: Theme.of(context).textTheme.displayLarge,
        // unselectedTextStyle: Theme.of(context).textTheme.bodyLarge,
        isStringTabs: false,
        radius: 12,
        tabEdge: TabEdge.bottom,
        tabCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          animation = CurvedAnimation(
              curve: Curves.easeIn, parent: animation);
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.2, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        colors: [
          Race.Keenfolk.color,
          Race.Travelers.color,
          Race.Eldmen.color,
          Race.Keldarin.color,
          Race.Grolls.color,
        ],
        tabs: <Widget> [
          ListTile(
            leading: Icon(
                Race.Keenfolk.icon
            ),
            title: Text(Race.Keenfolk.label),
          ),
          ListTile(
            leading: Icon(
                Race.Travelers.icon
            ),
            title: Text(Race.Travelers.label),
          ),
          ListTile(
            leading: Icon(
                Race.Eldmen.icon
            ),
            title: Text(Race.Eldmen.label),
          ),
          ListTile(
            leading: Icon(
                Race.Keldarin.icon
            ),
            title: Text(Race.Keldarin.label),
          ),
          ListTile(
            leading: Icon(
                Race.Grolls.icon
            ),
            title: Text(Race.Grolls.label),
          ),
        ],
        children: [
          HomeRacePage(Race.Keenfolk),
          HomeRacePage(Race.Travelers),
          HomeRacePage(Race.Eldmen),
          HomeRacePage(Race.Keldarin),
          HomeRacePage(Race.Grolls),
        ],
      ),
    );
  }
}
