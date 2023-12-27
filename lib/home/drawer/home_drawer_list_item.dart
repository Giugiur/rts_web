import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawerListItem extends StatefulWidget {
  final String route;
  final IconData icon;
  final String label;
  const HomeDrawerListItem(this.route, this.icon, this.label, {super.key});

  @override
  State<HomeDrawerListItem> createState() => _HomeDrawerListItemState();
}

class _HomeDrawerListItemState extends State<HomeDrawerListItem> {

  bool _isHovering = false;

  void onEnter() {
    setState(() {
      _isHovering = true;
    });
  }

  void onExit() {
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => onEnter(),
      onExit: (e) => onExit(),
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          onTap: () => Get.toNamed(widget.route),
          leading: Icon(
            widget.icon,
            size: 26,
            color: !_isHovering ? Colors.white : Colors.black,
          ),
          hoverColor: Colors.white,
          title: Center(
            child: Text(
              widget.label.toUpperCase(),
              style: TextStyle(
                color: !_isHovering ? Colors.white : Colors.black,
                fontSize: 24,
                letterSpacing: 2,
              )
            ),
          ),
        ),
      ),
    );
  }
}
