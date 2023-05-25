import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paymentgateway/profile.dart';
import 'package:paymentgateway/wishlist.dart';

import 'beauty2.dart';
import 'cart.dart';
import 'common/common.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  List name1=[
    "Facial Cleanser",
    "Cream Cleanser",
  ];
  List img1=[
    "https://ntg-catalog.imgix.net/products/6806090_nocolor_0.jpg?w=1200&h=1443&sfrm=jpg&fit=crop     ",
    "https://m.media-amazon.com/images/I/71fMSVZathL._SL1500_.jpg"
  ];
  List price1=<int>[
    999,
    800
  ];

  List price2=<int>[
    500,
    1200,
    1500
  ];
  List img2=[
    "https://m.media-amazon.com/images/I/515lN5ajIvL._SX425_.jpg",
    "https://cdn.shopify.com/s/files/1/0411/8478/8637/products/sukin-super-green-cleansing-oil_1_727x.jpg?v=1622722085",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFEBe70HBGbeq5UYxQUhoYQhAAvCbgwHfnfFcu5MAR5_CFCpI5pM2VVeP6XvYRvE8IutA&usqp=CAU"
  ];
  List name2=[
    "Cleansing Oil",
    "Alovera Cleanser",
    "Patanjali Cleanser"
  ];

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading:Padding(
            padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
              },
              child: Container(
                height: 80,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzN-u1Pz_3ZC-gXL6BhE9_yoEOqqRMqdLPjg&usqp=CAU'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          ) ,
          title: Center(
            child: Text("Shopping",
              style: TextStyle(color: Colors.black,fontSize: 22),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
              child: InkWell(
                onTap: (){
                  if(wlsttname.length==0 && wlsttname2.length==0){
                    Fluttertoast.showToast(msg: "Add products to see the Whislist");
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>wishlist()));
                  }

                },
                child: wlsttname.length==0 && wlsttname2.length==0?Icon(Icons.favorite_border,color: Colors.black,):
                Icon(Icons.favorite,color: Colors.red,)
              ),
            )
          ],
        ),

        body: Container(

          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:  Column(
              children: [
                //search
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:  MediaQuery.of(context).size.width*0.7,
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Icon(Icons.search,color: Colors.black,size: 30),
                                ),
                                hintText: "Cleansers",
                                hintStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.white30
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            if(cmctlstname.length==0){
                              Fluttertoast.showToast(msg: "Add products to see the Cart");
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),

                            width: 55,
                            child:  Padding(
                              padding: const EdgeInsets.all(15),
                              child: Icon(Icons.shopping_cart,color: Colors.black,size: 30),
                            )
                          ),
                        )
                      ],
                    ),
                  ),

                ),
                SizedBox(height: 30,),
                //found
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            //Text
                            Container(
                              child: Text("Found \n10 Results",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            ),

                            //1st COLUMN
                            Container(
                              width: MediaQuery.of(context).size.width*0.43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 2,
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(height: 20,);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Mybeauty2(rname: name1[index].toString(), rprice: price1[index], rimg: img1[index].toString(),)));},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.43,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Container(
                                              height: 150,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(img1[index].toString())
                                                  )
                                              ),
                                            ),
                                          ),
                                         Container(
                                           width:  MediaQuery.of(context).size.width*0.4,
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(name1[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                               Text('Citrus refreshes senses',style: TextStyle(fontSize: 11),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     Text(price1[index].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                     SizedBox(width: 28,),
                                                     InkWell(
                                                       onTap: (){
                                                         if( wlsttname.contains(name1[index].toString())){
                                                           print("REMOVED");
                                                           setState(() {
                                                             wlsttname.remove(name1[index].toString());
                                                             wlstimg.remove(img1[index].toString());
                                                             wlstprice.remove(price1[index].toString());
                                                             Fluttertoast.showToast(msg: "Removed from the Wislist");
                                                           });
                                                         }
                                                         else{
                                                           setState(() {
                                                             wlsttname.add(name1[index].toString());
                                                             wlstimg.add(img1[index].toString());
                                                             wlstprice.add(price1[index].toString());
                                                             Fluttertoast.showToast(msg: "Added to the Wislist");
                                                           });
                                                         }
                                                       },
                                                       child: wlsttname.contains(name1[index].toString())?Center(child: Icon(Icons.favorite,color:Colors.red,size: 25,))
                                                           :
                                                       Center(child: Icon(Icons.favorite_border,color:Colors.black,size: 25,))
                                                     ),

                                                   ],
                                                 ),
                                               )
                                             ],
                                           ),
                                         )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),


                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            separatorBuilder: (BuildContext context, int indexs) {
                              return SizedBox(height: 20,);
                            },
                            itemBuilder: (BuildContext context, int indexs) {
                              return InkWell(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Mybeauty2(rname: name2[indexs].toString(), rprice: price2[indexs], rimg: img2[indexs].toString(),)));},
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.43,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(img2[indexs].toString())
                                              )
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:  MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(name2[indexs].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                            Text('Citrus refreshes senses',style: TextStyle(fontSize: 11),),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(price2[indexs].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                  SizedBox(width: 28,),
                                                  InkWell(
                                                    onTap: (){
                                                      if(wlsttname2.contains(name2[indexs].toString())){
                                                        print("REMOVED");
                                                        setState(() {
                                                          wlsttname2.remove(name2[indexs].toString());
                                                          wlstimg2.remove(img2[indexs].toString());
                                                          wlstprice2.remove(price2[indexs].toString());
                                                          Fluttertoast.showToast(msg: "Removed from the Wislist");
                                                        });

                                                      }
                                                      else{
                                                        setState(() {
                                                          wlsttname2.add(name2[indexs].toString());
                                                          wlstimg2.add(img2[indexs].toString());
                                                          wlstprice2.add(price2[indexs].toString());
                                                          Fluttertoast.showToast(msg: "Added to the Wislist");
                                                        });
                                                      }
                                                    },
                                                    child: wlsttname2.contains(name2[indexs].toString())?Center(child: Icon(Icons.favorite,color:Colors.red,size: 25,))
                                                        :
                                                    Center(child: Icon(Icons.favorite_border,color:Colors.black,size: 25,))
                                                  ),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),


                      ],
                    ),
                  ),
                ),


              ],
            ),

          ),

        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 15),
      ),
    );
  }
}
