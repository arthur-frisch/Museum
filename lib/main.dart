import 'package:flutter/material.dart';

void main() {
  runApp(const Museum());
}

class Museum extends StatelessWidget {
  const Museum({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Museum", home: MuseumScaffold());
  }
}

class MainImage extends StatelessWidget {
  final bool isLiked;
  final bool isDisplayText;
  final String pictureText = """La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé
entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort
le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa
Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à
l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à
Paris.\nLa Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci.
La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre
d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par
ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau
l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout
cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au
monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le
diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier
quotidiennement.""";

  const MainImage({
    super.key,
    this.isLiked = false,
    this.isDisplayText = false,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/mona_lisa.jpg",
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Center(
            child: Icon(
              Icons.favorite,
              size: 100,
              color: isLiked ? Colors.red.withOpacity(1) : Colors.white.withOpacity(0)
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: SizedBox(
              width: 300,
              height: 350,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  isDisplayText ? pictureText : "",
                  style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  ),
                ),
              ),
            )
          ),
        ),
      ],
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  bool _isLiked = false;
  bool _isDisplayText = false;
  final snackBar = const SnackBar(
    content: Text("Oeuvre ajoutée à vos favoris"),
  );
  

  void like() {
    setState(() {
      _isLiked = !_isLiked;
    });
    if (_isLiked) ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void displayText() {
    setState(() {
      _isDisplayText = !_isDisplayText;
    });
  }

  @override
  Center build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainImage(isLiked: _isLiked, isDisplayText: _isDisplayText,),
            const Text("Mona Lisa", style: TextStyle(fontFamily: 'Merriweather', fontSize: 30, color: Colors.brown),),
            const Text("Leonard De Vinci", style: TextStyle(fontFamily: 'Merriweather', fontSize: 15, fontWeight: FontWeight.w700, color: Colors.brown),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: [
                IconButton(icon: Icon(Icons.article, color: _isDisplayText ? Colors.black : Colors.brown,), onPressed: () { displayText(); },),
                IconButton(icon: Icon(Icons.favorite, color: _isLiked ? Colors.red : Colors.brown,), onPressed: () { like(); },)
              ],
            )
          ]
        ),
      );
  }
}

class MuseumScaffold extends StatelessWidget {
  const MuseumScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Museum")),
      body: const BodyWidget(),
    );
  }
}