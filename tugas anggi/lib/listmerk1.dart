import 'package:flutter/material.dart';
import './detailproduk.dart';


// ================================= LIST MERK =================================
class ListMerk extends StatefulWidget {
  @override
  _ListMerkState createState() => _ListMerkState();
}

class _ListMerkState extends State<ListMerk> {

  List<Container> daftarmerkmobil = new List();

  var merk=[
    {"merk":"MERCEDES BENZ",  "logo":"Mercedes-Benz.png"},
    {"merk":"BMW",            "logo":"BMW.jpg"},
    {"merk":"AUDI",           "logo":"Audi.png"},
    {"merk":"HONDA",          "logo":"Honda.jpg"},
    {"merk":"TOYOTA",         "logo":"Toyota.jpg"},
    {"merk":"MAZDA",          "logo":"Mazda.jpg"},
    {"merk":"FORD",           "logo":"Ford.png"},
    {"merk":"NISSAN",         "logo":"Nissan.jpg"},
    {"merk":"MITSUBISHI",     "logo":"Mitsubishi.png"},
    {"merk":"SUZUKI",         "logo":"Suzuki.png"},
    {"merk":"WULING",         "logo":"Wuling.png"}
  ];

  _buatlist()async{
    for (var i = 0; i < merk.length; i++) {
      final merkmobil = merk[i];
      final String logo = merkmobil["logo"];

      daftarmerkmobil.add(
        new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Hero(
                  tag: merkmobil["merk"],
                  child: new Material(
                    child: new InkWell(
                      onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=> new ListProduk(merk: merkmobil["merk"], logo: logo,),
                      )),
                      child: new Image.asset("assets/logo/$logo", fit: BoxFit.fitWidth,),
                    ),
                  ),
                ),

                
                new Text(merkmobil["merk"], style: new TextStyle(fontSize: 15.0),)
              ],
            )
          )
        )
      );
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST MERK")
      ),

      resizeToAvoidBottomPadding: false,
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarmerkmobil,

      ),
    );
  }
}
// ================================= END LIST MERK =================================


class ListProduk extends StatelessWidget {
  ListProduk({this.merk,this.logo});

  final String merk;
  final String logo;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 500.0,
            child: new Hero(
              tag: merk, 
              child: new Material(
                child: new InkWell(
                  // child: new Image.asset("assets/logo/$logo"),
                  child: new ListCar(merk: merk, logo: logo,),
                )
              )
            ),
          ),
          
          // new ListCar(merk: merk, logo: logo,),
        ],
      )
    );
  }
}


// ================================= LIST MOBIL =================================
class ListCar extends StatefulWidget {
  ListCar({this.merk,this.logo});
  final String merk;
  final String logo;

  @override
  _ListCarState createState() => _ListCarState();
}

class _ListCarState extends State<ListCar> {

  List<Container> daftarmobil = new List();

  var cars=[
    {"merknya":"MERCEDES BENZ","nama":"Mercedes Benz CLS-Class", "gambar":"Mercedes Benz CLS-Class.jpg", "price":""},
    {"merknya":"MERCEDES BENZ","nama":"Mercedes Benz A-Class", "gambar":"Mercedes Benz A-Class.jpg", "price":""},

    {"merknya":"BMW","nama":"BMW 7 Series Sedan", "gambar":"BMW 7 Series Sedan.jpg", "price":"Rp. 2,61 M"},
    {"merknya":"BMW","nama":"BMW M5", "gambar":"BMW M5.jpg", "price":"Rp. 3,76 M"},

    {"merknya":"AUDI","nama":"", "gambar":"", "price":"Rp. 8,5 M"},
    {"merknya":"AUDI","nama":"", "gambar":"", "price":"Rp. 1,9 M"},
  ];

  var bmw=[

  ];

  _buatlistmobil()async {
    for (var i = 0; i < cars.length; i++) {
      final thecars = cars[i];
      final String gambar = thecars["gambar"];
      final String merknya = thecars["merknya"];
      final String price = thecars["price"];

      if (merknya == "${widget.merk}") {
        daftarmobil.add(
          new Container(
            child: new ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => DetailProduk(
                        name: thecars["nama"],
                        description: "Ini adalah mobil $merknya",
                        merknya: "$merknya",
                        price: "$price",
                        image: gambar,
                        star: 5,
                      ),
                    ));
                  },

                  child: ProductBox(
                    name: thecars["nama"],
                    description: "Ini adalah mobil $merknya",
                    merknya: "$merknya",
                    price: "$price",
                    image: gambar,
                    star: 5,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      
    }
  }

  @override
  void initState() {
    _buatlistmobil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.merk}")
      ),

      body: ListView(
        
        children: daftarmobil,
      )
    );
  }
}

class ProductBox extends  StatelessWidget{
  ProductBox({Key key, this.name, this.description, this.price, this.image, this.star, this.merknya}): super(key: key);

  final String name;
  final String merknya;
  final String description;
  final String price;
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
            Image.asset("assets/Cars/" + this.merknya + "/" + image, width: 150,),

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
// ================================= END LIST MOBIL =================================