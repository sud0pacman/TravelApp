import 'package:flutter/material.dart';
import 'package:travel_app/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff031F2B),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          
                  Container(
                    width: 280,
                    height: 210,
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/welcome.png'),
                        ),
                      ),
                    ),
                  ),
          
                  SizedBox(height: 16,),
          
                  Text(
                    'Oddiy hayotdan qoching', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20,
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold
                    ),
                  ),
          
                  SizedBox(height: 16,),
          
                  Text(
                    'Atrofingizdagi ajoyib tajribalarni kashf eting va sizni qiziqarli yashashga majbur qiling!', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffD6D2D2), 
                      fontSize: 14,
                      fontFamily: 'PoppinsLight',
                    ),
                  ),
                ],
              ),
            
              Spacer(),
          
              // Bottom Container
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())
                  )
                },
                child: Container(
                  height: 56,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 60,),
                  decoration: BoxDecoration(
                    color: Color(0xff5EDFFF),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Center(
                    child: Text(
                      'Boshladik', 
                      style: TextStyle(
                        color: Color(0xff031F2B),
                        fontSize: 14,
                        fontFamily: 'PoppinsBold'
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promocard(image) {
    return Container(
      width: 280,
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/welcome.png'),
            ),
          ),
        ),
      ),
    );
  }
}
