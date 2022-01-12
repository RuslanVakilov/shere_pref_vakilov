
import 'package:flutter/material.dart';


class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     return MaterialApp(
       theme: ThemeData(

         brightness: Brightness.dark,
         primaryColor: Colors.lightBlue[800],

         fontFamily: 'Georgia',
         colorScheme: ColorScheme.fromSwatch(
           brightness: Brightness.dark,
           backgroundColor: Colors.black12,
         ),

         textTheme: const TextTheme(
           headline1: TextStyle(
               fontSize: 72.0,
               fontWeight: FontWeight.bold
           ),
           headline6: TextStyle(
               fontSize: 36.0,
               fontStyle: FontStyle.italic
           ),
           bodyText2: TextStyle(
               fontSize: 14.0,
               fontFamily: 'Hind'
           ),
         ),
       ),
      home: Scaffold(

        body: Container(

          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 34),
              SizedBox(height: 17, width: 122),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Регистрация', style: Theme.of(context).textTheme.headline5),
                  Container(
                      height: 100,
                      color: Theme.of(context).colorScheme.secondary
                  ),
                ],
              ),
              const SizedBox(height: 19),
              SizedBox(width: 500,
                child: Image(image:AssetImage('assets/Vector.jpg')),),

              SizedBox(height: 17, width: 122),
              Text('Чтобы зарегестрироваться введите',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),

              SizedBox(height: 5),
              SizedBox(width: 122),
              Text('свой номер телефона и почту',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),

              SizedBox(height: 30,),
              Text('Телефон',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 0.6)),),

              SizedBox(height: 10,),
              const SizedBox(width: 244,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                      labelText: '+7',
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text('Почта',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(0, 0, 0, 0.6)),),

              SizedBox(height: 10,),
              const SizedBox(width: 244,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),

                  ),
                ),
              ),

              SizedBox(height: 20),
              Text('Вам придет четырехзначный код',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),
              SizedBox(height: 5),
              Text(' который будет вашим паролем',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),

              SizedBox(height: 15),
              Text('Изменить пароль можно',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),

              SizedBox(height: 5),
              Text('будет в личном кабинете после',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),
              SizedBox(height: 5),
              Text('регистрации',
                style: TextStyle(fontSize:16, color: Color.fromRGBO(196, 196, 196, 77)),),

              SizedBox(height: 28,),
              SizedBox(width: 154, height: 42,child:
              ElevatedButton(onPressed: (){},
                child: Text('Отправить код'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
              )
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
