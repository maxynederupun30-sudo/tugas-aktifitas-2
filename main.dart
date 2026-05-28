import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MoviePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Movie App"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        backgroundColor: Color(0xff1f2a44),

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

//
// HALAMAN HOME
//

class HomePage extends StatelessWidget {

  final List<Map<String, String>> movies = [

    {
      "title": "Avengers Endgame",
      "image":
      "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
    },

    {
      "title": "Spider-Man",
      "image":
      "https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
    },

    {
      "title": "Batman",
      "image":
      "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
    },

    {
      "title": "Interstellar",
      "image":
      "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
    },

    {
      "title": "Joker",
      "image":
      "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
    },

    {
      "title": "Titanic",
      "image":
      "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
    },

    {
      "title": "Doctor Strange",
      "image":
      "https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
    },

    {
      "title": "Black Panther",
      "image":
      "https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg",
    },

    {
      "title": "Thor",
      "image":
      "https://image.tmdb.org/t/p/w500/prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg",
    },

    {
      "title": "Inception",
      "image":
      "https://image.tmdb.org/t/p/w500/8IB2e4r4oVhHnANbnm7O3Tj6tF8.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),

      child: GridView.builder(

        itemCount: movies.length,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.58,
        ),

        itemBuilder: (context, index) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Container(

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12),

                    image: DecorationImage(

                      image: NetworkImage(
                        movies[index]["image"]!,
                      ),

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8),

              Text(
                movies[index]["title"]!,

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

//
// HALAMAN MOVIE
//

class MoviePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Container(

              width: 220,
              height: 320,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15),

                image: DecorationImage(

                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
                  ),

                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 25),

            Text(
              "Avengers Endgame",

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Action • Adventure • Sci-Fi",

              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "After the devastating events of Infinity War, "
                  "the Avengers assemble once more to reverse "
                  "Thanos actions and restore balance to the universe.",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1f2a44),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 55),
              ),

              onPressed: () {},

              child: Text(

                "PLAY MOVIE",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// HALAMAN PROFILE
//

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(

        children: [

          //
          // HEADER
          //

          Stack(
            alignment: Alignment.center,

            children: [

              Container(
                height: 180,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Color(0xffdfe8f7),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(top: 40),

                  child: Text(
                    "Profile",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 0,

                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Colors.blue[300],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          //
          // DATA PROFILE
          //

          profileItem(
            Icons.person_outline,
            "PAB 2025",
          ),

          profileItem(
            Icons.phone_in_talk_outlined,
            "1462300068",
          ),

          profileItem(
            Icons.email_outlined,
            "maxypatricknederupun@gmail.com",
          ),

          profileItem(
            Icons.location_on_outlined,
            "Surabaya",
          ),

          profileItem(
            Icons.camera_alt_outlined,
            "pab2023",
          ),

          SizedBox(height: 40),

          //
          // BAGIAN BAWAH
          //

          Container(
            height: 180,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Color(0xffdfe8f7),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120),
                topRight: Radius.circular(120),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  // WIDGET ITEM PROFILE
  //

  Widget profileItem(IconData icon, String text) {

    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),

      decoration: BoxDecoration(

        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),

      child: Row(

        children: [

          Icon(
            icon,
            color: Colors.blue[300],
            size: 28,
          ),

          SizedBox(width: 20),

          Text(
            text,

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}