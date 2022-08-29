import 'package:canvas_flutter/model/drawing_point.dart';
import 'package:canvas_flutter/utils/canvas_painter.dart';
import 'package:flutter/material.dart';

class CanvasBoard extends StatefulWidget {
  const CanvasBoard({Key? key}) : super(key: key);

  @override
  State<CanvasBoard> createState() => _CanvasBoardState();
}

class _CanvasBoardState extends State<CanvasBoard> {
  List<DrawingPoint> drawingPoints = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(138, 35, 135, 1.0),
                  Color.fromRGBO(233, 84, 67, 1.0),
                  Color.fromRGBO(242, 113, 33, 1.0),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onPanDown: (details) {
                      setState(() {
                        drawingPoints.add(
                          DrawingPoint(
                            details.localPosition,
                            Paint()
                              ..color = Colors.black
                              ..isAntiAlias = true
                              ..strokeWidth = 2
                              ..strokeCap = StrokeCap.round,
                          ),
                        );
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        drawingPoints.add(
                          DrawingPoint(
                            details.localPosition,
                            Paint()
                              ..color = Colors.black
                              ..isAntiAlias = true
                              ..strokeWidth = 2
                              ..strokeCap = StrokeCap.round,
                          ),
                        );
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        setState(() {
                          drawingPoints.add(
                            DrawingPoint(
                              null,
                              Paint()
                                ..color = Colors.black
                                ..isAntiAlias = true
                                ..strokeWidth = 2
                                ..strokeCap = StrokeCap.round,
                            ),
                          );
                        });
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomPaint(
                        painter: CanvasPainter(drawingPoints),
                        // child: Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: MediaQuery.of(context).size.height,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    setState(() {
                      drawingPoints.clear();
                    });
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.layers_clear,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
