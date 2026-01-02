import 'dart:async';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imagePaths;
  const ImageCarousel({super.key, required this.imagePaths});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController pageController;
  late Timer timer;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < widget.imagePaths.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return Image.asset(widget.imagePaths[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
