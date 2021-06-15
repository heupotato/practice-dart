import 'dart:io';

void drawLine(int w){
    for (int i = 0; i<w; i++)stdout.write(" ---"); 
    print(""); 
}
void drawSeperate(int w){
    for (int i = 0; i<w; i++) stdout.write("|   ");   
    print("|");
}

void main(List<String> args) {
    print("Input size of gameboard you want to draw"); 
    stdout.write("Heigth: ");  
    int h = int.parse(stdin.readLineSync()!); print(""); 
    stdout.write("Width: "); 
    int w = int.parse(stdin.readLineSync()!); print("");
    for (int i = 0; i<h; i++)
    {
        drawLine(w); 
        drawSeperate(w); 
    }
    drawLine(w); 
}