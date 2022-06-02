import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {


  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black54,
      child: ListView(
        children: [

          //header
          Container(
            padding: EdgeInsets.only(top: 26, bottom: 12 ),
            child: Column(
              children: [
                //user profile image
                Container(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                   // backgroundImage: NetworkImage("https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.remove.bg%2Fremove-bg-web%2F588fbfdd2324490a4329d4ad22d1bd436e1d384a%2Fassets%2Fstart-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg&imgrefurl=https%3A%2F%2Fwww.remove.bg%2F&tbnid=sp12V8x9gw6KuM&vet=12ahUKEwi09auLroX4AhXCTXwKHaGXAGoQMygDegUIARC5AQ..i&docid=4O2GvGuD-Cf09M&w=510&h=340&q=image&ved=2ahUKEwi09auLroX4AhXCTXwKHaGXAGoQMygDegUIARC5AQ"),
                  //backgroundImage: AssetImage("assets/images/sajee.jpg"),
                  
                  ),
                ),

                const SizedBox(height: 12),

                //user name
                Text(
                  "Sajee Rodrigo",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),

                  const SizedBox(height: 12),

              ],
            ),
          ),

          //body
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),

                //home
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.grey,),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.grey),
                    ),
                     onTap: () {},
                ),
               const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),

                //myOrders
                ListTile(
                  leading: const Icon(Icons.reorder, color: Colors.grey,),
                  title: const Text(
                    "My Orders",
                    style: TextStyle(color: Colors.grey),
                    ),
                     onTap: () {},
                ),
               const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),

                //not yet recieved orders
                ListTile(
                  leading: const Icon(Icons.picture_in_picture_alt_rounded, color: Colors.grey,),
                  title: const Text(
                    "Not Yet Received Orders",
                    style: TextStyle(color: Colors.grey),
                    ),
                     onTap: () {},
                ),
               const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),

                //history
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.grey,),
                  title: const Text(
                    "History",
                    style: TextStyle(color: Colors.grey),
                    ),
                     onTap: () {},
                ),
               const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),
                //search
                  ListTile(
                  leading: const Icon(Icons.search, color: Colors.grey,),
                  title: const Text(
                    "Search",
                    style: TextStyle(color: Colors.grey),
                    ),
                     onTap: () {},
                ),
               const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),
                //logout
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.grey,),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.grey),
                    ),
                     onTap: () {},
                ),
               const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness:2,
                ),
              ],
            ),
          ),
       
        ],       
    ),
    );
   
  }
}
