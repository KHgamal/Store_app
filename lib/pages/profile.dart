import 'package:creativa/constants.dart';
import 'package:creativa/pages/fav.dart';
import 'package:creativa/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? name;
    String? email;
    String? photoUrl;

       name = user?.displayName;
       email = user?.email;
       photoUrl = user?.photoURL;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Provider.of<DarkThemeProvider>(context).isSwitched?bgDark:bgLight ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).viewPadding.top
              ,bottom:8),
              width: double.infinity,
              color: Provider.of<DarkThemeProvider>(context).isSwitched
                  ? containerDark
                  : navBarColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  photoUrl==null ? const SizedBox():CircleAvatar(
                    radius: size.height * 0.08,
                    backgroundColor: Colors.white60,
                    backgroundImage:NetworkImage(photoUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        name==null?"No User":name,
                      style: const TextStyle(fontSize: 25, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical:8),
              margin: const EdgeInsets.symmetric(vertical:20),
              color: Colors.white70,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.black26,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              'User name',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                          Text(
                           name==null?"No User":name,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 15),
                          ),
                        ],
                      ),

                    ],
                  ),
                  const Divider(
                    color: Colors.black26,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.black26,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                          Text(
                            email==null?"There is no user":email,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
             padding: const EdgeInsets.symmetric(vertical:8),
              color: Colors.white70,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const[
                           Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child:
                                Icon(Icons.favorite, color: Color(0xffe90001)),
                          ),
                          Text(
                            'favorites',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FavPage()),
                              ),
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  const Divider(
                    color: Colors.black26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:const [
                           Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Icon(
                              Icons.dark_mode,
                              color: Colors.black54,
                            ),
                          ),
                           Text(
                            'dark mode',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20),
                          ),
                        ],
                      ),
                      Switch(
                        value:
                            Provider.of<DarkThemeProvider>(context).isSwitched,
                        onChanged: Provider.of<DarkThemeProvider>(context,
                                listen: false)
                            .toggleSwitch,
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.black54,
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.black26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child:IconButton(onPressed:() async =>await FirebaseAuth.instance.signOut(),
                              icon:const Icon(Icons.logout,color: Colors.black26,),),
                          ),
                          const Text(
                            'Sign Out',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
