import 'dart:io';

import 'dart:math';

void main(List<String> args) {
    int num = int.parse(stdin.readLineSync()!); 
    int check = 0; 
    for (int i = 2; i<=sqrt(num); i++){
        if (num%i == 0)
        {
            check = 1; 
            break; 
        }
    }
    if (check == 0) print("$num is a prime"); 
    else print("$num is not a prime"); 
}