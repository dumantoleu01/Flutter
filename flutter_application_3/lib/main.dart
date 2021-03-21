import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 12323;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nekoma school'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _buildTopImage(),
          Center(
              child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: _buildRating(),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                  child: Container(
                    child: _buildAction(),
                    padding: const EdgeInsets.all(5),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: _buildDesc(),
                ),
              ],
            ),
          ))
        ],
      );

  Widget _buildTopImage() => Container(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Image.asset(
            'assets/images/Kuro3.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildRating() => ListTile(
        title: Text(
          'Kuro Tetsuro',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text('Nekoma School'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FavoriteWidget(),
          ],
        ),
      );

  Widget _buildAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton('Middle Blocker', Icons.star, Colors.black),
          _buildButton(
              'Height: 188 cm', Icons.radio_button_checked, Colors.black),
          _buildButton('Age 18', Icons.school, Colors.black),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );

  Widget _buildDesc() => Text(
        'Tetsurō Kuroo (Japanese: 黒尾くろお 鉄朗てつろう Kuroo Tetsurō) was previously a third-year student from Nekoma High. He was the Boys Volleyball Club is captain and a middle blocker, known as the "Scheming Captain". As of November 2018, he is part of the Japan Volleyball Association is sports promotion division.',
        softWrap: true,
        style: TextStyle(
          fontSize: 16,
        ),
      );
}
