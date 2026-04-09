import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/color_constants.dart';


// Reusable full-screen radial gradient wrapper
Widget radialBackground({required Widget child}) {
  return Container(
    width: double.infinity,
    height: double.infinity, // full screen
    decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [
          offWhiteColor, // edge color
          pinkColor.withValues(alpha: 0.4),     // center color

        ],
        center: Alignment(-1, 0), // slightly above center for subtle effect
        radius: 1.4,
        focal: Alignment(0, 0.1),
        focalRadius: 0.6,
      ),
    ),
    child: child, // your content goes here
  );
}