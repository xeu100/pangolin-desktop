/*
Copyright 2019 The dahliaOS Authors
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget child;
  final Color color;
  final BorderRadius borderRadius;
  final double opacity;
  const Hover({
    @required this.child,
    this.color,
    this.borderRadius,
    this.opacity,
    Key key,
  }) : super(key: key);

  @override
  _HoverState createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
        color: _hover
            ? (widget.color == null)
                ? Colors.black.withOpacity(widget.opacity ?? 0.3)
                : widget.color.withOpacity(widget.opacity ?? 0.3)
            : Colors.black.withOpacity(0.0),
      ),
      child: Center(
        child: MouseRegion(
            onEnter: (event) {
              setState(() {
                _hover = true;
              });
            },
            onExit: (event) {
              setState(() {
                _hover = false;
              });
            },
            child: widget.child),
      ),
    );
  }
}
