import 'package:flutter/material.dart';

void main() {
runApp(new MaterialApp(
  title: "GridView",
  debugShowCheckedModeBanner: false,
  home: new Home(),
));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

List<Container> daftarPemain = new List();

var pemain=[
  {"nama":"Neymar", "gambar":"neymar.jpg"},
  {"nama":"Ter-setegan", "gambar":"tersetegan.jpg"},
  {"nama":"Dembele", "gambar":"dembele.jpg"},
  {"nama":"Suarez", "gambar":"suarez.jpg"},
  {"nama":"Messi", "gambar":"messi.jpg"},
  {"nama":"Griezmann", "gambar":"griezmann.jpg"},
  {"nama":"Dejong", "gambar":"dejong.jpg"},
];

_buatlist()async {
  for (var i =0; i < pemain.length; i++){
    final pemainnya = pemain[i];
    final String gambar = pemainnya["gambar"]; 

    daftarPemain.add(
      new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(child: 
        new Column(
          children: <Widget>[

            new Hero(
              tag: pemainnya["nama"],
              child: new Material(
                child: new InkWell(
                   onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=> new Detail(nama: pemainnya['nama'], gambar: gambar),
                )),
                  child: new Image.asset("img/$gambar", fit: BoxFit.cover,),
                ),
              ),
            ),

            new Padding(padding: new EdgeInsets.all(10.0),),
            new Text(pemainnya['nama'], style: new TextStyle(fontSize: 18.0),)
          ],
        ),)
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
      appBar: new AppBar(
        title: new Text("Daftar Pemain", style: new TextStyle(color: Colors.white)),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarPemain,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama,this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: 
            new Hero(
              tag: nama,
              child: new Material(
                child: InkWell(
                  child: new Image.asset("img/$gambar", fit: BoxFit.cover),
                ),
              )
            )
          ,),

          new BagianNama(
            nama: nama,
          ),
          new BagianIcon()

        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),  
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
