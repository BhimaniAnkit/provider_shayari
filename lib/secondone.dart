import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:provider_shayari/Data.dart';
import 'package:provider_shayari/third.dart';
import 'ShayariProvider.dart';

class secondone extends StatefulWidget {
  int index;
  secondone(this.index);

  @override
  State<secondone> createState() => _secondoneState();
}

class _secondoneState extends State<secondone> {

  @override

  Widget build(BuildContext context) {
    final shayariProvider = Provider.of<ShayariProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("00b36b"),
        title: Text("Love Shayari", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Settings")),
              PopupMenuItem(child: Text("Rate Us")),
              PopupMenuItem(child: Text("Share")),
              PopupMenuItem(child: Text("More Apps 1")),
              PopupMenuItem(child: Text("More Apps 2")),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shayariProvider.shayariList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapUp: (details) {
              shayariProvider.selectItem(index);
            },
            onTapCancel: () {
              shayariProvider.selectItem(index);
            },
            onTapDown: (details) {
              shayariProvider.selectItem(index);
            },
            child: Card(
              margin: EdgeInsets.all(3.0),
              child: ListTile(
                tileColor: (shayariProvider.selectedItems[index] == true)
                    ? HexColor("b32d00")
                    : HexColor("#ff33cc"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return third(index, shayariProvider.shayariList, widget.index);
                  }));
                },
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset("pic/${Data.shayariimage[widget.index]}"),
                ),
                title: Text("${shayariProvider.shayariList[index]}", maxLines: 1, style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,() {
      ShayariProvider shayariProvider = Provider.of<ShayariProvider>(context,listen: false);
      shayariProvider.loadShayariList(widget.index);
      shayariProvider.showshayariList();
    },);
  }
}
