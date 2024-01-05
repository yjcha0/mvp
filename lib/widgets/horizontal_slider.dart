import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Widget> getImageSlidersFrom(
    List imgList, List titleList, BuildContext context) {
  return imgList
      .map(
        (item) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LifeHacksDetail(
                          title: titleList.elementAt(imgList.indexOf(item)),
                          imagePath: item,
                        )));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(item,
                    fit: BoxFit.cover, width: 240.h, height: 320.h),
              ),
              const Spacer(),
              Text(
                titleList.elementAt(imgList.indexOf(item)),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      )
      .toList();
}

class HorizontalSlider extends StatelessWidget {
  final List imgList;
  final List titleList;
  final int duration;
  const HorizontalSlider(this.imgList, this.titleList,
      {super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: duration),
                viewportFraction: 0.6)
            .copyWith(height: 440.v),
        items: getImageSlidersFrom(imgList, titleList, context));
  }
}
