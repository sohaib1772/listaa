import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InfiniteBoxAnimation extends StatefulWidget {
  const InfiniteBoxAnimation({super.key});

  @override
  State<InfiniteBoxAnimation> createState() => _InfiniteBoxAnimationState();
}

class BoxItem {
  double dx;
  final int row;
  int imageId;

  BoxItem({
    required this.dx,
    required this.row,
    required this.imageId,
  });
}

class _InfiniteBoxAnimationState extends State<InfiniteBoxAnimation>
    with SingleTickerProviderStateMixin {
  final double boxSize = 82;
  final int columns = 5;
  final int rows = 6;
  final double gap = 15;
  final double speed = 20; // pixels per second

  late double screenWidth;
  late List<List<BoxItem>> boxes;
  late final Ticker _ticker;
  final random = Random();
  late Duration _lastElapsed;
  bool isBoxesInitialized = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeBoxes();
      _startTicker();
    });
  }

  void _initializeBoxes() {
    screenWidth = MediaQuery.of(context).size.width;
    int boxesPerRow = (screenWidth / (boxSize + gap)).ceil() + 2;

    boxes = List.generate(rows, (row) {
      bool isForward = row.isEven;
      return List.generate(boxesPerRow, (i) {
        double dx = isForward
            ? i * (boxSize + gap)
            : screenWidth - i * (boxSize + gap) - boxSize;
        return BoxItem(
          dx: dx,
          row: row,
          imageId: random.nextInt(21) + 1,
        );
      });
    });

    isBoxesInitialized = true;
    setState(() {});
  }

  void _startTicker() {
    _lastElapsed = Duration.zero;
    _ticker = createTicker((elapsed) {
      final dt = (elapsed - _lastElapsed).inMilliseconds / 1000;
      _lastElapsed = elapsed;

      if (!isBoxesInitialized) return;

      setState(() {
        for (int row = 0; row < rows; row++) {
          bool isForward = row.isEven;

          for (BoxItem box in boxes[row]) {
            box.dx += (isForward ? -1 : 1) * speed * dt;

            if (isForward && box.dx < -boxSize) {
              box.dx += (boxSize + gap) * boxes[row].length;
              _assignNewImage(box, row);
            } else if (!isForward && box.dx > screenWidth) {
              box.dx -= (boxSize + gap) * boxes[row].length;
              _assignNewImage(box, row);
            }
          }
        }
      });
    });

    _ticker.start();
  }

  void _assignNewImage(BoxItem box, int row) {
    int newImage;
    do {
      newImage = random.nextInt(21) + 1;
    } while (boxes[row].any((b) => b != box && b.imageId == newImage));
    box.imageId = newImage;
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  Widget _buildBox(BoxItem box) {
    return Positioned(
      left: box.dx,
      top: box.row * (boxSize + gap),
      child: Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          image: DecorationImage(
            scale: 1.5,
            image: AssetImage('assets/icons/${box.imageId}.png'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: Colors.orange)),

          // ✅ فقط إذا تم التهيئة
          if (isBoxesInitialized)
            ...boxes.expand((rowBoxes) => rowBoxes.map(_buildBox)),
        ],
      ),
    );
  }
}
