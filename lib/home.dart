import 'package:flutter/material.dart';
import 'package:youtube_app_clone/telas/biblioteca.dart';
import 'package:youtube_app_clone/telas/emalta.dart';
import 'package:youtube_app_clone/telas/inicio.dart';
import 'package:youtube_app_clone/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Inicio(), EmAlta(), Inscricao(), Biblioteca()];

    return Scaffold(
      appBar: AppBar(
        //define cores padroes pros icons
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "img/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Acao conta!");
              }),
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print("Acao busca");
              }),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("Acao videocam!");
              })
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                title: Text("Inicio"),
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                backgroundColor: Colors.amber,
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                title: Text("Bilioteca"),
                icon: Icon(Icons.folder))
          ]),
    );
  }
}
