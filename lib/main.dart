import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:provider_shayari/secondone.dart';
import 'Data.dart';
import 'ShayariProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShayariProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: shayari(),
      ),
    ),
  );
}

class shayari extends StatefulWidget {
  const shayari({super.key});

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {
  @override
  Widget build(BuildContext context) {
    final shayariProvider = Provider.of<ShayariProvider>(context);
    // List<bool> temp = List.filled(shayariProvider.selectedItems.length, false);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green.shade600,
        backgroundColor: HexColor("00b36b"),
        title: Text("Love Shayari",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: InkWell(
              // onTap: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return setting();
              //     // return Settings();
              //   },));
              // },
              // child: Text ("Settings"),
            )),
            PopupMenuItem(child: Text("Rate Us")),
            PopupMenuItem(child: Text("Share")),
            PopupMenuItem(child: Text("More Apps 1")),
            PopupMenuItem(child: Text("More Apps 2"))
          ],)
        ],
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
        itemCount: Data.shayariname.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapUp: (details) {
              shayariProvider.updateSelection(index);
            },
            onTapCancel: () {
              shayariProvider.updateSelection(index);
            },
            onTapDown: (details) {
              shayariProvider.updateSelection(index);
            },
            child: Card(
              elevation: 50,
              margin: EdgeInsets.all(5.0),
              child: ListTile(
                tileColor: (shayariProvider.isSelected[index] == true)
                    ? Colors.pink.shade900
                    : null,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return secondone(index);
                  },));
                },
                trailing: (shayariProvider.isSelected[index] == true)
                    ? Icon(Icons.navigate_next_outlined)
                    : null,
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset("pic/${Data.shayariimage[index]}"),
                ),
                dense: true,
                horizontalTitleGap: 20,
                title: Text(
                  "${Data.shayariname[index]}",
                  style: TextStyle(fontSize: 20,color: Colors.green.shade800),
                ),
              ),
            ),
          );
        },),
    );
  }
}

