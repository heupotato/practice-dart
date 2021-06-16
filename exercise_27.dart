import 'dart:convert';
import 'dart:io';

Map<String, dynamic> birthdayDict = {}; 

void getBirthdayDict(String path) {
    var file = File(path);
    birthdayDict = jsonDecode(file.readAsStringSync());  
}
void printNameList(){
    print(">>> Welcome to the birthday dictionary. We know the birthdays of:"); 
    birthdayDict.forEach((key, value) => print(key)); 
}

String lookUpBirthday(){
    print(">>> Who's birthday do you want to look up?"); 
    String name = stdin.readLineSync()!; 
    if (isExistInList(name) == false) 
        return (">>>This dictionary doesn't have birthday of `$name`.\nPlease try another name");
    return (printBirthday(name)); 
}

bool isExistInList(String name){
    return birthdayDict.containsKey(name); 
}

String printBirthday(String name){
    return (">>>$name's birthday is ${birthdayDict[name]}"); 
}

void addBirthdayDictMap() {
    print("Input name of person you want to add:"); 
    String name = stdin.readLineSync()!; 
    if (isExistInList(name)) {
        print("This name's already existed in the Dict"); 
        print(printBirthday(name)); 
        return; 
    }
    print("Input their birthday (format: DD-MM-YYYY): ");
    String birthday = stdin.readLineSync()!;    
    birthdayDict.addAll({"$name": "$birthday"}); 
    addBirthdayJson("birthdayDict.json"); 
    print("Name: $name - Birthday: $birthday"); 
}

void  addBirthdayJson(String path) {
    var jsonStr = jsonEncode(birthdayDict); 
    final file = File(path); 
    List<String> jsonParts = jsonStr.split(","); 
    jsonStr = jsonParts.join(",\n");
    file.writeAsStringSync(jsonStr); 
}
void main(List<String> args)  {
    getBirthdayDict("birthdayDict.json"); 
    printNameList();
    String option = "0"; 
    while(option != "3"){
        print("Make choice: \nPress 1 to look up for a person's birthday\nPress 2 to add birthday of specific person\nPress 3 to quit"
            +"\nPress 4 to see list"); 
        option = stdin.readLineSync()!; 
        switch (option){
            case "1": 
                print(lookUpBirthday()); 
                break; 
            case "2": 
                addBirthdayDictMap(); 
                break; 
            case "3": 
                break; 
            case "4": 
                printNameList(); 
                break; 
            default: 
                print("There's no such choice. Please try again"); 
        }
    }
}