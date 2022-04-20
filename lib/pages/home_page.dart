import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mountain_trips/texts/header_text.dart';
import 'package:mountain_trips/texts/sub_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
 var images =  {
   'ballooning' : 'ballooning.jpg',
    'hiking' : 'hiking.jpg',
    'kayaking' : 'kayaking.jpg',
    'snorkeling' : 'snorkeling.jpg',
 };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(

              children:  [

             const Icon(Icons.menu, size: 30, color: Colors.black54,),
                Expanded(child: Container()),
                Container(width: 50, height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),),

              ],
            ),
          ),
         const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const LargeText(text: 'Discover'),),
          const SizedBox(height: 30,),
          //tab_bar
      Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          labelPadding: const EdgeInsets.only(left: 20, right: 20),
          controller: tabController,
         labelColor: Colors.black,
         unselectedLabelColor: Colors.grey,
         isScrollable: true,
         indicatorSize: TabBarIndicatorSize.label,
         indicator: CircularTabIndicator(color: Colors.grey, radius: 4),
         tabs: const [
            Tab(text: 'Places',),
            Tab(text: 'Inspiration',),
            Tab(text: 'Emotions',),

            ],
          ),
      ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
                children:  [

              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return
                    Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: const DecorationImage(
                  image: AssetImage('images/intro1.jpg'),
                  fit: BoxFit.cover,
                  ),

                  ),);

                },
              ),
              Text('There'),
              Text('Bye'),
            ]),
          ),
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
              const LargeText(text: 'Explore more', size: 22,),
              SubText(text: 'See all', color: Colors.blue,),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                 
                  children: [
                    Expanded(
                      child: Container(
                     //   margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image:  DecorationImage(
                            image: AssetImage('images/' + images.keys.elementAt(index)),
                            fit: BoxFit.cover,
                          ),
                    
                        ),),
                    ),
                   
                   Container(child: SubText(text: images.values.elementAt(index), color: Colors.black,))
                    
                  ],
                ),
              );
            },),
          ),

        ],
      ),
    );
  }
}

class CircularTabIndicator extends Decoration{
  final Color color;
  final double radius;

  CircularTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
   return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset((configuration.size!.width)/2 - (radius/2), configuration.size!.height - radius);
    canvas.drawCircle((offset + circleOffset), radius, _paint);
  }
  
}