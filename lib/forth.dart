import 'dart:io';
import 'dart:math';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shayari/Data.dart';
import 'package:provider_shayari/ForthProvider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class forth extends StatefulWidget {
  final List<String> shayari;
  final int pos;
  final int index;

  forth(this.shayari,this.pos,this.index);

  @override
  State<forth> createState() => _forthState();
}

class _forthState extends State<forth> {
  WidgetsToImageController controller = WidgetsToImageController();
  double size = 20.0; // Add this line
  // String emoji = "🤨🤨🤨🤨";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForthProvider(),
      child: Consumer<ForthProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade600,
              title: Text(
                "फोटो पे शायरी लिखे",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: WidgetsToImage(
                      controller: controller,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 40.0,bottom: 30.0),
                        height: double.infinity,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Text(
                            "${provider.emoji}\n\n${widget.shayari[widget.pos]}\n\n${provider.emoji}",
                            style: TextStyle(fontSize: provider.sliderFontSize, color: provider.d, fontFamily: provider.currentFont),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: (provider.t == false) ? provider.c : null,
                          gradient: (provider.t == true)
                            ? LinearGradient(colors: [Data.grediantcolor[provider.colIndex],Data.grediantcolor[provider.colIndex + 1]])
                              : null,
                        ),
                      ),
                    ),),
                  ],
                )),
                Row(
                  children: [
                    Expanded(child: Container(
                      margin: EdgeInsets.only(top: 30.0,bottom: 30.0),
                      height: 200,
                      width: double.infinity,
                      color: Colors.brown.shade700,
                      child: Column(
                        children: [
                          Expanded(child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: InkWell(
                                onTap: () {
                                  provider.t = true;
                                  int s_random = Random().nextInt(Data.grediantcolor.length - 1);
                                  provider.colIndex = s_random;
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 120.0,top: 5.0,bottom: 5.0),
                                  // padding: EdgeInsets.only(bottom: 30.0),
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                  // child: Icon(Icons.cached_rounded,size: 45,),
                                  child: Image.asset("pic/reload.png"),
                                ),
                              )),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context, builder: (context) {
                                      return Container(
                                        // height: t_height,
                                        height: double.infinity,
                                        child: GridView.builder(
                                          itemCount: Data.grediantcolor.length - 1,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                provider.t = true;
                                                provider.colIndex = index;
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    Data.grediantcolor[index],
                                                    Data.grediantcolor[index + 1]
                                                  ]),
                                                ),
                                              ),
                                            );
                                          },),
                                      );
                                    },);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right:120.0,top: 5.0,bottom: 5.0,),
                                    height: 50,
                                    width: 50,
                                    // width: 100,
                                    color: Colors.white,
                                    child: Image.asset("pic/expand.png",),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ),
                          Expanded(child: Row(
                            children: [
                              Expanded(child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          height: 200,
                                          child: Row(
                                            children: [
                                              Expanded(child: GridView.builder(
                                                itemCount: Data.grediantcolor.length,
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    mainAxisSpacing: 5,
                                                    crossAxisSpacing: 5
                                                ),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      provider.t = false;
                                                      provider.c = Data.grediantcolor[index];
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      color: Data.grediantcolor[index],
                                                    ),
                                                  );
                                                },),),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 5,bottom: 170,left: 5,right: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset("pic/close.png"),
                                                ),
                                              )
                                            ],
                                          )
                                      );
                                    },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10.0),
                                  height: 70,
                                  width: 100,
                                  color: Colors.red.shade600,
                                  child: Text("Background",style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                              )),
                              Expanded(child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          height: 200,
                                          child: Row(
                                            children: [
                                              Expanded(child: GridView.builder(
                                                itemCount: Data.grediantcolor.length,
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 8,
                                                  mainAxisSpacing: 3,
                                                  crossAxisSpacing: 3,
                                                ),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      // t = false;
                                                      provider.d = Data.grediantcolor[index];
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      height: 10,
                                                      width: 10,
                                                      color: Data.grediantcolor[index],

                                                    ),
                                                  );
                                                },),),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(bottom: 160,right: 5,left: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset("pic/close.png"),
                                                ),
                                              ),
                                            ],
                                          )
                                      );
                                    },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10.0),
                                  height: 70,
                                  width: 100,
                                  color: Colors.red.shade600,
                                  child: Text("Text Color",style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                              ),),
                              Expanded(child: InkWell(
                                onTap: ()  async {
                                  final bytes = await controller.capture();
                                  var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS) + "/pic";
                                  print(path);
                                  Directory dir = Directory(path);

                                  if(! await dir.exists()){
                                    dir.create();
                                  }

                                  int r_images = Random().nextInt(100);
                                  String img_name = "${r_images}.jpg";
                                  File f = File("${dir.path}/${img_name}");

                                  await f.writeAsBytes(bytes!);

                                  // Share.shareXFiles([XFile('${f.path}')],text: 'Great Image');
                                  Share.shareXFiles([XFile('${f.path}')],text: 'Shayar := Ankit Bhimani');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10.0),
                                  height: 70,
                                  width: 100,
                                  color: Colors.red.shade600,
                                  child: Text("Share",style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                              )),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              Expanded(child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return Container(
                                      height: 300,
                                      child: Row(
                                        children: [
                                          Expanded(child: ListView.builder(
                                            itemCount : provider.font.length,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: InkWell(
                                                  onTap: () {
                                                    provider.currentFont = Data.Font[index];
                                                    // provider.changeFont(provider.currentFont);
                                                    // provider.currentFont = provider.font[index];
                                                    Navigator.pop(context);
                                                    print("Current Font:= ${provider.currentFont}");
                                                    setState(() {});
                                                  },
                                                  child: ListTile(
                                                    tileColor: Colors.grey,
                                                    title: Text("Shayari"),
                                                  ),
                                                ),
                                              );
                                            },)),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(bottom: 260,right: 5),
                                              height: 30,
                                              width: 30,

                                              child: Image.asset("pic/close.png"),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10.0),
                                  height: 70,
                                  width: 100,
                                  color: Colors.red.shade800,
                                  child: Text("Font",style: TextStyle(fontSize: 20, color: Colors.white),),
                                ),
                              )),
                              Expanded(child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return Container(
                                        height: 300,
                                        child: Row(
                                          children: [
                                            Expanded(child: ListView.builder(
                                              itemCount: Data.Emoji.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  child: InkWell(
                                                    onTap: () {
                                                      // data.emoji[index] = emoji_1.length;
                                                      provider.emoji = Data.Emoji[index];
                                                      Navigator.pop(context);
                                                    },
                                                    child: ListTile(
                                                      tileColor: Colors.grey,
                                                      title: Text('${Data.Emoji[index]}'),
                                                    ),
                                                  ),
                                                );
                                              },),),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(bottom: 260,right: 5),
                                                height: 30,
                                                width: 30,

                                                child: Image.asset("pic/close.png"),
                                              ),
                                            )
                                          ],
                                        )
                                    );
                                  },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10.0),
                                  height: 70,
                                  width: 100,
                                  color: Colors.red.shade600,
                                  child: Text("Emoji",style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                              )),
                              Expanded(child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          height: 200,
                                          child: Row(
                                            children: [
                                              Expanded(child: StatefulBuilder(builder: (context, setState1) {
                                                return Slider(
                                                  max: 100,
                                                  min: 10,
                                                  value: provider.sliderFontSize,
                                                  activeColor: CupertinoColors.activeOrange,
                                                  inactiveColor: CupertinoColors.activeBlue,
                                                  onChanged: (value) {
                                                    provider.changeFontSize(value);
                                                    print(provider.sliderFontSize);
                                                    setState1(() {});
                                                    // size = value;
                                                  },);
                                              },),),

                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(bottom: 150.0,right: 5),
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset("pic/close.png"),
                                                ),
                                              ),
                                            ],
                                          )
                                      );
                                    },);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10.0),
                                  height: 70,
                                  width: 100,
                                  color: Colors.red.shade600,
                                  child: Text("Text Size",style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                              ),),
                            ],
                          )),
                        ],
                      ),
                    )),
                  ],
                ),
              ],
            ),
          );
      },),
    );
  }
}
