import 'package:flutter/material.dart';
import 'package:myclig/core/constants/route_names.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: Text(''),
          backgroundColor: Color(0xff330055),
          actions: [
            IconButton(
              icon: Icon(
                Icons.person_outline_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PROFILE_SCREEN,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              onPressed: null,
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.purple,
            tabs: [
              Tab(
                text: "POST",
                icon: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: "VIDEOS",
                icon: Icon(
                  Icons.ondemand_video_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: "CHATS",
                icon: Icon(
                  Icons.chat_bubble_outline_sharp,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: "BLOG",
                icon: Icon(
                  Icons.zoom_out_map_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          title: Text('MyClig'),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Post',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      ),
                      Text(
                        ' available',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      heroTag: 'btn3',
                      child: Icon(
                        Icons.edit,
                        color: Colors.black87,
                      ),
                      backgroundColor: Colors.green[300],
                      onPressed: null,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      heroTag: 'btn4',
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.purple,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Video',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      ),
                      Text(
                        ' available',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      heroTag: 'btn5',
                      elevation: 5,
                      child: Icon(
                        Icons.videocam_sharp,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.purple,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Chat',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      ),
                      Text(
                        ' available',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      heroTag: 'btn1',
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.purple,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Post',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      ),
                      Text(
                        ' available',
                        style: TextStyle(fontSize: 30, color: Colors.grey[400]),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: FloatingActionButton(
                      heroTag: 'btn2',
                      child: Icon(
                        Icons.chat_bubble_outlined,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.purple,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
