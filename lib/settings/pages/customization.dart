/*
Copyright 2019 The dahliaOS Authors
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'dart:io';

import 'package:Pangolin/quick_settings.dart';
import 'package:Pangolin/settings/hiveManager.dart';
import 'package:Pangolin/themes/customization_manager.dart';
import 'package:Pangolin/widgets/conditionWidget.dart';
import 'package:Pangolin/widgets/settingsTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../main.dart';

class Customization extends StatefulWidget {
  static int selectedWallpaper = HiveManager.get("wallpaper");
  @override
  _CustomizationState createState() => _CustomizationState();
}

class _CustomizationState extends State<Customization> {
  String _sliderText = HiveManager.get("launcherSize").toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: kIsWeb ? true : false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "Customization",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                )),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Accent Color",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Text("Choose your accent Color"),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<CustomizationNotifier>(
                              builder: (context, notifier, child) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildAcctenColorButton(
                                      Colors.deepOrangeAccent[400], () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.deepOrangeAccent[400]);
                                    });
                                  }, "Orange"),
                                  buildAcctenColorButton(Colors.redAccent[700],
                                      () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.redAccent[700]);
                                    });
                                  }, "Red"),
                                  buildAcctenColorButton(
                                      Colors.greenAccent[700], () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.greenAccent[700]);
                                    });
                                  }, "Green"),
                                  buildAcctenColorButton(Colors.blueAccent[700],
                                      () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.blueAccent[700]);
                                    });
                                  }, "Blue"),
                                  buildAcctenColorButton(
                                      Colors.purpleAccent[700], () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.purpleAccent[700]);
                                    });
                                  }, "Purple"),
                                  buildAcctenColorButton(Colors.cyanAccent[700],
                                      () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.cyanAccent[700]);
                                    });
                                  }, "Cyan"),
                                  buildAcctenColorButton(
                                      Colors.amberAccent[700], () {
                                    setState(() {
                                      notifier.changeThemeColor(
                                          Colors.amberAccent[700]);
                                    });
                                  }, "Amber"),
                                  buildAcctenColorButton(
                                      !CustomizationNotifier().darkTheme
                                          ? Colors.black
                                          : Colors.white, () {
                                    setState(() {
                                      !CustomizationNotifier().darkTheme
                                          ? notifier
                                              .changeThemeColor(Colors.black)
                                          : notifier
                                              .changeThemeColor(Colors.white);
                                    });
                                  },
                                      !CustomizationNotifier().darkTheme
                                          ? "Black"
                                          : "White"),
                                  GestureDetector(
                                    onTap: () {
                                      notImplemented(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.blur_on,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Blur",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Enable Blur Effects on the Desktop"),
                              Consumer<CustomizationNotifier>(
                                builder: (context, notifier, child) => Switch(
                                  value: HiveManager.get("blur"),
                                  onChanged: (bool state) {
                                    setState(() {
                                      notifier.toggleBlur(state);
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Dark Mode",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Enable Dark Mode on the Desktop and all Apps"),
                              Consumer<CustomizationNotifier>(
                                builder: (context, notifier, child) => Switch(
                                  value: notifier.darkTheme,
                                  onChanged: (bool state) {
                                    setState(() {
                                      notifier.toggleThemeDarkMode(state);
                                      if (notifier.darkTheme &&
                                          notifier.accent == Colors.black) {
                                        notifier.changeThemeColor(Colors.white);
                                      } else if (!notifier.darkTheme &&
                                          notifier.accent == Colors.white) {
                                        notifier.changeThemeColor(Colors.black);
                                      }
                                      //HiveManager.set("darkMode", state);
                                      //Pangolin.restartApp(context);
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Taskbar",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Center Taskbar Items"),
                              Switch(
                                value: HiveManager.get("centerTaskbar"),
                                onChanged: (bool state) {
                                  setState(() {
                                    HiveManager.set("centerTaskbar", state);
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Wallpaper",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Enable Random Wallpapers"),
                              Switch(
                                value: HiveManager.get("randomWallpaper"),
                                onChanged: (bool state) {
                                  setState(() {
                                    HiveManager.set("randomWallpaper", state);
                                  });
                                },
                              )
                            ],
                          ),
                          ConditionWidget(
                              !HiveManager.get("randomWallpaper"),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Choose a Wallpaper"),
                                      FlatButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return WallpaperChooser();
                                              });
                                        },
                                        child: Text("Open Wallpaper Chooser"),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Launcher",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Enable Wide Launcher Mode"),
                                  Switch(
                                    value: HiveManager.get("launcherWideMode"),
                                    onChanged: (bool state) {
                                      setState(() {
                                        HiveManager.set(
                                            "launcherWideMode", state);
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Launcher columns"),
                                  Expanded(
                                    child: Slider(
                                      onChanged: (double value) {
                                        setState(() {
                                          HiveManager.set(
                                              "launcherSize", value);
                                          _sliderText = value
                                              .toString()
                                              .replaceAll(".0", "");
                                        });
                                      },
                                      value: HiveManager.get("launcherSize")
                                          .toDouble(),
                                      label: _sliderText,
                                      divisions: 2,
                                      min: 5,
                                      max: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child:
                                        Text(_sliderText.replaceAll(".0", "")),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Window Titlebars",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      SettingsTile(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Enabled colored Titlebar"),
                                  Switch(
                                    value: HiveManager.get("coloredTitlebar"),
                                    onChanged: (bool state) {
                                      setState(() {
                                        HiveManager.set(
                                            "coloredTitlebar", state);
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Color(0x00ffffff),
          child: new SizedBox(
              height: 50,
              width: 15,
              child: new Padding(
                  padding: EdgeInsets.all(0),
                  child: Card(
                    elevation: 0,
                    color: Colors.amber[500],
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              new Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.warning,
                                    size: 25,
                                    color: Colors.grey[900],
                                  )),
                              new Padding(
                                  padding: EdgeInsets.all(8),
                                  child: new Text(
                                    kIsWeb
                                        ? "WARNING: Customization is not supported on Web Demos"
                                        : "WARNING: You need to restart Pangolin to apply your changes.",
                                    style: new TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        ConditionWidget(
                          !kIsWeb,
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FlatButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: Center(
                                          child: new Text(
                                              "Are you sure you want to restart Pangolin?")),
                                      content: new Container(
                                        child: Text(
                                            "The restart will only take a few seconds but your open windows will be closed and unsaved data will be lost"),
                                      ),
                                      actions: <Widget>[
                                        // usually buttons at the bottom of the dialog
                                        new FlatButton(
                                          child: new Text("No"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new FlatButton(
                                          child: new Text("Yes, Restart!"),
                                          onPressed: () {
                                            Process.run(
                                                'bash', ['/dahlia/restart.sh']);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Restart",
                                style: new TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )))),
    );
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  GestureDetector buildAcctenColorButton(
      Color color, Function onTap, String name) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Tooltip(
          message: name,
          child: CircleAvatar(
            backgroundColor: Colors.grey[350],
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundColor: color,
                child: (HiveManager.get("accentColorValue") == color.value)
                    ? Icon(Icons.blur_circular,
                        color: HiveManager.get("darkMode")
                            ? Colors.black
                            : Colors.white)
                    : Container(
                        height: 0,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WallpaperChooser extends StatefulWidget {
  const WallpaperChooser({
    Key key,
  }) : super(key: key);

  @override
  _WallpaperChooserState createState() => _WallpaperChooserState();
}

class _WallpaperChooserState extends State<WallpaperChooser> {
  int _index = HiveManager.get("wallpaper");
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      title: Text("Choose a Wallpaper"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 200,
        height: MediaQuery.of(context).size.height - 300,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 16 / 9),
          itemCount: Pangolin.wallpapers.length,
          itemBuilder: (BuildContext context, int index) {
            _index = index;
            return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = index;
                      Customization.selectedWallpaper = index;
                    });
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          Pangolin.wallpapers[index].toString(),
                          fit: BoxFit.cover,
                          scale: 1.0,
                        ),
                      ),
                      (Customization.selectedWallpaper == index)
                          ? Positioned(
                              bottom: 5,
                              right: 5,
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.check),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ));
          },
        ),
      ),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text("Close"),
          onPressed: () {
            Customization.selectedWallpaper = HiveManager.get("wallpaper");
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text("Save"),
          onPressed: () {
            HiveManager.set("wallpaper", Customization.selectedWallpaper);
            print(HiveManager.get("wallpaper"));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
