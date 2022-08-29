import 'dart:ui';

import 'package:canvas_flutter/model/drawing_point.dart';
import 'package:flutter/cupertino.dart';

class CanvasPainter extends CustomPainter {
  List<DrawingPoint> drawingPoints;

  CanvasPainter(this.drawingPoints);

  List<Offset> offsetsList = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length; i++) {
      if (drawingPoints[i].offset != null &&
          drawingPoints[i + 1].offset != null) {
        canvas.drawLine(drawingPoints[i].offset!, drawingPoints[i + 1].offset!,
            drawingPoints[i].paint!);
      } else if (drawingPoints[i].offset != null &&
          drawingPoints[i + 1].offset == null) {
        offsetsList.clear();
        offsetsList.add(drawingPoints[i].offset!);

        canvas.drawPoints(PointMode.points, [drawingPoints[i].offset!],
            drawingPoints[i].paint!);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
