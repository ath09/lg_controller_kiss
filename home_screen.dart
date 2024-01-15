import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:lg_kiss_controller/components/connection_flag.dart';
// TODO 12: Import connections/ssh.dart
import 'package:lg_kiss_controller/connections/ssh.dart';
import 'package:lg_kiss_controller/pages/about_screen.dart';
import 'package:lg_kiss_controller/pages/settings_page.dart';
import '../components/reusable_card.dart';

bool connectionStatus = false;
// TODO 17: Initialize const String searchPlace

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchPlace = '';
  int _intpage = 1;

  // TODO 13: Initialize SSH instance just like you did in the settings_page.dart, just uncomment the lines below, this time use the same instance for each of the tasks
  late SSH ssh;

  @override
  void initState() {
    super.initState();
    ssh = SSH();
    _connectToLG();
  }

  Future<void> _connectToLG() async {
    bool? result = await ssh.connectToLG();
    setState(() {
      connectionStatus = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LG Connection',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     onPressed: () async {
        //       await Navigator.pushNamed(context, '/settings');
        //       _connectToLG();
        //     },
        //   ),
        // ],
      ),
      body: Container(
        color: Color.fromARGB(255, 243, 185, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: ConnectionFlag(
                  status: connectionStatus,
                )),

            //
            // Expanded(
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: ReusableCard(
            //           colour: Colors.green,
            //           onPress: () async {
            //             // SSH ssh =
            //             //   SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
            //              //await ssh.connectToLG();
            //             SSHSession? res = await ssh.flyto(0,0);
            //             if (res == true) {
            //               final msgg = SnackBar(
            //                 content: Text('Command executed successfully!'),
            //                 action:
            //                     SnackBarAction(label: 'Ok', onPressed: () {}),
            //               );
            //               ScaffoldMessenger.of(context).showSnackBar(msgg);
            //             } else {
            //               final msgg = SnackBar(
            //                 content: Text('Failed to execute command'),
            //                 action:
            //                     SnackBarAction(label: 'Ok', onPressed: () {}),
            //               );
            //               ScaffoldMessenger.of(context).showSnackBar(msgg);
            //             }
            //           },
            //           cardChild: const Center(
            //             child: Text(
            //               'START ORBIT',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 40,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: ReusableCard(
            //           colour: Colors.blue,
            //           onPress: () async {
            //             //  SSH ssh =
            //             //     SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
            //             // await ssh.connectToLG();

            //             // TODO 15: Implement shutdownLG() as async task
            //             await ssh.resetRefreshLG();
            //           },
            //           cardChild: const Center(
            //             child: Text(
            //               'STOP ORBIT',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 40,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.blue,
                      onPress: () async {
                        TextEditingController _textFieldController =
                            TextEditingController();

                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              
                              title: Text('Enter Place Name'),
                              content: TextField(
                                
                                controller: _textFieldController,
                                decoration:
                                    InputDecoration(hintText: 'Place Name'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text('Search'),
                                  onPressed: () async {
                                    setState(() {
                                      searchPlace = _textFieldController.text;
                                    });
                                    await ssh.searchPlace(searchPlace);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      cardChild: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search, // Replace with your preferred search icon
          color: Colors.white,
          size: 40,
        ),
        SizedBox(width: 10), // Adjust the spacing between icon and text
        Text(
          'SEARCH PLACE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  ),
                    ),
                  ),
                  
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.green,
                      onPress: () {
                        // TODO 21: Implement rebootLG() as async task and test
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: false,
                          title: "Reboot Rig?",
                          //desc: "Do you really want to relaunch the rig?",
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            await ssh.rebootLG();
                          },
                        ).show();
                      },
                      cardChild: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh, // Replace with your preferred reboot icon
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 10), // Adjust the spacing between icon and text
          Text(
            'REBOOT LG',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
        ],)
                      ),
                    ),
                  ),
              
            
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.yellow,
                      onPress: () {
                        // TODO 14: Implement relaunchLG() as async task

                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: false,
                          title: "Relaunch Rig?",
                          //desc: "Do you really want to relaunch the rig?",
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            await ssh.relaunchLG();
                          },
                        ).show();
                      },
                     cardChild: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.redo, // Replace with your preferred relaunch icon
          color: Colors.white,
          size: 40,
        ),
        SizedBox(width: 10), // Adjust the spacing between icon and text
        Text(
          'RELAUNCH LG',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  ),
                    ),
                  ),
                ],),),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.red,
                      onPress: () {
                        // TODO 15: Implement shutdownLG() as async task
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: false,
                          title: "Close Rig?",
                          // desc: "Do you really want to close the rig?",
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            await ssh.shutdownLG();
                          },
                        ).show();
                      },
                      cardChild: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.power_settings_new, // Replace with your preferred shutdown icon
          color: Colors.white,
          size: 40,
        ),
        SizedBox(width: 10), // Adjust the spacing between icon and text
        Text(
          'SHUT DOWN LG',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  ),
                    ),
                  )
              
          ],
        ),
      ),
    );
  }
}

// Widget getSelectedWidget({required int index}) {
//   Widget widget;
//   switch (index) {
//     case 0:
//       widget = const SettingsPage();
//       break;
//     case 2:
//       widget =  AboutPage();
//       break;
//     default:
//       widget = const HomeScreen();
//       break;
//   }
//   return widget;
// }
