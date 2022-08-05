import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Color(0xfff1f1f1),
        gradient: RadialGradient(
          colors: [
            Color(0xfff1f1f1),
            Color(0xffebebeb),
          ],
        ),
      ),
      // child: Stack(
      //   children: [
      //     // Positioned(
      //     //   bottom: 0,
      //     //   left: 0,
      //     //   child: AnimatedComponent.ring(),
      //     // )
      //   ],
      // ),
    );
  }
}
