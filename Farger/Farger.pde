// Et program for å vise hvordan RGB-fargeskalaen fungerer. Endre på fargesammensetningen
// ved hjelp av piltastene. Helt nederst kan du se hva RGB-verdien til fargen er (består av tre tall)

final int RED = 0;
final int GREEN = 1;
final int BLUE = 2;

String[] colors = {
  "rød", "grønn", "blå"
};

int[] rgb = {
  0, 0, 0
};

int chosenColor = RED;
int increment = 5;
void setup() {
  size(displayWidth, displayHeight);
  background(0, 0, 0);
}

void draw() {
  background(rgb[RED], rgb[GREEN], rgb[BLUE]);
  printChosenColor();
  printAllColors();
  printHelp();
}

void printHelp() {
  String[] helpText = {
    "HJELP: ", "r - Rød", "g - Grønn", "b - Blå", "h - Hvit", "s - Svart", "a - Avslutt", 
    "pil opp - mer farge", "pil ned - mindre farge", "Tall 1-9 - avstand mellom tall"
  };

  textSize(9);
  textAlign(LEFT);
  fill(rgb[GREEN]+100, rgb[BLUE]-150, rgb[RED]-50);
  for (int i = 0; i < helpText.length; i++) {
    text(helpText[i], 20, 30 + (i*15));
  }
}

void printAllColors() {
  textAlign(CENTER);
  textSize(12);
  String rgbText = "Rød: " + rgb[RED] + ", Grønn: " + rgb[GREEN] + ", Blå: "+ rgb[BLUE];
  fill(rgb[GREEN]+100, rgb[BLUE]-150, rgb[RED]-50);
  text(rgbText, width/2, height-65);
}

void printChosenColor() {
  textAlign(CENTER);
  fill(0, 0, 0);
  textSize(25);
  fill(rgb[GREEN]+100, rgb[BLUE]-150, rgb[RED]-50);
  text("endrer nå på: " + colors[chosenColor] + "fargen", width/2, height/2);
}

void keyPressed() {

  final int redButton = 82;
  final int greenButton = 71;
  final int blueButton = 66;
  final int whiteButton = 72;
  final int blackButton = 83;
  final int exitButton = 65;

  switch (keyCode) {
  case redButton: 
    chosenColor = 0; 
    break; 
  case greenButton: 
    chosenColor = 1; 
    break;
  case blueButton: 
    chosenColor = 2; 
    break;
  case whiteButton: 
    rgb[RED] = 255; 
    rgb[GREEN] = 255; 
    rgb[BLUE] = 255; 
    break;
  case blackButton: 
    rgb[RED] = 0; 
    rgb[GREEN] = 0; 
    rgb[BLUE] = 0; 
    break;
  case exitButton: 
    exit(); 
    break;
  case UP: 
    rgb[chosenColor] = getNewValidValue(rgb[chosenColor] + increment); 
    break;
  case DOWN: 
    rgb[chosenColor] = getNewValidValue(rgb[chosenColor] - increment); 
    break;
  default: 
    if ( isNumberKey(keyCode) ) increment = getNumberKey(keyCode); 
    break;
  }
}

int getNumberKey(int keCode) {
  return keCode - 48;
}

boolean isNumberKey(int keCode) {
  if (keCode >= 48 && keCode <= 57) {
    return true;
  }
  return false;
}

int getNewValidValue(int val) {
  if (val < 0) return 0;
  if (val > 255) return 255;
  else return val;
}

