import 'dart:async';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:fahadflutter/maim2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex=0;
Timer? timer;
  PageController pageController=PageController(
    initialPage: 0
  );

  @override
  void initState() {
   timer=Timer.periodic(Duration(seconds: 3), (timer) {
     if(pageIndex<=4){
       pageIndex++;
     }else{
       pageIndex=0;

     }
     pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);

   });
    super.initState();
  }

  @override
  void dispose() {
pageController.dispose();
timer=null;
super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    List<Widget> demo=[
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Image.asset("assets/images1.jpg",
              fit: BoxFit.fill,
              height: 205,
              width: 400,
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Image.asset("assets/images1.jpg",
              fit: BoxFit.fill,
              height: 205,
              width: 400,
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Image.asset("assets/images1.jpg",
              fit: BoxFit.fill,
              height: 205,
              width: 400,
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Image.asset("assets/images1.jpg",
              fit: BoxFit.fill,
              height: 205,
              width: 400,
            ),
          ),
        ),
      ),
    ];
     return Scaffold(
      appBar:  AppBar(
        title: Text("Application"),

        actions: [ IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),],
      ),

      body: Column(
        children: [


          GestureDetector(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Favourite(name: 'github T shirt per day', id: '2', details: 'Tittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etcTittle:    I will do any virtual assistant services 24 Hours,  online/offline data entry and data collection,copy/paste  jobI will do any type of file conversion like PDF to excel or word etc',),));
            },
            child: Stack(
              alignment:  AlignmentDirectional.topCenter,
              children: [
                Container(
                  height: 205,
                  width: 400,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,

                    children: demo,

                    onPageChanged: (index){
                      setState(() {
                        pageIndex=index;
                      });
                    },
                  ),
                ),
                CarouselIndicator(
                  activeColor: Colors.red,
                  color: Colors.green,
                  count: demo.length,
                  index: pageIndex,
                ),

              ],
            ),
          ),






        ],
      ),
    );
  }
}
