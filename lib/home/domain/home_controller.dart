import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> imgList = [
    'https://media.istockphoto.com/id/1415799772/photo/home-interior-with-vintage-furniture.jpg?s=1024x1024&w=is&k=20&c=n0h3Vpk-pLM7PK_kUu5WxoO4zRUTf6OMZV1dYv9CyRA=',
    'https://media.istockphoto.com/id/1803077664/photo/retro-living-room.jpg?s=1024x1024&w=is&k=20&c=ZrCX3VzgtybRWnJMv0Fl1pTptK-4R-jmV7yDkCW_G_E=',
    'https://media.istockphoto.com/id/1763364365/photo/second-hand-furniture.jpg?s=1024x1024&w=is&k=20&c=8HPPBsxl5a420tVa9_uqJsVTQtAP2PAmI_HDsUv14SE=',
    'https://media.istockphoto.com/id/1803077664/photo/retro-living-room.jpg?s=1024x1024&w=is&k=20&c=ZrCX3VzgtybRWnJMv0Fl1pTptK-4R-jmV7yDkCW_G_E=',
  ];

  RxInt currentIndex = 0.obs;
  RxInt tabBarCurrentIndex = 0.obs;

  final List<String> tabBarItem = ['Home', 'Shop', 'About', 'Best Deals'];

  void onTabBarItemTapped(int index) {
    tabBarCurrentIndex.value = index;
  }

  updateIndex(int index) {
    currentIndex.value = index;
  }
}
