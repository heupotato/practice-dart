import 'dart:io';

int maxNum(List<int> numbers){
    int res = numbers[0]; 
    numbers.forEach((element) {if (element > res) res = element; }); 
    return res; 
}
void main(List<String> args) {
    print("Input three numbers"); 
    List<int> numbers = []; 
    for (int i = 0; i<3; i++) numbers.add(int.parse(stdin.readLineSync()!)); 
    print("The maximum of three number is ${maxNum(numbers)}"); 
}