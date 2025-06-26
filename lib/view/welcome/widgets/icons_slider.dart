import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsSlider extends StatefulWidget {
   IconsSlider({super.key,this.reverse = false});
  bool reverse;
  @override
  State<IconsSlider> createState() => _IconsSliderState();
}

class _IconsSliderState extends State<IconsSlider> {
  late final Duration _randomAutoPlayInterval;
  late final Duration _randomAnimationDuration;

  @override
  void initState() {
    super.initState();

    final random = Random();

    // مدة التوقف قبل التحرك: 1 إلى 5 ثوانٍ
    _randomAutoPlayInterval = Duration(milliseconds: 300);

    // مدة التحرك نفسه: 300 إلى 1500 ميلي ثانية
    _randomAnimationDuration = Duration(
     seconds: 3
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return Container(
            alignment: Alignment.center,
            width: 82.w,
            height: 82.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Image.asset("assets/icons/${Random().nextInt(21) + 1}.png",scale: 1.5,),
          );
        },
        options: CarouselOptions(
          reverse: widget.reverse,
          height: 82.0,
          autoPlay: true,
          autoPlayCurve: Curves.slowMiddle,
          autoPlayInterval: _randomAutoPlayInterval,
          autoPlayAnimationDuration: _randomAnimationDuration,
          enlargeCenterPage: false,
          
          enableInfiniteScroll: true,
          viewportFraction: 0.28,
          pauseAutoPlayOnTouch: false,
          pauseAutoPlayOnManualNavigate: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
