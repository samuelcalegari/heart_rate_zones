import 'package:flutter/material.dart';
import 'package:heart_rate_zones/cardModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Heart Rate Zone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  Map zones = {
    "z1" : {"min" : "X", "max" : "X"},
    "z2" : {"min" : "X", "max" : "X"},
    "z3" : {"min" : "X", "max" : "X"},
    "z4" : {"min" : "X", "max" : "X"},
    "z5" : {"min" : "X", "max" : "X"},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _textController.clear();
                      },
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      int? value = int.tryParse(_textController.text);
                      if(value is int) {
                        int heartRateMax = 220 - value;
                        zones['z1']['min'] = (heartRateMax * 0.5).ceil().toString();
                        zones['z1']['max'] = (heartRateMax * 0.6).ceil().toString();
                        zones['z2']['min'] = (heartRateMax * 0.6).ceil().toString();
                        zones['z2']['max'] = (heartRateMax * 0.7).ceil().toString();
                        zones['z3']['min'] = (heartRateMax * 0.7).ceil().toString();
                        zones['z3']['max'] = (heartRateMax * 0.8).ceil().toString();
                        zones['z4']['min'] = (heartRateMax * 0.8).ceil().toString();
                        zones['z4']['max'] = (heartRateMax * 0.9).ceil().toString();
                        zones['z5']['min'] = (heartRateMax * 0.9).toString();
                        zones['z5']['max'] = heartRateMax.toString();
                      }
                    });
                  },
                  color: Colors.blueGrey,
                  child: const Text(
                    'Calculer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                CardHeartRange(
                    level: '1',
                    title: 'RÉCUPÉRATION',
                    heartRateMin: zones['z1']['min'],
                    heartRateMax: zones['z1']['max'],
                    heartPercantageInfos: '50 à 60',
                    text:
                        "Cela correspond à un effort très modéré, idéal en début de séance pour vous échauffer en douceur et en fin de séance pour récupérer activement en éliminant les déchets produits par vos muscles durant l'effort."),
                CardHeartRange(
                    level: '2',
                    title: 'ENDURANCE FONDAMENTALE ',
                    heartRateMin: zones['z2']['min'],
                    heartRateMax: zones['z2']['max'],
                    heartPercantageInfos: '60 à 70',
                    text:
                        "C'est votre zone de confort ! Celle à laquelle vous pouvez parler sans essoufflement intensif.\n"
                        "Après 20 à 40 minutes effectuées dans cette zone, vos muscles vont commencer à puiser dans vos graisses.\n"
                        "Cet effort modéré vous permet donc de vous affiner mais aussi, pour les coureurs confirmés, d'améliorer votre endurance sur les sorties longues (plus de 1h30).\n"
                        "Vous pouvez courir dans cette zone (presque) sans limite de temps !"),
                CardHeartRange(
                    level: '3',
                    title: 'ENDURANCE ACTIVE',
                    heartRateMin: zones['z3']['min'],
                    heartRateMax: zones['z3']['max'],
                    heartPercantageInfos: '70 à 80',
                    text:
                        "L'effort est soutenu mais votre corps est capable de fournir suffisamment d'oxygène pour maintenir cet effort dans la durée.\n"
                        "Vos muscles s'habituent à mieux consommer les sucres présents dans les fibres musculaires.\n"
                        "Grâce à ce type d'entraînement, vous pouvez maintenir vos allures rapides (ex : allure de compétition 10 km) pendant une durée plus longue.\n"
                        "Mais cet effort ne doit pas se prolonger plus de 45 minutes successives."),
                CardHeartRange(
                    level: '4',
                    title: 'RÉSISTANCE',
                    heartRateMin: zones['z4']['min'],
                    heartRateMax: zones['z4']['max'],
                    heartPercantageInfos: '80 à 90',
                    text:
                        "Un entraînement comportant des efforts courts et répétés dans cette zone vous permet d'améliorer votre performance sur une distance donnée (par ex : votre temps au 10km).\n"
                        "Vous apprenez aussi à mieux récupérer des efforts intenses.\n"
                        "Chaque répétition en résistance ne doit pas dépasser 5 minutes et le cumul de ces répétitions ne doit pas excéder 45 minutes"),
                CardHeartRange(
                    level: '5',
                    title: 'RÉSISTANCE DURE',
                    heartRateMin: zones['z5']['min'],
                    heartRateMax: zones['z5']['max'],
                    heartPercantageInfos: '>90',
                    text:
                        "Cette zone correspond à un effort très intense. Elle doit être travaillée uniquement sur des efforts fractionnés courts (répétitions de 15 secondes à 2 minutes).\n"
                        "Les bénéfices sont proches de la zone précédente. Mais elle permet de travailler sur des efforts plus courts qui sont plus faciles à gérer pour les débutants."),
              ])),
    );
  }
}
