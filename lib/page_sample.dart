import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_currentPage);
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {


                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=800",
                      fit: BoxFit.cover,
                      width: 700,),
                    ),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                var currentIndex = _pageController.page;
                                print(currentIndex);
                                _pageController.jumpTo(currentIndex! + 1);

                              },
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.red,
                                size: 40,
                              )),
                          InkWell(
                              onTap: () {
                                var currentIndex = _pageController.page;
                                print(currentIndex);
                                _pageController.jumpTo(currentIndex! - 1);


                              },
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 40,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  ],
                );
              },itemCount: 5,
            ),
          ),
        ],
      ),
    ));
  }
}
