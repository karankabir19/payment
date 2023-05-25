import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'common/common.dart';
import 'home.dart';

class wishlist extends StatefulWidget {
  const wishlist({Key? key}) : super(key: key);

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar  (
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Shoppig Bag",style: TextStyle(color: Colors.black,fontSize: 22),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            wlsttname.length==0?Container():
            Center(
              child: Container(

                width: MediaQuery.of(context).size.width*0.9,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:wlsttname.length,
                  itemBuilder: (BuildContext context, int index) {
                    return wlsttname.isEmpty||wlsttname.length==0?
                    Center(child: Text("no data found")):
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12)
                      ),
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8,horizontal:10 ),
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
                                      image: NetworkImage(wlstimg[index].toString())
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
                                      Text(wlsttname[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Spacer(),
                                      InkWell(
                                          onTap: (){
                                            if(wlsttname.length==1){
                                              setState(() {
                                                wlsttname.removeAt(index);
                                                wlstimg.removeAt(index);
                                                wlstprice.removeAt(index);
                                              });
                                            }
                                            else{
                                              setState(() {
                                                wlsttname.removeAt(index);
                                                wlstimg.removeAt(index);
                                                wlstprice.removeAt(index);
                                              });
                                            }
                                            Fluttertoast.showToast(msg: "Removed from the Wislist");
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                                          },
                                          child: Icon(Icons.favorite,color: Colors.red,))
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
                                      Text(wlstprice[index].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
            SizedBox(height: 10,),
            wlsttname2.length==0?Container():
            Center(
              child: Container(

                width: MediaQuery.of(context).size.width*0.9,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:wlsttname2.length,
                  itemBuilder: (BuildContext context, int indexs) {
                    return wlsttname2.isEmpty||wlsttname2.length==0?
                    Center(child: Text("no data found")):
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12)
                      ),
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal:10 ),
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
                                      image: NetworkImage(wlstimg2[indexs].toString())
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
                                      Text(wlsttname2[indexs].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Spacer(),
                                      InkWell(
                                          onTap: (){
                                            if(wlsttname2.length==1){
                                              setState(() {
                                                wlsttname2.removeAt(indexs);
                                                wlstimg2.removeAt(indexs);
                                                wlstprice2.removeAt(indexs);
                                              });
                                            }
                                            else{
                                              setState(() {
                                                wlsttname2.removeAt(indexs);
                                                wlstimg2.removeAt(indexs);
                                                wlstprice2.removeAt(indexs);
                                              });
                                            }
                                            Fluttertoast.showToast(msg: "Removed from the Wislist");
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                                          },
                                          child: Icon(Icons.favorite,color: Colors.red,))
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
                                      Text(wlstprice2[indexs].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int indexs) {
                  return SizedBox(height: 10,);
                },

                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
