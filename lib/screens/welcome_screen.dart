import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    //animation controller will need a ticker and duration
    //the parent class will work like a ticker most of the times
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    //their can be many custom animations such as tweens(align,border radius, color) and curved animation and many more.
    //tween animation needs a begin color and a end color => soft transition between begin color and end color
    //curved animation needs a parent(animation controller) and a curve. Their are many curves in the flutter package

    //animation can also be applied by using custome packages from pub which is very easy

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward(); //to take the animation forward
    //controller.reverse(from:1.00);

    //adds a callback whenever controller changes a value
    controller.addListener(() {
      //setState needs to be called becaue to render the screen again
      setState(() {});
      print(animation.value);
    });

    //adds a callback whenever an animation cycle is finish
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //the forward animation is complete
      } else if (status == AnimationStatus.dismissed) {
        //the reverse animation is completed
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //dont forget to dispode the resources allocated
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),

            //rounded button
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              tag: 'login_button',
              onPress: () {
                //go to the login screen
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              tag: 'register_button',
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
