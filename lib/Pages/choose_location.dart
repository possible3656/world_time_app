import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    // print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(
          'Choose location',
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.05,
          ),
        ),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: ()  {
                 updateTime(position);
                },
                title: Text(locations[position].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('asset/${locations[position].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> updateTime(int position) async {

    WorldTime worldTime = locations[position];
    await worldTime.getTime();
    print(worldTime.time);

    Navigator.pop(context,  {
      'location': worldTime.location,
      'time': worldTime.time,
      'flag': worldTime.flag,
      'isDayTime': worldTime.isDayTime,
    });
  }
}
