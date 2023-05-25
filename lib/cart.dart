import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymentgateway/home.dart';

import 'common/common.dart';
import 'home.dart';
import 'makePayment.dart';

class cart extends StatefulWidget {
  // String? totprod;
  // String cname,cimg,cqty,cprice;
  //
  //
  // cart({required this.totprod,required this.cname,required this.cimg,required this.cqty,required this.cprice});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {


  @override
  Widget build(BuildContext context) {
     var sum = cmctlstprice.reduce((value, current) => value + current);
    var tot=sum+99;

    return  Scaffold(
      appBar: AppBar  (
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Shoppig Bag",style: TextStyle(color: Colors.black,fontSize: 22),),

      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //one

            SizedBox(height: 20,),

            cmctlstname.isEmpty||cmctlstname.length==0?
                Center(child: Text("no data found")):

            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:cmctlstname.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cmctlstname.isEmpty||cmctlstname.length==0?
                    Center(child: Text("no data found")):
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12)
                      ),
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal:10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //image
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(cmctlstimg[index].toString())
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),

                            //Text
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.6,
                                  child: Row(
                                    children: [
                                      Text(cmctlstname[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Spacer(),
                                      InkWell(
                                          onTap: (){
                                            if(cmctlstname.length==1){
                                              cmctlstname.removeAt(index);
                                              cmctlstimg.removeAt(index);
                                              cmctlstprice.removeAt(index);
                                              cmctlstqty.removeAt(index);
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                                            }
                                            else{
                                              setState(() {
                                                cmctlstname.removeAt(index);
                                                cmctlstimg.removeAt(index);
                                                cmctlstprice.removeAt(index);
                                                cmctlstqty.removeAt(index);
                                              });
                                            }
                                          },
                                          child: Icon(Icons.clear,color: Colors.black,))
                                    ],
                                  ),
                                ),

                                Text("Size: 7.60 fl oz / 225ml",style: TextStyle(color: Colors.black45,fontSize: 18),),
                                SizedBox(height: 8,),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(cmctlstprice[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                      Spacer(),
                                      Text("Qty: ",style: TextStyle(fontSize: 15,color: Colors.black),),
                                      Text(cmctlstqty[index].toString(),style: TextStyle(fontSize: 18,color: Colors.black),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10,);
                },

                ),
              ),
            ),

            //Subtotal
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 5),
              child: Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Text("Subtotal",style: TextStyle(fontSize: 17,),),
                        Spacer(),
                        Text(sum.toString().toString(),style: TextStyle(fontSize: 20,)),
                        SizedBox(width: 5,),
                        Text("IND",style: TextStyle(color: Colors.black26,fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width*0.85,
                color: Colors.white,
              ),
            ),

            //Shipping
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Text("Shipping",style: TextStyle(fontSize: 17,),),
                        Spacer(),
                        Text("Rs. 99",style: TextStyle(fontSize: 20,)),
                        SizedBox(width: 5,),
                        Text("IND",style: TextStyle(color: Colors.black26,fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width*0.85,
                color: Colors.white,
              ),
            ),

            //Bag Total
            Center(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width*0.85,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text("Bag Total",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text(tot.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      SizedBox(width: 5,),
                      Text("IND",style: TextStyle(color: Colors.black26,fontSize: 15),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),


            //Proceed To Checkout
            Center(
              child: InkWell(
                onTap: (){

                  pmt=tot~/82.88;
                  print(pmt);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>makePayment()));
                },
                child: Container(
                  height: 55,
                  width: 330,
                  child: Center(child: Text("Proceed To Checkout",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black
                  ),
                ),
              ),
            )
          ],
        ),


      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 15),
    );
  }
}
