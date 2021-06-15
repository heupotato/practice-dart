import 'dart:io';
List<int> MinusList(List<int> numList){
    List<int> res = []; 
    numList.forEach((num) { 
        if (!res.contains(num)) res.add(num); 
    });
    return res; 
}
void main(List<String> args) {
    print("Input size of list"); 
    int len = int.parse(stdin.readLineSync()!); 
    print("Input a list of number"); 
    List<int> numList = []; 
    for (int i = 0; i<len; i++)
        numList.add(int.parse(stdin.readLineSync()!)); 
    print(MinusList(numList)); 

}