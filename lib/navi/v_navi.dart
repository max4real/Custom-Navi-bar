import 'package:custom_animated_bottom_navi/navi/c_navi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NaviPage extends StatelessWidget {
  const NaviPage({super.key});

  @override
  Widget build(BuildContext context) {
    NaviController controller = Get.put(NaviController());

    double itemWidth = 70;
    Color primary = const Color(0XFFCAF477);
    Color background = const Color(0xFF1E1E1E);
    Color background2 = const Color(0xFF282828);

    return Scaffold(
      body: Center(
        child: Container(
          // width: 300,
          height: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ValueListenableBuilder(
            valueListenable: controller.index,
            builder: (context, index, child) {
              double position = 0;
              position = index * itemWidth;
              return Stack(
                children: [
                  Animated_Positioned(
                    position: position,
                    index: index,
                    child: Container(
                      width: itemWidth,
                      height: 45,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: itemWidth,
                        child: IconButton(
                          onPressed: () {
                            controller.index.value = 0;
                          },
                          icon: Icon(
                            Icons.home,
                            color: index == 0 ? background2 : Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: itemWidth,
                        child: IconButton(
                          onPressed: () {
                            controller.index.value = 1;
                          },
                          icon: Icon(
                            Icons.notification_add,
                            color: index == 1 ? background2 : Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: itemWidth,
                        child: IconButton(
                          onPressed: () {
                            controller.index.value = 2;
                          },
                          icon: Icon(
                            Icons.mail,
                            color: index == 2 ? background2 : Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: itemWidth,
                        child: IconButton(
                          onPressed: () {
                            controller.index.value = 3;
                          },
                          icon: Icon(
                            Icons.settings,
                            color: index == 3 ? background2 : Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget Animated_Positioned({
    required double position,
    required int index,
    required Widget child,
  }) {
    return AnimatedPositioned(
      top: 2,
      left: position,
      duration: const Duration(milliseconds: 200),
      child: child,
    );
  }
}
