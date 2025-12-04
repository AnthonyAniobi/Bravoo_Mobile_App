import 'package:flutter/material.dart';

class BouncingOnTapWidget extends StatefulWidget {
  const BouncingOnTapWidget({
    this.onTap,
    this.child,
    super.key,
  });
  final VoidCallback? onTap;
  final Widget? child;

  @override
  _BouncingOnTapWidgetState createState() => _BouncingOnTapWidgetState();
}

class _BouncingOnTapWidgetState extends State<BouncingOnTapWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _animationController.forward().then((_) {
      _animationController.reverse();
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InkWell(
        onTap: widget.onTap == null ? null : _handleTap,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
