import 'package:flutter/material.dart';
import 'package:mountain_trips/buttons/responsive_button.dart';
import 'package:mountain_trips/texts/header_text.dart';
import 'package:mountain_trips/texts/sub_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome1.jpg',
    'welcome2.jpg',
    'welcome3.jpg',

  ];
  List largeText = [
    'Mountain Hikes',
    'Exotic Places',
    'Experience Nirvana'
  ];
  List smallText = [
    'Mountain hikes lets you unlock an incredible sense of freedom along with endurance test.',
    'Discover new places and learn the never before-seen beauty of mother nature',
    'Forget the daily routine. Allow yourself to absorb the positive energy and just relax!',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index){

        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/${images[index]}",
              ),
              fit: BoxFit.cover,
            )
          ),
          child: Container(

            margin: const EdgeInsets.only(top: 160, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Container(padding: const EdgeInsets.all(8.0), width: MediaQuery.of(context).size.width*0.5, color:Colors.white,child: LargeText(text: '${largeText[index]}' ),),
                  Container(padding: const EdgeInsets.all(8.0), width: MediaQuery.of(context).size.width*0.5, color:Colors.white, child: SubText(text: '${smallText[index]}' ),),
                  SizedBox(height: 40,),
                  ResponsiveButton(b_width: 120)

                ],
              ),
                Column(
                  children: List.generate(images.length, (indexDots) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index == indexDots ? 25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots ? Colors.yellow : Colors.green,
                      ),
                    );
                  } ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
