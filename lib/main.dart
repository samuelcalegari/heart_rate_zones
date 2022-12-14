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
                    title: 'R??CUP??RATION',
                    heartRateMin: zones['z1']['min'],
                    heartRateMax: zones['z1']['max'],
                    heartPercantageInfos: '50 ?? 60',
                    text:
                        "Cela correspond ?? un effort tr??s mod??r??, id??al en d??but de s??ance pour vous ??chauffer en douceur et en fin de s??ance pour r??cup??rer activement en ??liminant les d??chets produits par vos muscles durant l'effort."),
                CardHeartRange(
                    level: '2',
                    title: 'ENDURANCE FONDAMENTALE ',
                    heartRateMin: zones['z2']['min'],
                    heartRateMax: zones['z2']['max'],
                    heartPercantageInfos: '60 ?? 70',
                    text:
                        "C'est votre zone de confort ! Celle ?? laquelle vous pouvez parler sans essoufflement intensif.\n"
                        "Apr??s 20 ?? 40 minutes effectu??es dans cette zone, vos muscles vont commencer ?? puiser dans vos graisses.\n"
                        "Cet effort mod??r?? vous permet donc de vous affiner mais aussi, pour les coureurs confirm??s, d'am??liorer votre endurance sur les sorties longues (plus de 1h30).\n"
                        "Vous pouvez courir dans cette zone (presque) sans limite de temps !"),
                CardHeartRange(
                    level: '3',
                    title: 'ENDURANCE ACTIVE',
                    heartRateMin: zones['z3']['min'],
                    heartRateMax: zones['z3']['max'],
                    heartPercantageInfos: '70 ?? 80',
                    text:
                        "L'effort est soutenu mais votre corps est capable de fournir suffisamment d'oxyg??ne pour maintenir cet effort dans la dur??e.\n"
                        "Vos muscles s'habituent ?? mieux consommer les sucres pr??sents dans les fibres musculaires.\n"
                        "Gr??ce ?? ce type d'entra??nement, vous pouvez maintenir vos allures rapides (ex : allure de comp??tition 10 km) pendant une dur??e plus longue.\n"
                        "Mais cet effort ne doit pas se prolonger plus de 45 minutes successives."),
                CardHeartRange(
                    level: '4',
                    title: 'R??SISTANCE',
                    heartRateMin: zones['z4']['min'],
                    heartRateMax: zones['z4']['max'],
                    heartPercantageInfos: '80 ?? 90',
                    text:
                        "Un entra??nement comportant des efforts courts et r??p??t??s dans cette zone vous permet d'am??liorer votre performance sur une distance donn??e (par ex : votre temps au 10km).\n"
                        "Vous apprenez aussi ?? mieux r??cup??rer des efforts intenses.\n"
                        "Chaque r??p??tition en r??sistance ne doit pas d??passer 5 minutes et le cumul de ces r??p??titions ne doit pas exc??der 45 minutes"),
                CardHeartRange(
                    level: '5',
                    title: 'R??SISTANCE DURE',
                    heartRateMin: zones['z5']['min'],
                    heartRateMax: zones['z5']['max'],
                    heartPercantageInfos: '>90',
                    text:
                        "Cette zone correspond ?? un effort tr??s intense. Elle doit ??tre travaill??e uniquement sur des efforts fractionn??s courts (r??p??titions de 15 secondes ?? 2 minutes).\n"
                        "Les b??n??fices sont proches de la zone pr??c??dente. Mais elle permet de travailler sur des efforts plus courts qui sont plus faciles ?? g??rer pour les d??butants."),
              ])),
    );
  }
}
