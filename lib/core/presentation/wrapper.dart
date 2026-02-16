import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/backgroundImage.webp",
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent),
          // bottomSheet: BottomSheet(
          //   onClosing: () {},
          //   builder: (context) {
          //     return Container();
          //   },
          // ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: Image.asset('assets/images/House.webp')),


              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 15
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF262C51), Color(0xFF3E3F74)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();

    // شروع از پایین چپ
    path.moveTo(0, size.height);

    // بالا رفتن سمت چپ
    path.cubicTo(
      size.width * 0.20,
      size.height * 0.9, // کنترل 1
      size.width * 0.1,
      size.height * 0.1, // کنترل 2
      size.width * 0.4,
      size.height * 0, // نقطه بالا چپ
    );

    // قسمت تقریباً صاف بالای تپه
    path.cubicTo(size.width * 0.4, 0, size.width * 0.6, 0, size.width * 0.6, 0);

    // پایین رفتن سمت راست
    path.cubicTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width * 0.8,
      size.height * 0.9,
      size.width,
      size.height,
    );

    // بستن شکل
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
