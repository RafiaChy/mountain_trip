import 'package:flutter/material.dart';
import 'package:mountain_trips/texts/large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
           
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/travelling.jpg'),
                  fit: BoxFit.cover),
                ),
              )),
               Positioned(
              left: 20,
              top: 50,
              child: Row(
                children:const [
                  IconButton(onPressed: null, icon: Icon(Icons.menu, color: Colors.white)),
                ],
              )
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LargeText(text: 'Yosemite', color: Colors.black54,),
                        LargeText(text: '\$1000', color: Colors.black45,),
                      ],
                    )
                  ],
                ),
              ),
              )
          ],
        ),
      ),
    );
  }
}