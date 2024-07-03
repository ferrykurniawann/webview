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
import 'webView.dart'; // Pastikan impor ini benar

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kelompok 5'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                color: Colors.blue[700],
                child: Column(
                  children: [
                    buildProfileInfo('Ferry Kurniawan', '2100063', Icons.exit_to_app),
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
                    buildMenuButton('Kalkulator', Icons.calendar_today, Colors.lightBlue, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalculatorPage()),
                      );
                    }),
                    buildMenuButton('Aplikasi C', Icons.calendar_today, Colors.lightBlue, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ApplicationCPage()),
                      );
                    }),
                    buildMenuButton('Aplikasi D', Icons.calendar_today, Colors.lightBlue, () {
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

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Center(
        child: Text('Ini adalah halaman Kalkulator'),
      ),
    );
  }
}

class ApplicationCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi C'),
      ),
      body: Center(
        child: Text('Ini adalah halaman Aplikasi C'),
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
