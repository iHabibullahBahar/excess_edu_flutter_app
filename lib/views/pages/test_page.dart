import 'package:flutter/cupertino.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;

  ExpandableContainer({
    required this.child,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedContainer(
        duration: widget.animationDuration,
        height: _isExpanded ? null : 0,
        child: OverflowBox(
          maxHeight: _isExpanded ? double.infinity : 0,
          child: widget.child,
        ),
      ),
    );
  }
}
