import 'dart:convert';
import 'dart:io';

Map<String, dynamic> birthdayDict = {}; 
Map<String, int> birthdayMonth = {
    "January": 0, 
    "February": 0, 
    "March": 0, 
    "April": 0, 
    "May": 0, 
    "June": 0, 
    "July": 0, 
    "August": 0, 
    "September": 0, 
    "October": 0,
    "November": 0, 
    "December": 0
}; 
List<String> months = ["January", "February", "March", "April", "May", "June", 
                        "July", "August", "September", "October", "November", "December"]; 

void getBirthdayDict(String path) {
    var file = File(path);
    birthdayDict = jsonDecode(file.readAsStringSync());  
}

void extractMonth(){
    birthdayDict.forEach((key, value) {
        int month = int.parse(value.toString().split('-')[1]); 
        birthdayMonth[months[month - 1]] = birthdayMonth[months[month - 1]]! + 1; 
    }); 
}

void main(List<String> args)  {
    getBirthdayDict("birthdayDict.json");
    extractMonth();  
    birthdayMonth.forEach((key, value) {
        if (value !=0) print("${"$key"}: $value"); 
    }); 
}