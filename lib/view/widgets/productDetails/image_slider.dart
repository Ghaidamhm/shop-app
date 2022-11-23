import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ushop_app/logic/controllers/cart_controller.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/productDetails/color_picker.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;
  ImageSlider({required this.imageUrl, super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  final cartcontroller = Get.find<CartController>();

  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          itemBuilder: ((context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          }),
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? mainColor : mainColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (() {
                      setState(() {
                        currentColor = index;
                      });
                    }),
                    child: ColorPicker(
                      outerBorder: currentColor == index,
                      color: colorSelected[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 3,
                    ),
                itemCount: colorSelected.length),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? mainColor.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                // Obx(()=> Badge(
                //   position: BadgePosition.topEnd(top: -10, end: -10),
                //   animationDuration: Duration(milliseconds: 300),
                //   animationType: BadgeAnimationType.slide,
                //   badgeContent: Text(
                //     cartcontroller.quantity().toString(),
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   child: InkWell(
                //     onTap: () {
                //       Get.toNamed(Routes.cartScreen);
                //     },
                //     child: Container(
                //       padding: EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //         color: Get.isDarkMode
                //             ? mainColor.withOpacity(0.8)
                //             : mainColor.withOpacity(0.8),
                //         shape: BoxShape.circle,
                //       ),
                //       child: Icon(
                //         Icons.shopping_cart,
                //         color: Get.isDarkMode ? Colors.black : Colors.white,
                //         size: 20,
                //       ),
                //     ),
                //   ),
                // ),)
              ],
            ))
      ],
    );
  }
}
