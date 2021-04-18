import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    var n = 0;
    var score = 0;
    List que =[
      questions("1.My laptop is acer.", "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFwdG9wfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", true),
      questions("2.My mobile is vivo.", "https://images.unsplash.com/photo-1586953208448-b95a79798f07?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHBob25lfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", true),
      questions("3.My bike is RC200.","https://images.unsplash.com/photo-1598209279122-8541213a0387?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmMyMDB8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", true),
      questions("4.My car is Lambho.","https://images.unsplash.com/photo-1516515429572-bf32372f2409?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGxhbWJvfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", true),
      questions("5. My favorite city is Paris","https://images.unsplash.com/photo-1569949380643-6e746ecaa3bd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHRvdXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", true),
    ];

    void check(bool choice, BuildContext ctx)
    {
      if(choice == que[n].ans)
        {
          score = score + 1;
          final snackbar = SnackBar(content: Text('Correct Answer'),duration: Duration(milliseconds: 500),backgroundColor: Colors.green,);
          // ignore: deprecated_member_use
          Scaffold.of(ctx).showSnackBar(snackbar);
        }
      else{
        final snackbar = SnackBar(content: Text('Wrong Answer'),duration: Duration(milliseconds: 500),backgroundColor: Colors.red,);
        // ignore: deprecated_member_use
        Scaffold.of(ctx).showSnackBar(snackbar);
      }
      setState(() {
        if(n<que.length-1)
          {
            n = n+1;
          }
        else{
          final snackbar = SnackBar(content: Text('Quiz Completed Score : $score/3 '),duration: Duration(seconds: 3),backgroundColor: Colors.lightBlueAccent,);
          // ignore: deprecated_member_use
          Scaffold.of(ctx).showSnackBar(snackbar);
          reset();
        }
      });
    }

    void reset()
    {
      setState(() {
        n = 0;
        score = 0;
      });
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE2F3F4),
        appBar: AppBar(
          backgroundColor: Color(0xffD0D5D6),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("True",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(" or",style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold,fontSize: 25),),
              Text(" False",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            ],
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Builder(
          builder: (ctx) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(15),
                child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                    child: Expanded(child: Image.network(que[n].imgurl))),
              ),
              //SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                height: 105.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                  border: Border.all(color: Colors.blue.shade600,width: 5)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(que[n].que,style: TextStyle(fontSize: 16,color: Colors.blue.shade700),)
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      child: Icon(Icons.check,color: Colors.black ,),
                      color: Colors.greenAccent.shade700,
                      onPressed:() => check(true, ctx),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed:() => check(false, ctx),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    child:  Icon(Icons.close),
                    color: Colors.red.shade700,
                  ),
                ],
              ),
              SizedBox(height: 35,),
              Container(
                margin: EdgeInsets.only(left: 25,right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Score: $score/5",style: TextStyle(color: Colors.blue.shade800,fontSize: 18,fontWeight: FontWeight.w800),),
                    InkWell(
                        onTap: () => reset(),
                        child: Text("Reset",style: TextStyle(color: Colors.blue.shade800,fontSize: 18,fontWeight: FontWeight.w800),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class questions{
  final String que;
  final String imgurl;
  final bool ans;

  questions(this.que, this.imgurl, this.ans);

}

