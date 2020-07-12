import 'package:flutter/material.dart';
import './detailproduk.dart';

class ProdukList extends StatefulWidget {
  @override
  _ProdukListState createState() => _ProdukListState();
}

class _ProdukListState extends State<ProdukList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST PRODUK")
      ),

      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[

          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "ACER",
                  description: "Ini adalah laptop ACER",
                  // price: 1000,
                  image: "Acer.jpg",
                  star: 5,
                ),
              ));
            },

            child: ProductBox(
              name: "ACER",
              description: "Ini adalah laptop ACER",
              // price: 1000,
              image: "Acer.jpg",
              star: 5,
            ),
          ),
          
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "ASUS",
                  description: "Ini adalah laptop ASUS",
                  // price: 1000,
                  image: "Asus.jpg",
                  star: 1,
                ),
              ));
            },

            child: ProductBox(
              name: "ASUS",
              description: "Ini adalah laptop ASUS",
              // price: 1000,
              image: "Asus.jpg",
              star: 1,
            ),
          ),


          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "HP",
                  description: "Ini adalah laptop HP",
                  // price: 1000,
                  image: "Hp.jpg",
                  star: 1,
                ),
              ));
            },

            child: ProductBox(
              name: "HP",
              description: "Ini adalah laptop HP",
              // price: 1000,
              image: "Hp.jpg",
              star: 1,
            ),
          ),

          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "Lenovo",
                  description: "Ini adalah laptop Lenovo",
                  // price: 1000,
                  image: "Lenovo.jpg",
                  star: 1,
                ),
              ));
            },

            child: ProductBox(
              name: "Lenovo",
              description: "Ini adalah laptop Lenovo",
              // price: 1000,
              image: "Lenovo.jpg",
              star: 1,
            ),
          ),

          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "Macbook",
                  description: "Ini adalah laptop Macbook",
                  // price: 1000,
                  image: "Macbook.jpeg",
                  star: 1,
                ),
              ));
            },

            child: ProductBox(
              name: "Macbook",
              description: "Ini adalah laptop Macbook",
              // price: 1000,
              image: "Macbook.jpeg",
              star: 1,
            ),
          ),

          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "Samsung",
                  description: "Ini adalah laptop Samsung",
                  // price: 1000,
                  image: "Samsung.jpg",
                  star: 1,
                ),
              ));
            },

            child: ProductBox(
              name: "Samsung",
              description: "Ini adalah laptop Samsung",
              // price: 1000,
              image: "Samsung.jpg",
              star: 1,
            ),
          ),
        ],
      )
    );
  }
}

class ProductBox extends  StatelessWidget{
  ProductBox({Key key, this.name, this.description, this.price, this.image, this.star}): super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final int star;

  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/appimages/" + image, width: 50,),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text(
                      "Price: " + this.price.toString(),
                      style: TextStyle(color: Colors.red),
                    ),

                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.orange),
                          ],
                        )
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