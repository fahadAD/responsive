import 'package:flutter/material.dart';
class Favourite extends StatefulWidget {
   final String name;
   final String id;
  final String details;


  const Favourite({Key? key, required this.name, required this.id, required this.details}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<String> sizeList=[
    "45","75","20","43","25","55","33","32",
  ];
  int? sizeindext;
   List <Widget> imageList=[

   ];
   int? selected;

    String? firstHalf;
    String? secondHalf;

  bool flag = true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.details.length > 50) {
      firstHalf = widget.details.substring(0, 50);
      secondHalf = widget.details.substring(50, widget.details.length);
    } else {
      firstHalf = widget.details;
      secondHalf = "";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
            Navigator.pop(context);
        },icon: Icon(Icons.arrow_back)),
        title: Text("hello"),
        actions: [ IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [


             Stack(
               alignment: AlignmentDirectional.bottomCenter,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SizedBox(
                     height: 220,
                     width: 400,
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/img.jpg",
                      fit: BoxFit.fill,),
            ),
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CircleAvatar(
                     backgroundColor: Colors.black,
                     radius: 20,
                     child: Row(
                       children: [
                         IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left,color: Colors.white,)),
                         IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right,color: Colors.white,)),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
            Container(
              width: 400,
               decoration: BoxDecoration(
                 borderRadius:BorderRadius.circular(20) ,
                 color: Colors.green,

               ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      SizedBox(width:5,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.star,color: Colors.amberAccent,size: 24,)),
                      SizedBox(width:10,),
                      Text("5.0",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      SizedBox(width:5,),
                      Text("(1200 Reviews)",style: TextStyle(color: Colors.grey,),)
                    ],),
                  ),


                  secondHalf!.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(firstHalf!),
                      )
                      : new Column(
                    children: <Widget>[
                      new Text(flag ? (firstHalf! + "...") : (firstHalf! + secondHalf!)),
                      new InkWell(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Text(
                              flag ? "show more" : "show less",
                              style: new TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ],
                  ),








                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Selected Colours :",style: TextStyle(color: Colors.black,fontSize: 20),),
            ),
            ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              primary: false,
              shrinkWrap: true,

              itemBuilder: (BuildContext context, int index) {

               return GestureDetector(
                 onTap: (){
                 setState(() {
                   selected=index;
                 });
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                         color: selected==index?Colors.green:Colors.blue
                     ),
                     child: Image.asset("assets/img.jpg",
                         fit: BoxFit.fill),
                   ),
                 ),
               );
            },),

ListView.builder(
  primary: false,
  shrinkWrap: true,
  scrollDirection: Axis.horizontal,
  itemCount: sizeList.length,
  itemBuilder: (BuildContext context, int index) {

return GestureDetector(
  onTap: (){
    setState(() {
       sizeindext=index;
      });
  },
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Text(sizeList[index],style: TextStyle(fontSize: 20,color: sizeindext==index?Colors.red:Colors.blueAccent,fontWeight: FontWeight.bold),),
  ),
);
},),
           ],
        ),
      ),
    );
  }
}
