import 'package:farm_furniture_factory/home/domain/home_controller.dart';
import 'package:farm_furniture_factory/main/main_page.dart';
import 'package:farm_furniture_factory/utils/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    print("called  =>>>> ${ResponsiveWidget.isSmallScreen(context)}");
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Dashboard()));
                },
                child: const Text(
                  "Furniture",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        controller.tabBarItem.asMap().entries.map((entry) {
                      int idx = entry.key;
                      String text = entry.value;
                      int currentIndex = controller.tabBarCurrentIndex.value;
                      return GestureDetector(
                        onTap: () => controller.onTabBarItemTapped(idx),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                text,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: currentIndex == idx
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )),
              const Text('Lorem'),
            ],
          ),
        ),
        body: ResponsiveWidget(
          largeScreen: SingleChildScrollView(
            child: SizedBox(
              height: screenSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: screenSize.height / 2.4,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          controller.updateIndex(index);
                        },
                      ),
                      items: controller.imgList
                          .map((item) => Center(
                              child: Image.network(item,
                                  fit: BoxFit.cover, width: double.infinity)))
                          .toList(),
                    ),
                    Positioned(
                      bottom: 30.0,
                      left: 0.0,
                      right: 0.0,
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.imgList.map((url) {
                              int index = controller.imgList.indexOf(url);
                              int currentIndex = controller.currentIndex.value;
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == index
                                        ? Colors.blue
                                        : Colors.white),
                              );
                            }).toList(),
                          )),
                    ),
                  ]),
                  SizedBox(
                    height: screenSize.height / 15,
                  ),
                  const Text("Recommended for you",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800))
                      .paddingOnly(left: 18),
                  SizedBox(
                    height: screenSize.height / 30,
                  ),
                  SizedBox(
                    height: screenSize.height * .44,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.height * .012,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://media.istockphoto.com/id/1415799772/photo/home-interior-with-vintage-furniture.jpg?s=1024x1024&w=is&k=20&c=n0h3Vpk-pLM7PK_kUu5WxoO4zRUTf6OMZV1dYv9CyRA=',
                                  fit: BoxFit.cover,
                                  width: screenSize.width / 5,
                                ),
                                const Text('Arm Chair'),
                                const Row(
                                  children: [
                                    Text('12'),
                                    Icon(
                                      Icons.add,
                                      size: 12,
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          smallScreen: Container(),
        ));
  }
}
