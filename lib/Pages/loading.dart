

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/service/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



   void setUpWorldTime() async {
    WorldTime worldTime=WorldTime(location:'Kolkata', flag:'flag.png', url:'Asia/Kolkata');
   await  worldTime.getTime();
   print(worldTime.time);
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':worldTime.location,
     'time':worldTime.time,
     'flag':worldTime.flag,
     'isDayTime':worldTime.isDayTime,
   });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hey, welcome');
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 50,

        ),
      ),
    );
  }
}
