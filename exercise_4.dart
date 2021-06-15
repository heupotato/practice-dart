import 'dart:io';

import 'dart:math';

void main(List<String> args) {
  List<int> res= []; 
  print("Input a number"); 
  int num = int.parse(stdin.readLineSync()!); 
  for (int i = 1; i<=sqrt(num); i++){
    if (i==sqrt(num)) res.add(i); 
    else if (num%i == 0) res.addAll([i, num~/i]); 
  }
  res.sort(); 
  print(res);
}