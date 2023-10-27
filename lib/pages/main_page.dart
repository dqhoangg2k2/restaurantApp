import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurantapp_flutter/pages/home_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/avt_app.png',
                  width: 133.0,
                  height: 20.0,
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/ic_search.svg',
                ),
                const SizedBox(
                  width: 18.0,
                ),
                SvgPicture.asset(
                  'assets/icons/icon_cup.svg',
                )
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(56),
        ),

        body: IndexedStack(
          index: currentIndex,
          children: [
            const Homepage(),

            Container(
              color: Colors.red,
            ),

            Container(
              color: Colors.yellow,
            ),

            Container(
              color: Colors.blue,
            ),

            Container(
              color: Colors.green,
            )
          ],
        ),
        bottomNavigationBar: BottomNavBarMallika1(
          select: currentIndex,
          onPressed: (p0) {
            setState(() {
              currentIndex = p0;
            });
          },
        ));
  }
}

class BottomNavBarMallika1 extends StatelessWidget {
  const BottomNavBarMallika1({Key? key, required this.onPressed, required this.select}) : super(key: key);

  final orangeColor = const Color(0xffFF8527);
  final Function(int)? onPressed;
  final int select;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: 'assets/icons/ic_home.svg',
                  selected: select == 0,
                  onPressed: () => onPressed?.call(0),),
              IconBottomBar(
                  text: "Map",
                  icon: 'assets/icons/ic_map_pin.svg',
                  selected: select == 1,
                  onPressed: () => onPressed?.call(1),),
              IconBottomBar2(
                  text: "Add",
                  icon: Icons.add_outlined,
                  selected: select == 2,
                  onPressed: () => onPressed?.call(2),),
              IconBottomBar(
                  text: "Cart",
                  icon: 'assets/icons/ic_bell.svg',
                  selected: select == 3,
                  onPressed: () => onPressed?.call(3),),
              IconBottomBar(
                  text: "Calendar",
                  icon: 'assets/icons/ic_user.svg',
                  selected: select == 4,
                  onPressed: () => onPressed?.call(4),)
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final String icon;
  final bool selected;
  final Function() onPressed;

  final orangeColor = const Color(0xffFF8527);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon,width: 20.0,height: 20.0,color: selected ? const Color(0xFF33495D) : Colors.black54,),
          Text(
            text,
            style:TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: selected ? const Color(0xFF33495D) : Colors.black54),
          ),
        ],
      ),
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  const IconBottomBar2(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final orangeColor = const Color(0xffFF8527);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: orangeColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
