import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardCompanyData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  CardCompanyData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class CardCompany extends StatelessWidget {
  const CardCompany({
    required this.data,
    Key? key,
  }) : super(key: key);

  final CardCompanyData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image(
                  image: data.image,
                  height: 220.h,
                ),
              ),
              const Spacer(flex: 1),
              Text(
                data.title.toUpperCase(),
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(flex: 10)
            ],
          ),
        ),
      ],
    );
  }
}
