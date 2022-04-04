import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Apiii's Fav",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/d2a79cb8-e9d6-480a-b8e2-d36d56a984e7.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Slowed"),
                      new Tab(icon: new Icon(Icons.audiotrack), text: "High"),
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Mood")
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: <Widget>[
            BelajarListView(),
            BelajarListView1(),
            BelajarListView2(),
          ]),
        ),
      ),
    );
  }
}

class BelajarListView extends StatelessWidget {
  final List slowed = [
    "Runtuh - Fiersa Besari ft. Feby",
    "Kukira Kau Rumah - Amidgala",
    "Hujan - Jourdy Pranata",
    "Akad - Fourtwnty",
    "Halu - Feby",
    "Melepas Senja - Mitty Zasia",
    "Hilmira - Dhika Fawaz",
    "Tutur Batin - Yura Yunita"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(slowed[index], style: TextStyle(fontSize: 20)),
                subtitle: Text('album dari ' + slowed[index]),
                leading: CircleAvatar(
                  child: Text(slowed[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 20)),
                )),
          );
        },
        itemCount: slowed.length,
      ),
    );
  }
}

class BelajarListView1 extends StatelessWidget {
  final List high = [
    "The Beginning - One Ok Rock",
    "Comethru - Jeremy Zucker",
    "Shape of You - Ed Sheeran",
    "Everytime - Chen ft. Punch",
    "Radio - Henry",
    "Loser=Lover - TXT",
    "changes - XXXTENTACION",
    "Selepas Gulita - Jourdy ft. Prilly"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(high[index], style: TextStyle(fontSize: 20)),
                subtitle: Text('album dari ' + high[index]),
                leading: CircleAvatar(
                  child: Text(high[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 20)),
                )),
          );
        },
        itemCount: high.length,
      ),
    );
  }
}

class BelajarListView2 extends StatelessWidget {
  final List mood = [
    "Sephia - Sheila On 7",
    "Everything I Need - Skylar Grey",
    "Melepas Lajang - Arvian Dwi",
    "Done For Me - Punch",
    "Breaking Down - Ailee",
    "Sesuatu di Jogja - Mitty Zasia",
    "Me and My Broken Heart - Rixton",
    "Isi Hati - Misellia"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(mood[index], style: TextStyle(fontSize: 20)),
                subtitle: Text('album dari ' + mood[index]),
                leading: CircleAvatar(
                  child: Text(mood[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 20)),
                )),
          );
        },
        itemCount: mood.length,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
