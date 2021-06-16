import 'dart:io';

final Map<String, String> birthdayDict = {
    "Tasuku Honjo": "27-1-1942", 
    "James P.Allison": "7-8-1948", 
    "Yoshino Akira": "30-1-1948", 
    "Osumi Yoshinori": "9-2-1945", 
    "Albert Einstein": "14-3-1879",
    "Isaac Newton": "4-1-1643", 
    "Nikola Tesla": "9-7-1856", 
    "Marie Curie": "7-11-1867", 
    "Leonardo da Vinci": "15-4-1452", 
    "Galileo Galilei": "15-2-1564", 
    "Charles Darwin": "12-2-1809"

};

void printNameList(){
    print(">>> Welcome to the birthday dictionary. We know the birthdays of:"); 
    birthdayDict.forEach((key, value) => print(key)); 
}

String lookUpBirthday(String name){
    if (birthdayDict.containsKey(name) == false) 
        return (">>>This dictionary doesn't have birthday of `$name`.\nPlease try another name");
    return (">>>$name's birthday is ${birthdayDict[name]}"); 
}
void main(List<String> args) {
    printNameList();
    String option = ""; 
    while(true){
        print(">>> Who's birthday do you want to look up?"); 
        option = stdin.readLineSync()!; 
        if (option == "quit") break; 
        print(lookUpBirthday(option)); 
        print("Press quit to exit or Type another name that you want to look up"); 
    }
}