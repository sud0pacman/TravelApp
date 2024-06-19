import 'dart:ui';

import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final String name;
  final String location;
  final String image;
  InfoScreen(
      {super.key,
      required this.name,
      required this.location,
      required this.image});

  @override
  State<InfoScreen> createState() =>
      _InfoScreenState(name: name, location: location, image: image);
}

class _InfoScreenState extends State<InfoScreen> {
  final String name;
  final String location;
  final String image;


  _InfoScreenState(
      {required this.location, required this.image, required this.name});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff031F2B),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Text(''), // for remove def na
              backgroundColor: Color(0xff031F2B),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('clicked');
                          Navigator.of(context).pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(24.0),
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PoppinsLight',
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(
                            '4.7',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'PoppinsBold'),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffE58F3F),
                          ),
                          SizedBox(
                            width: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    mySectionTitle('Batafsil'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      name == "Zomin" || name == "Zomin tog'lari"? inoformations[0]
                          : name == "Orol dengizi" ? inoformations[1]
                          : name == "Kapadokiya" ? inoformations[2]
                          : name == "Grumant" ? inoformations[3]
                          : name == "Island" ? inoformations[4]
                          : inoformations[5],
                      style: TextStyle(
                          color: Color(0xffD6D2D2),
                          fontFamily: 'PoppinsRegular',
                          fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:
                              myCategory('assets/images/map.png', 'Joylashuv'),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          flex: 1,
                          child:
                              myCategory('assets/images/network.png', 'Manba'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mySectionTitle(String title) => Text(
        title,
        style: TextStyle(
            color: Colors.white, fontFamily: 'PoppinsBold', fontSize: 16),
      );

  Widget myCategory(
    String image,
    String title,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff5EDFFF), width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff5EDFFF),
                  fontFamily: 'PoppinsMedium',
                  fontSize: 14),
            )
          ],
        ),
      );
}

List<String> inoformations = [
  '''
    Zomin — O'zbekistonning Jizzax viloyatida joylashgan go'zal shahar va tuman. Zarafshon tog' tizmasining etagida, baland tog'lar va zich o'rmonlar bilan o'ralgan. Zomin tumani o'zining boy tabiiy resurslari, toza havo va mineral buloqlari bilan mashhur. Ayniqsa, Zomin milliy bog'i bu yerning diqqatga sazovor joylaridan biri bo'lib, bu yerda noyob flora va fauna turlari mavjud. Bog' O'zbekistonning eng katta va eng qadimiy milliy bog'laridan biri hisoblanadi.

Shahar va tuman aholisi asosan qishloq xo'jaligi, bog'dorchilik va chorvachilik bilan shug'ullanadi. Bu hududda yetishtiriladigan meva va sabzavotlar yuqori sifatli bo'lib, bozorlarda katta talabga ega. Zominda turizm sohasida ham katta salohiyat mavjud bo'lib, har yili minglab sayyohlar bu go'zal maskanni ziyorat qilishadi. Ayniqsa, tog' va o'rmonlar orasidagi piyoda sayohatlar va dam olish maskanlari mashhur.

Zominda qadimiy madaniyat va urf-odatlar saqlanib qolgan. Har yili turli madaniy va sport tadbirlari o'tkaziladi, bu esa aholining faolligini oshiradi va mehmonlarni jalb qiladi. Zominning tabiiy boyliklari, go'zal manzaralari va tinchligi uni O'zbekistonning eng jozibador joylaridan biriga aylantiradi. Bu yerda vaqt o'tkazish nafaqat tanani, balki ruhni ham tinchlantiradi. 
    '''.trim(),
  '''
    
Orol dengizi — Markaziy Osiyoda joylashgan, O'zbekiston va Qozog'iston hududlarida joylashgan katta ko'l bo'lib, bir paytlar dunyoning to'rtinchi yirik ko'li hisoblangan. Biroq, 1960-yillardan boshlab, Amudaryo va Sirdaryo daryolaridan suvning sug'orish uchun ortiqcha olinishi natijasida dengizning sathi keskin pasayib ketdi. Bu jarayon Orol dengizining ekologik inqiroziga olib keldi, natijada ko'lning katta qismi qurib qolgan va dengiz sathi sezilarli darajada qisqargan.

Orol dengizining qurishi hududdagi ekologik muvozanatga katta ta'sir ko'rsatdi. Suv sathining pasayishi bilan ko'lning tuz va minerallarga boy tubi ochilib, kuchli shamollar bu moddalarni keng hududlarga tarqatmoqda. Bu esa hududda yashovchi aholining sog'lig'iga va qishloq xo'jaligiga salbiy ta'sir ko'rsatmoqda. Ko'p sonli baliq turlari yo'qolgan va baliqchilik sanoati deyarli yo'q bo'lib ketgan.

Orol dengizining ekologik inqirozi butun dunyo e'tiborini tortdi. Bir qator xalqaro tashkilotlar va davlatlar bu muammoni hal qilish uchun turli loyihalar va dasturlarni amalga oshirmoqda. Masalan, Orolni tiklash va uning atrofidagi muhitni yaxshilash uchun suvni tejash va daryo suvlarini qayta tiklash choralari ko'rilmoqda. Shunday bo'lsa-da, Orol dengizini to'liq tiklash juda murakkab va uzoq muddatli jarayon bo'lib qolmoqda.
    '''.trim(),
  '''
    Kapadokiya — Turkiyaning markaziy qismida joylashgan tarixiy va tabiiy hudud bo'lib, u o'zining noyob geologik tuzilmalari, qadimiy tarixi va go'zal manzaralari bilan mashhur. Kapadokiya hududi asosan Nevşehir, Kayseri, Aksaray va Niğde viloyatlarini o'z ichiga oladi. Bu hududning eng diqqatga sazovor joylaridan biri uning erode qilingan vulqon toshlaridan hosil bo'lgan peri bacalari (qo'ziqorin shaklidagi qoyalar) va yer osti shaharlaridir.

Kapadokiya tarixda ko'plab sivilizatsiyalarning kesishgan joyi bo'lgan. Bu hududda eramizdan avvalgi davrlardan boshlab odamlar yashagan va turli madaniyatlar iz qoldirgan. Ayniqsa, xristianlikning ilk davrlarida bu yerda ko'plab monastirlar, cherkovlar va yerto'lalar qurilgan. Qoyalar ichida joylashgan bu yodgorliklar bugungi kunda ham sayyohlarni o'ziga jalb qiladi. Göreme milliy bog'i va uning atrofidagi qoyatosh cherkovlari YUNESKOning Jahon merosi ro'yxatiga kiritilgan.

Kapadokiyaning tabiiy go'zalligi va tarixi uni Turkiyaning eng mashhur sayyohlik maskanlaridan biriga aylantirgan. Issiq havo sharlarida uchish va qoyatoshlar orasida piyoda sayohat qilish kabi faoliyatlar sayyohlar orasida juda mashhur. Shuningdek, Kapadokiya o'zining an'anaviy turar joylari — tosh uylari va g'or mehmonxonalari bilan ham tanilgan. Bu yerga tashrif buyurganlar noyob tabiat va boy tarixning uyg'unligidan zavq olishadi.
    '''.trim(),
  '''
    Grumant mehmonxonasi — Rossiyaning Tula viloyatida joylashgan mashhur turar joy maskani. Bu mehmonxona o'zining qulay joylashuvi va yuqori sifatli xizmatlari bilan tanilgan. Grumant mehmonxonasi Tula shahridan tashqarida, go'zal tabiiy manzaralar orasida joylashgan bo'lib, dam olish va tabiat bilan uyg'unlashgan holda vaqt o'tkazish uchun ideal joydir.

Mehmonxona zamonaviy va an'anaviy dizaynni o'zida mujassam etgan bo'lib, turli xil qulayliklar va xizmatlar bilan ta'minlangan. Xonalar keng va shinam, zamonaviy mebel va texnika bilan jihozlangan. Har bir xonada televizor, mini-bar, bepul Wi-Fi va shaxsiy hammom mavjud. Grumant mehmonxonasi mehmonlariga turli xil oziq-ovqat va ichimliklar taklif etuvchi restoran hamda bar xizmat qiladi. Restoranda milliy va xalqaro taomlar tayyorlanadi.

Shuningdek, mehmonxona hududida sport zali, sauna, spa markazi va suzish havzasi mavjud. Bu yerda dam olish va salomatlikni tiklash uchun barcha sharoitlar yaratilgan. Bolalar uchun o'yin maydonchalari va animatsion dasturlar ham mavjud, bu esa oilaviy dam olish uchun qulaylik yaratadi.

Grumant mehmonxonasi mehmonlarga nafaqat qulay turar joy, balki qiziqarli va mazmunli vaqt o'tkazish imkoniyatini ham taqdim etadi. Atrofdagi tabiat va diqqatga sazovor joylar, masalan, tarixiy va madaniy obidalar sayyohlarni o'ziga jalb qiladi. Tula viloyatining bu go'zal burchagida joylashgan Grumant mehmonxonasi har bir tashrif buyurgan mehmonning yodida uzoq vaqt saqlanib qoladi.
    '''.trim(),
  '''
    Bali — Islandiyaning janubi-g'arbiy qismida, Rangárþing eystra munitsipalitetida joylashgan kichik shahar. Bu go'zal shahar Eyjafjallajökull vulqoni etagida joylashgan bo'lib, tabiiy manzaralari va sayyohlik joylari bilan mashhur. Bali shahri o'zining tinch va osoyishta muhiti, mehmondo'st aholisi bilan tanilgan.

Shahar aholisi asosan qishloq xo'jaligi, chorvachilik va turizm bilan shug'ullanadi. Bali shahri yaqinida mashhur Seljalandsfoss va Skógafoss sharsharalari joylashgan bo'lib, bu joylar yil davomida minglab sayyohlarni jalb qiladi. Bali shahridan osonlik bilan yetib boriladigan ushbu tabiiy go'zalliklar Islandiyaning diqqatga sazovor joylari orasida alohida o'ringa ega.

Bali shahri kichik bo'lishiga qaramay, zamonaviy qulayliklarga ega. Bu yerda mehmonxonalar, restoranlar, kafelar va do'konlar mavjud. Shahar atrofida ko'plab piyoda yurish yo'llari va sayohat yo'nalishlari mavjud bo'lib, tabiatni sevuvchilar uchun juda mos keladi. Bali shahri, shuningdek, Islandiyaning mashhur "Ring Road" trassasi bo'ylab joylashgan, bu esa uni mamlakatning boshqa qismlariga sayohat qilish uchun qulay maskanga aylantiradi.

Shahar yaqinida bo'lgan Bali xalqaro ot poygasi festivali ham sayyohlar uchun katta qiziqish uyg'otadi. Bu festivalda Islandiyaning an'anaviy otlari namoyish etiladi va turli musobaqalar o'tkaziladi. Bali shahri tabiati, tinchligi va boy madaniyati bilan Islandiyaga tashrif buyuruvchilar uchun unutilmas tajriba taqdim etadi.
    '''.trim(),
  '''
    Dubay — Birlashgan Arab Amirliklarining eng yirik shahri va mashhur sayyohlik markazi. Fors ko'rfazi bo'yida joylashgan bu shahar o'zining zamonaviy arxitekturasi, hashamatli savdo markazlari va boy madaniyati bilan tanilgan. Dubay dunyodagi eng baland bino — Burj Xalifa bilan mashhur bo'lib, bu inshoot shaharning ramziga aylangan. Shahar markazida joylashgan Dubay moliyaviy markazi va Dubay moliyaviy bozori ham global iqtisodiyotda muhim rol o'ynaydi.

Dubayning diqqatga sazovor joylari orasida Dubay Mall, Palm Jumeirah sun'iy orollari va Dubay Marina ajralib turadi. Dubay Mall dunyodagi eng katta savdo markazlaridan biri bo'lib, unda minglab do'konlar, restoranlar, akvarium va boshqa ko'ngilochar joylar mavjud. Palm Jumeirah esa sun'iy yaratilgan orollar majmuasi bo'lib, unda hashamatli mehmonxonalar, villalar va dam olish maskanlari joylashgan.

Dubayning issiq iqlimi va go'zal plyajlari yil davomida sayyohlarni jalb qiladi. Jumeirah Beach kabi mashhur plyajlarida dam olish, suv sportlari bilan shug'ullanish mumkin. Dubayda har yili ko'plab xalqaro tadbirlar va festivallar o'tkaziladi, masalan, Dubay xalqaro moliyaviy forumi va Dubay savdo festivali.

Dubay, shuningdek, madaniy jihatdan ham boydir. Shaharda ko'plab muzeylar, san'at galereyalari va madaniyat markazlari mavjud. Dubay madaniyati arab va islom an'analariga asoslangan bo'lsa-da, bu yerda dunyoning turli burchaklaridan kelgan odamlar tinch-totuv yashaydi. Zamonaviylik va an'anaviylikni uyg'unlashtirgan Dubay shahar har bir tashrif buyuruvchiga unutilmas tajriba taqdim etadi.
    '''
];
