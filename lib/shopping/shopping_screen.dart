import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  //const Shop(key) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:Container(
                decoration: new BoxDecoration(
                    
                    color: Colors.grey,
                    borderRadius: new BorderRadius.circular(20.0
                    ),),
                
                height:40.00,
                //width:500.00,
                child:TextFormField(
                    
                    decoration: InputDecoration(
                      
                      contentPadding: const EdgeInsets.all(15.0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
              )
            ),),
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_rounded), iconSize: 30.0),
              //IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
              //IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
            ],

            ),
            drawer:Drawer(
              child: Container(
                color: Colors.white,
                
                child: ListView(
                children: [
                
                  
                  Container(height: 100, width: 100, child:Image(image: AssetImage("lib/assets/profile_default.png")),),
                  SizedBox(height: 50,),
                  Text("Hello"),
                  SizedBox(height: 50),
                  Text("Hi"),
                ],
              ),
            ),),
          body: Center(child: Container(child: Text("Enjoy shopping here")),)
          );
  }
}