import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:plant_deseases_client/features/account/ui/account.dart';
import 'package:plant_deseases_client/features/chatbot/ui/chatbot.dart';
import 'package:plant_deseases_client/features/favorites/ui/favorites.dart';
import 'package:plant_deseases_client/features/plants/ui/plants.dart';

class Base extends StatefulWidget {
  const Base({super.key, this.title, this.signupData});
  final String? title;
  final SignupData? signupData;
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,

        body: Padding(
          padding: EdgeInsets.all(10),
          // height: MediaQuery.of(context).size.height - 200,
          child: PageView(
            // physics: constNeverScrollableScrollPhysics(),
            controller: _controller,
            children: const [PlantsView(), Favorites(), Chatbot(), Account()],
            onPageChanged: (value) => setState(() {
              _currentPage = value;
            }),
          ),
        ),
        extendBody: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 178, 140, 125),
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.photo_camera),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color: const Color.fromARGB(255, 64, 120, 27), // FIXME
          notchMargin: 8,

          shape: const CircularNotchedRectangle(),
          // exte
          // extendBody: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _currentPage == 0 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentPage = 0;
                    _controller.jumpToPage(_currentPage);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: _currentPage == 1 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentPage = 1;
                    _controller.jumpToPage(_currentPage);
                  });
                },
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: _currentPage == 2 ? Colors.white : Colors.black,
                ),
                isSelected: true,
                onPressed: () {
                  setState(() {
                    _currentPage = 2;
                    _controller.jumpToPage(_currentPage);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: _currentPage == 3 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentPage = 3;
                    _controller.jumpToPage(_currentPage);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
