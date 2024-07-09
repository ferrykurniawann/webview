// import 'package:flutter/material.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Home Page'),
//         ),
//         body: Center(
//             child: Column(
//           children: [
//             Text('Home'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(onPressed: () {}, child: Text('profil')),
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Kembali')),
//               ],
//             )
//           ],
//         )));
//   }
// }



import 'package:flutter/material.dart';
import 'package:myapp/profilPage.dart';
import 'webView.dart'; // Pastikan impor ini benar
import 'kalkulator.dart'; // Tambahkan ini

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Borobudur Society'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                color: Colors.lightBlue,
                child: Column(
                  children: [
                    buildProfileInfo('Kelompok 5', 'Rpl & Mobile', Icons.exit_to_app),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    buildMenuButton('Web View', Icons.web, Colors.lightBlue, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebViewPage()),
                      );
                    }),
                    buildMenuButton('Kalkulator', Icons.calculate, Colors.lightBlue, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Kalkulator()),
                      );
                    }),
                    buildMenuButton('Profil', Icons.people_alt, Colors.lightBlue, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    }),
                    buildMenuButton('Aplikasi D', Icons.apps, Colors.lightBlue, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ApplicationDPage()),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileInfo(String name, String id, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                id,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }

  Widget buildMenuButton(String title, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}




class ApplicationDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi D'),
      ),
      body: Center(
        child: Text('Ini adalah halaman Aplikasi D'),
      ),
    );
  }
}
