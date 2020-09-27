import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Les scrollables',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Les scrollables'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activite> mesActivites = [
    new Activite("Vélo", Icons.directions_bike),
    new Activite("Peinture", Icons.palette),
    new Activite("Golf", Icons.golf_course),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolage", Icons.build),
    new Activite("Vélo", Icons.directions_bike),
    new Activite("Peinture", Icons.palette),
    new Activite("Golf", Icons.golf_course),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolage", Icons.build),
    new Activite("Vélo", Icons.directions_bike),
    new Activite("Peinture", Icons.palette),
    new Activite("Golf", Icons.golf_course),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolage", Icons.build),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: new ListView.builder(
          itemCount: mesActivites.length,
            itemBuilder: (context, i){
            Activite activite = mesActivites[i];
            var key = activite.nom;
          return new Dismissible(
              key: new Key(key),
              background: new Container(
                padding: EdgeInsets.only(right: 20.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text("Supprimer", style: new TextStyle(color: Colors.white),),
                    new Icon(Icons.delete, color: Colors.white,),
                  ],
                ),
                color: Colors.red,
              ),
              onDismissed: (direction){
                setState(() {
                  print(activite.nom);
                  mesActivites.removeAt(i);
                });
              },
              child: new ListTile(
                title: new Text("Activité:  ${activite.nom}"),
                trailing: new Icon(activite.icone),
              )
          );

        }),

      ),

    );
  }
}

class Activite {
  String nom;
  IconData icone;

  Activite(this.nom, this.icone);
}