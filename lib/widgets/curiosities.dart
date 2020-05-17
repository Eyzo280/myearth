import 'package:flutter/material.dart';

class Curiosities extends StatefulWidget {
  @override
  _CuriositiesState createState() => _CuriositiesState();
}

class _CuriositiesState extends State<Curiosities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Earth Ciekawostki"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Text("Czym jest więc zanieczyszczenie powietrza?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(""),
            Text(
                "Smog jest nienaturalnym zjawiskiem atmosferycznym, które polega na współistnieniu związków chemicznych oraz pyłów w naszej atmosferze. Przebywanie, oddychanie nim, zagraża naszemu zdrowiu i życiu. Pochodzenie słowa smog ma swoje korzenie w dwóch anglojęzycznych słowach: smoke – dym oraz fog – mgła."),
            Text(""),
            Text("Rodzaje smogu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(""),
            Text(
                "Jednym z wymienianych rodzajów jest smog londyński. W jego skład wchodzą tlenek siarki (IV), tlenki azotu, tlenki węgla, sadza oraz wspomniane już trudno opadające pyły."),
            Text(
                "Drugim, znanym rodzajem smogu jest smog typu Los Angeles (inaczej tzw. smog fotochemiczny). Występuje on przede wszystkim w miesiącach letnich, w strefach subtropikalnych. W jego skład wchodzą: tlenki węgla, tlenki azotu i węglowodory."),
            Text(""),
            Text(
                "Dopuszczalne normy dla zanieczyszczeń powietrza ustaliły osobno Polska, Unia Europejska a także WHO, czyli Światowa Organizacja Zdrowia.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(""),
            Text(
                "W Polsce normy dla pyłów drobnych PM10 są ustalone na trzech poziomach:"),
            Text(""),
            Text("• poziom dopuszczalny 50 µg/m3 (dobowy)"),
            Text("• poziom informowania 200 µg/m3 (dobowy)"),
            Text("• poziom alarmowy 300 µg/m3 (dobowy)"),
            Text(""),
            Text(
                "Z kolei Unia Europejska dla pyłów drobnych PM10 i PM2,5 ustaliła jedynie poziom dopuszczalny, odpowiednio dla PM10 – 50 µg/m3 (dobowy) i 40 µg/m3 (średni-roczny), a dla pyłu PM2,5 – 25 µg/m3 (średni-roczny)."),
            Text(
                "Normy odnośnie dopuszczalnych stężeń dobowych ustalone przez Światową Organizację Zdrowia, to i 25 μg/m3 dla PM2.5 oraz 50 μg/m3 dla PM10."),
            Text(""),
            Text("Przyczyny zanieczyszczenia powietrza",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(""),
            Text(
                "Smog powstaje na skutek wymieszania powietrza z zanieczyszczeniami i spalinami, powstającymi w efekcie działalności człowieka. Odpowiadają za to fabryki, coraz większa liczba samochodów, palenie węglem, drewnem i innymi paliwami stałymi w piecach. Za jego pojawienie się odpowiada również pogoda, klimat czy ogólne uwarunkowania terenu. O wiele trudniej będzie pozbyć się zanieczyszczeń, gdy jakieś miasto leży w kotlinie, a bezwietrzna pogoda uniemożliwia ich rozprzestrzenienie się i rozrzedzenie, sprawiając że zawisają nad miejscowością."),
            Text(""),
            Text(
                "Niestety, występuje również zjawisko rozprzestrzeniania się zanieczyszczeń na inne obszary, czyli tak zwany smog napływowy. Z pewnością w ten sposób oczyszcza się powietrze w jednym miejscu, jednak staje się ono bardziej zanieczyszczone w drugim. Warto też wiedzieć, że w Polsce mamy do czynienia nie tylko ze smogiem typu londyńskiego, lecz również typu Los Angeles, z uwagi na zanieczyszczenia komunikacyjne."),
            Text(""),
            Text("Skutki zanieczyszczeń powietrza",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(""),
            Text(
                "Skutki zanieczyszczenia powietrza są bardzo łatwo zauważalne – wszyscy widzimy gęsty dym, zalegający nad miastem i każdemu z nas gorzej się takim zanieczyszczonym powietrzem oddycha. Skutki smogu są jednak o wiele bardziej dalekosiężne, niż się niektórym wydaje – ma on bowiem bardzo duży wpływ na nasze zdrowie, prowadząc (przy dłuższej ekspozycji) między innymi do:"),
            Text(""),
            Text("• pojawienia się alergii oraz astmy"),
            Text("• wywołania niewydolności oddechowej"),
            Text("• obniżenia odporności całego organizmu"),
            Text("• wywołania chorób układu krwionośnego i serca"),
            Text("• pojawienia się chorób nowotworowych."),
            Text(""),
            Text(
                "Skutki zanieczyszczenia powietrza odczuwamy również pośrednio, na przykład zjadając skażone nim mięso zwierząt, czy rośliny, które w takich warunkach wzrastały. Agresywne czynniki chemiczne oddziałują bowiem nie tylko na ludzi, lecz także i zwierzęta czy rośliny, a nawet materiały (w tym budowlane). Skutki zanieczyszczeń powietrza czasem się odwlekają, lecz czasem są widoczne natychmiast – najlepiej o tym może świadczyć na przykład znany z historii Wielki smog londyński, który utrzymywał się w 1952 roku ledwie przez 5 dni, ale wywołał 4 tysiące zgonów związanych z komplikacjami oddechowymi po jego wdychaniu. W następnych tygodniach zmarło dalsze 8 tysięcy osób. Skutki smogu były tak katastrofalne, że do dziś rządy zastanawiają się jak jeszcze zmniejszyć jego powstawanie."),
          ],
        ),
      ),
    );
  }
}
