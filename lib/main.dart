import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xff176FF2),
                ))),
        textTheme: GoogleFonts.montserratTextTheme(const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff232323),
            ),
            headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff232323),
            ),
            headlineSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff176FF2)),
            bodyLarge: TextStyle(
                fontSize: 13,
                color: Color(0xff3A544F),
                letterSpacing: 0,
                fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(
                color: Color(0xff2DD7A4),
                fontSize: 24,
                fontWeight: FontWeight.w700),
            bodySmall: TextStyle(
              fontSize: 10,
              color: Color(0xffB8B8B8),
            ))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool more = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffE7E9F3),
              Colors.white,
            ])),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  const SizedBox(
                    height: 370,
                    width: 335,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        width: 335,
                        height: 340,
                        'assets/img/main.png',
                      )),
                  Positioned(
                      top: 14,
                      left: 14,
                      child: Image.asset(
                        'assets/img/back.png',
                        width: 40,
                        height: 40,
                      )),
                  Positioned(
                    bottom: 7,
                    right: 14,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: const Color(0xffF2F7FD),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff0038FF).withOpacity(0.1),
                              blurRadius: 20,
                            )
                          ]),
                      child: Image.asset(
                        'assets/img/like.png',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 28, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Coeurdes Alpes',
                          style: themeData.textTheme.headlineLarge,
                        ),
                        Text(
                          'Show map',
                          style: themeData.textTheme.headlineSmall,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 0, 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/img/star.png',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text('4.5 (355 Reviews)',
                              style: themeData.textTheme.bodySmall!.copyWith(
                                  fontSize: 12,
                                  color: Color(0xff606060),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    _ReadMore(
                      themeData: themeData,
                      description: more == false
                          ? 'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....'
                          : 'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining, shopping, and exploring world-class art galleries—are endless in this enchanting mountain paradise. With its stunning natural beauty and vibrant cultural scene, Aspen offers a unique blend of outdoor adventure and sophisticated charm that captivates visitors year-round.',
                      onPressed: () {
                        setState(() {
                          more = !more;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Facilities',
                            style: themeData.textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _FacilitiesItems(
                                themeData: themeData,
                                imagePath: 'assets/img/heater.png',
                                title: '1 Heater',
                              ),
                              _FacilitiesItems(
                                themeData: themeData,
                                imagePath: 'assets/img/dinner.png',
                                title: 'Dinner',
                              ),
                              _FacilitiesItems(
                                themeData: themeData,
                                imagePath: 'assets/img/tub.png',
                                title: '1 Tub',
                              ),
                              _FacilitiesItems(
                                themeData: themeData,
                                imagePath: 'assets/img/pool.png',
                                title: 'Pool',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: themeData.textTheme.headlineMedium!
                                  .copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '\$199',
                              style: themeData.textTheme.bodyMedium,
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(0xff0038FF).withOpacity(0.24),
                                blurRadius: 15,
                                offset: Offset(0, 8))
                          ]),
                          width: 223,
                          height: 56,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Book Now' , style: themeData.textTheme.bodySmall!.copyWith(fontSize: 16 , fontWeight: FontWeight.w700 , color: Colors.white),),
                                  SizedBox(width: 6,),
                                  Image.asset('assets/img/arrow.png', width: 24 ,height: 24,)
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class _FacilitiesItems extends StatelessWidget {
  const _FacilitiesItems({
    super.key,
    required this.themeData,
    required this.imagePath,
    required this.title,
  });

  final ThemeData themeData;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xff176FF2).withOpacity(0.05)),
      width: 72,
      height: 74,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            imagePath,
            width: 32,
            height: 32,
          )),
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: themeData.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class _ReadMore extends StatelessWidget {
  const _ReadMore({
    super.key,
    required this.themeData,
    required this.description,
    required this.onPressed,
  });

  final ThemeData themeData;
  final String description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: themeData.textTheme.bodyLarge,
          ),
          SizedBox(
            height: 6,
          ),
          TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onPressed,
              child: Row(
                children: [
                  Text(
                    more == false ? 'Read more' : 'Read less',
                    style: themeData.textTheme.headlineSmall,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    more == false ? Icons.expand_more : Icons.expand_less,
                    color: themeData.textTheme.headlineSmall!.color,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
