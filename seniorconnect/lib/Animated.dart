import 'package:flutter/material.dart';
import 'package:seniorconnect/drawer.dart';

class SidebarAnimation extends StatefulWidget {
  @override
  _SidebarAnimationState createState() => _SidebarAnimationState();
}

class _SidebarAnimationState extends State<SidebarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
    

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value * MediaQuery.of(context).size.height),
          child: child,
        );
      },
      child: MyDrawer(), // Replace with your sidebar widget
    );
  }
}
