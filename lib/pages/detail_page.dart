import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_trips/buttons/responsive_button.dart';
import 'package:mountain_trips/buttons/reusable_button.dart';
import 'package:mountain_trips/cubit/app_cubit.dart';
import 'package:mountain_trips/texts/large_text.dart';
import 'package:mountain_trips/texts/sub_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
       
      builder: (context, state) {
        DetailState detail = state as DetailState;
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
                    decoration:  BoxDecoration(
                      image: DecorationImage(image: NetworkImage('http://mark.bslmeiyu.com/uploads/' + detail.place.img),
                      fit: BoxFit.cover),
                    ),
                  )),
                   Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        BlocProvider.of<AppCubit>(context).goHome();
                      }, icon: Icon(Icons.menu, color: Colors.white)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeText(text: detail.place.name, color: Colors.black54,),
                            LargeText(text: '\$' + detail.place.price.toString(), color: Colors.black45,),
                          ],
                        ),
                        const SizedBox(height: 10,),
    
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.black45,),
                            const SizedBox(width: 5,),
                            SubText(text: detail.place.location, color: Colors.black45,),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Wrap(
                          children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber,)),
                        ),
                        const SizedBox(width: 5,),
                        SubText(text: detail.place.people.toString(), color: Colors.black45,)
                          ],
                        ),
                       const SizedBox(
                          height: 20,
                        ),
                        LargeText(text: 'People', color: Colors.black.withOpacity(0.8), size: 20,),
                        const SizedBox(height: 5,),
                        SubText(text: 'Number of people in your group', color: Colors.black54,),
                        const SizedBox(height: 5,),
                        Wrap(
                          children: List.generate(5, (index) =>
                          InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            } ,
                            child: ReusableButton(size: 60, color: selectedIndex == index ? Colors.white: Colors.black, backgroundcolor: selectedIndex == index ? Colors.black : Colors.grey.shade200, borderColor: selectedIndex == index ? Colors.black : Colors.grey.shade200, isIcon: false, text: '${index+1}' ,))
                           ),
                        ),
                        const SizedBox(height: 20,),
                        const LargeText(text: 'Description', color: Colors.black38,),
                        SubText(text: detail.place.description, color: Colors.black45,)
    
                      ],
                    ),
                  ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    right: 20,
                    child: Row(
                      children: [
                        ReusableButton(size: 60, color: Colors.blue.shade400, backgroundcolor: Colors.white, borderColor: Colors.blueGrey, isIcon: true, icon: Icons.favorite_border, ),
                        const SizedBox(width: 10,),
                        ResponsiveButton(isResponsive: true,),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}