import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdpui3/Pages/home_page.dart';
import 'package:pdpui3/Utills/Strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
 late PageController _pageController;
 int currentIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController=PageController(
      initialPage: 0
    );
    super.initState();
  }
   @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex=page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.title1,
                content: Strings.content1,
              ),
              makePage(
                image: "assets/images/image_2.png",
                title: Strings.title2,
                content: Strings.content2,
              ),
              makePage(
                image: "assets/images/image_3.png",
                title: Strings.title3,
                content: Strings.content3,
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(bottom: 60),
           child:Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children:_buildIndicator(),
           ),
          ),
            if(currentIndex==2)
            Container(
              margin: EdgeInsets.only(left: 330,bottom: 60),
              child: GestureDetector(
                onTap:() {Navigator.pushReplacementNamed(context, HomePage.id);},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Skip",style: TextStyle(color: Colors.red,fontSize: 20),),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
  Widget makePage({image,content,title}){
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title,style: TextStyle(color: Colors.red,
                  fontSize: 30),),
              SizedBox(height: 30,),
              Text(content,style: TextStyle(color: Colors.grey,fontSize: 20,),
                textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 6,
      width: isActive? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
  List <Widget> _buildIndicator(){
    List<Widget> indicators =[];
    for(int i=0;i<3;i++){
      if(currentIndex==i){
        indicators.add(_indicator(true),);
      }else{
        indicators.add(_indicator(false),);
      }
    }
    return indicators;
  }
  }
