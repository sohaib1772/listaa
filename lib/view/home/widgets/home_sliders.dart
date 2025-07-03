import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliders extends StatelessWidget {
  const HomeSliders({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    
                    width: 327.w,
                    height: 168.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(115),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan
                    ),
                    child: Container(),
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,

                  autoPlay: true,
                  viewportFraction: .8,
                  enableInfiniteScroll: true,
                  height: 168.h

                ),
              );
  }
}