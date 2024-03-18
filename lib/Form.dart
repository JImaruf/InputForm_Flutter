import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

enum Gender { Male, Female, Other }

class _MyFormState extends State<MyForm> {
  _MyFormState(){
    _selectedValue=_countryList[0];
  }

  Gender? _gender;
  bool? _checkboxMovies = false;
  bool? _checkboxPlayGames = false;
  bool? _checkboxOther = false;
  final _countryList = ["Choose","Bangladesh", "India", "Nepal", "Srilanka"];
  String? _selectedValue = "";
  String? _date="dd/mm/yyyy";
  String? _time="hh/mm/ss";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Form'),
        actions: [
          ElevatedButton(onPressed: () {}, child: Text("Save")),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    label: Text('Email'),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                )

              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Choose Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<Gender>(
                      tileColor: Colors.grey[200],
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      value: Gender.Male,
                      groupValue: _gender,
                      title: Text(Gender.Male.name),
                      onChanged: (val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: RadioListTile<Gender>(
                      contentPadding: EdgeInsets.all(0.0),
                      tileColor: Colors.grey[200],
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      value: Gender.Female,
                      groupValue: _gender,
                      title: Text(Gender.Female.name),
                      onChanged: (val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: RadioListTile<Gender>(
                      contentPadding: EdgeInsets.all(0.0),
                      tileColor: Colors.grey[200],
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      value: Gender.Other,
                      groupValue: _gender,
                      title: Text(Gender.Other.name),
                      onChanged: (val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // DropdownButton(
              //     value: _selectedValue,
              //     items: _countryList.map((e) {
              //       return DropdownMenuItem(
              //         child: Text(e),
              //         value: e,
              //       );
              //     }).toList(),
              //     onChanged: (val) {
              //       setState(() {
              //         _selectedValue = val as String;
              //       });
              //     }),

              DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle,


                color: Colors.blueAccent,),

                  value: _selectedValue,
                  dropdownColor: Colors.green,


                  decoration: InputDecoration(

                    border: UnderlineInputBorder(),


                    label: Text("Choose Country",style: TextStyle(fontSize: 18,color: Colors.black),),



                  ) ,
                  items: _countryList.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val as String;
                    });
                  }
              ),
              SizedBox(
                height: 10,
              ),
              Text("Interest",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              // Checkbox(
              //     activeColor: Colors.green,
              //     checkColor: Colors.white,
              //     value: _checkbox,
              //
              //     onChanged: (val) {
              //       setState(() {
              //         _checkbox = val;
              //       });
              //     }),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.all(0),
                        value: _checkboxMovies,
                        title: Text('Movie'),
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (val) {
                          setState(() {
                            _checkboxMovies = val;
                          });
                        }),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                        value: _checkboxPlayGames,
                        title: Text('Play Games'),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (val) {
                          setState(() {
                            _checkboxPlayGames = val;
                          });
                        }),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        value: _checkboxOther,
                        title: Text('Other'),
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                        onChanged: (val) {
                          setState(() {
                            _checkboxOther = val;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date of Birth :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                  ),),
                  Text(_date.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                  ),),


                  IconButton(onPressed: ()async{
                    DateTime?  datepicked = await showDatePicker (
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030)
                    );
                    if(datepicked!=null)
                      {
                          _date = datepicked.day.toString()+"/"+datepicked.month.toString()+"/"+datepicked.year.toString();
                          print(_date);
                          setState(() {
                            _date = _date;
                          });
                      }

                  }, icon: Icon(Icons.calendar_month,color: Colors.blueAccent,size: 30,))

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Submit Time :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                  ),),
                  Text(_time.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                  ),),


                  IconButton(onPressed: ()async{
                    TimeOfDay?  pickedTime =await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial
                    );
                    if(pickedTime!=null)
                    {
                      String ampm='AM';
                      String hour = "";
                      hour = pickedTime.hour.toString();

                      if(pickedTime.hour>=12)
                        {
                          ampm = "PM";


                          if(pickedTime.hour>12)
                            {
                              hour = (pickedTime.hour-12).toString();
                            }

                        }

                      _time = hour+":"+pickedTime.minute.toString()+" "+ampm;

                      setState(() {
                        _time = _time;
                      });
                    }

                  }, icon: Icon(Icons.watch_later,color: Colors.blueAccent,size: 30,))

                ],
              ),
              TextFormField(
                maxLines: 3,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Comment")
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password")
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton(


                      onPressed: (){}, child: Text("Cancel")),
                  ElevatedButton(

                      onPressed: (){}, child: Text("Submit")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
