import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff131b26),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Flexible(
                    flex: 3,
                  child: Container (
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          const SizedBox(
                            height: 35.0,
                          ),
                          Row(
                            children: <Widget> [
                              const Expanded(
                                child: Text(
                                  'Learn 5 New Words',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 31,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                  )
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            '5 from this week',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 21,
                            ),
                          ),
                          const SizedBox(
                            height: 11.0,
                          ),
                          const Text(
                            '5 from 7 this week',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 21,
                            ),
                          ),
                          const SizedBox(
                            height: 11.0,
                          ),
                          const LinearProgressIndicator(
                            value: 0.71,
                            backgroundColor: Color(0xff1c231d),
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xff701bff),
                            ),
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          const Text(
                            'Strength',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,,
                          ),
                          const Row(
                            children: <Widget> [
                              Expanded(
                                  child: Text(
                                    '75%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 31
                                    ),
                                  )
                              ),
                              CircularProgressIndicator(
                                value: .73,
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation(
                                    Color(0xff701bff),
                                  ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 35
                          ),
                          Container(
                            color: Colors.grey,
                            height: 1.0,,
                          ),
                          const SizedBox(
                            height: 35
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  3,
                                  (f) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget> [
                                          Text(
                                            f == 0 ? 'Repeat' : f == 1? 'Streak' : 'Best',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            f == 0 ? 'Everyday' : f == 1? '8 Days' : '11 Days',
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                            ),
                                          )
                                        ],
                                    );
                                  }
                              ),
                          )
                        ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                    child:  Transform.rotate(
                        angle: 3.14,
                      child: CustomPaint(
                        child: MyBezieCurve(),
                        painter: CurvePath(),
                      ),
                    )
                )

              ],
          ),
        )
    );
    throw UnimplementedError();
  }
}

class CurvePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = const Color(0xff701dff);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    var path = Path();

    path.moveTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.8,
      size.width * 0.15, size.height * 0.60
    );
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45, size.width * 0.27, size.height * 0.60);
    path.quadraticBezierTo( size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45, size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo( size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    
    path.moveTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyBezieCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippingClass(),
      child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff221b4c),
          Color(0xff151b2b),
        ]
      )
      )
      )
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);

    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  
}