import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // GlobalKey<CurvedNavigationBarState> _curvednavihationkey = GlobalKey();
  // final items = const [
  //   Icon(
  //     Icons.settings,
  //     size: 20,
  //     color: Colors.white,
  //   ),
  //   Icon(
  //     Icons.home,
  //     size: 20,
  //     color: Colors.white,
  //   ),
  //   Icon(
  //     Icons.info,
  //     size: 20,
  //     color: Colors.white,
  //   )
  // ];
  // int index = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 60,
      //   backgroundColor: Color.fromARGB(255, 243, 185, 255),
      //   color: Colors.purple,
      //   animationDuration: Duration(milliseconds: 400),
      //   items: items,
      //   index: index,
      //   onTap: (selectedIndex) {
      //     setState(() {
      //       index = selectedIndex;
      //     });
      //   },
      // ),

      appBar: AppBar(
        title: const Text('About',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Nunito'
        ),),
        backgroundColor: Colors.purple,
      ),
     body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0), // Adjust the vertical padding
    child: Column(
      children: [
        Image.asset('assets/lglogoc2.png', height: 450, width: 300), // Increase the image size
         // Add a SizedBox for additional spacing
        Text(
          'Liquid Galaxy is an organization that specializes in the use of panoramic displays'
          'to visualize geographical elements using three or more screens. The organization employs'
          'cutting-edge technology to create immersive and interactive experiences, allowing users'
          'to explore and interact with geographical data in a unique and engaging way.'
          '\n'
          'To control the lg rig, go to the settings page, enter all the details : \n'
          '. For ip address, open the terminal (ctrl+alt+t) and type in ifconfig, the inet addr is your ip\n'
          '. Next put in the username and password which was set at the time of creation of the rig\n'
          '. Enter the ssh port (22) and the number of machines on your rig and press the connect button\n',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.deepPurple,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),

),
     ),
      backgroundColor:  Color.fromARGB(255, 243, 185, 255),
    );
  }
}
