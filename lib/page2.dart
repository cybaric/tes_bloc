import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Drawer(
              child: Container(
            child: GestureDetector(onTap: (){Navigator.pop(context);},
              child: Icon(
                Icons.menu,
                color: Colors.blueAccent,
              ),
            ),
          )),
          title: Text('Multi Bloc'),
          actions: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.save),
                  color: Colors.purple,
                ),
                Text('Save',style: TextStyle(fontSize: 10),)
              ],
            ),
            Container(
              width: 10),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: Colors.pinkAccent,
                ),
                Text('Favorite',style: TextStyle(fontSize: 10),)
              ],
            ),
            Container(
              width: 10,
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever),
                    color: Colors.red),
                    Text('Delete',style: TextStyle(fontSize: 10),)
              ],
            ),
            Container(
              width: 10,
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purpleAccent, Colors.greenAccent],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('kembali'))
            ],
          ),
        ),
      ),
    );
  }
}
