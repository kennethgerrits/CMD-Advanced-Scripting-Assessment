//////////////////////////////////////////////////////////////////////////////////

// Student:        Kenneth Gerrits

// Studentnummer:  2125449

// Groepnummer:    F3

// Docent:         Adriana

// Datum:          22-03-2018

// Opdrachtnummer: Eindproduct

// Titel:          Eindproduct Kenneth Gerrits

// Beschrijving:   Een kleurrijke boerderij, waarbij het dag / nachtleven bepaald wordt door je X-positie van je muis. Ook heb ik een font en image toegevoegd (zie hiervoor de data map).
// Probeer ook de volgende knoppen uit:
// 1,2,3,4,a,b,linkermuisknop,rechtermuisknop voor kleur interacties, houd 'p' ingedrukt voor een slowmotion + sterrenhemel (werkt natuurlijk alleen 's-nachts.)



////////////////////////////////////////////////////////////////////////////////
//niet alle variabelen staan hier (ik heb ze alle 6 gebruikt)
final String myName = "Kenneth Gerrits"; 
String check;
int xPosition = 25;
int xDirection = 3;
//(bonus) font + image
PFont font1;
PImage vogel;
boolean kleur;
color wit = 255;

void setup(){
size(1300,800); 
font1 = loadFont("CopperplateGothic-Light-48.vlw");
vogel = loadImage("bird.png");
}

void draw(){
background(wit);
textFont(font1);
frameRate(100);
colorMode(RGB);
  //Check over de achtergrond kleur
 if(mouseX>width/2){
 check = "dag"; 
 }
 
 //Check over de achtergrond kleur
 if(mouseX<width/2){
  check = "nacht"; 
 }
 //uitvoeren achtergrond kleur
  if(check == "dag"){
    //gebruik RGB
     fill(38, 195, 219);
  rect(0, 0, 1300, 500 );
  }
   //uitvoeren achtergrond kleur
  if(check == "nacht"){
    //gebruik opacity.
   fill(0,0,0,200);
  rect(0, 0, 1300, 500 );
   }
 
 //ZON (rechts)
  if(mouseX>width/2){
    //gebruik hexadecimal
    fill(#FDB813);
    ellipse(mouseX,mouseY,150,150);
     }
 //MAAN (links)
  else{
    fill(#FEFCD7);
    arc(mouseX+20,mouseY-10,150,150,0.5,PI+QUARTER_PI,CHORD);
    }
//sterrenhemel en slowmotion
if (keyPressed && key == 'p') {
 if(check == "nacht"){
  fill(#FFFF00);
        spacen();
        frameRate(10);
    }
}
     
  //Zelf gemaakte variabelen
   gras();
   koe();
   naam();
   bal();
   //gebruik parameter
   doos(50);
   drol();
   //colormode terug zetten naar RGB, omdat de functie drol HSB bevat
   colorMode(RGB);
   
   //gebruik mixed geneste for/while loop met foto.
   for (int i = 0; i < 4; i++) {
    int o = 0; 
     while (o < 2) {
     image(vogel, i*100,o*100);
      o++;
  }
}

   
} // einde draw

void koe(){
  //muis interactie
  stroke(0);
  if (mousePressed && (mouseButton == LEFT)) {
    fill( random(255), random(255), random(255));
  } else if (mousePressed && (mouseButton == RIGHT)) {
    //gebruik random opacity
    fill( random(255), random(255), random(255), random(255)); 
  } else {
     fill(#836464);
  }
  
  //toetsenbord interactie
    if (keyPressed && key == '1') {
        fill(#75569c);
    }
    
    else if (keyPressed && key == '2') {
      fill(#e362a5);
    }
  
    else if (keyPressed && key == '3') {
      fill(#86bb2f);
    }
    
    else if (keyPressed && key == '4') {
      fill(#2e32f1);
    }
    
 //tekenen van de koe zelf
 rect(500,400, 500,250);
 quad(1000, 400, 1050, 380, 1050, 420, 1000, 440);
 rect(1050,350, 100,100);
 rect(500,650, 50,100);
 rect(580,650, 50,80);
 rect(870,650, 50,80);
 rect(950,650, 50,100);
 arc(1080,380,25,25,0,TWO_PI);
 ellipse(1120,380,25,25);
 triangle(1100,400,1110,420,1090,420);
 line(1080,435,1120,435);
 point(1120,380);
 point(1080,380);
 }
//auteurs naam + switch voor de kleur verandering, ook heb ik gebruik gemaakt van extra's zoals TextAlign en textSize.
void naam(){
  switch(key){
  case 'a': fill(255,0,0);
  break;
  case 'b': fill(0,255,0);
  break;
  default: fill(0);
  }
  textAlign(CENTER);
  textSize(20);
  text(myName, width/2, 30);
  char c;
  c = '9';
  text("212544" + c, width/2, 50); 
}

//gras
void gras(){
  fill(0,170,0);
  rect(0, 500, 1300, 300 );
}

  //zelfstandige animatie bal
void bal(){
    fill(0);
    ellipse(xPosition, 779, 40,40);
    xPosition = xPosition + xDirection;
    
    if(xPosition>width-25 || xPosition<25) {
     
     xDirection = xDirection*-1; 
    }
}
//sterrenhemel + slowmotion
void spacen(){
  noStroke();
  //random x coordinate tussen 0 en 1300( hele breedte van het scherm dus)
 int[] x = new int[20]; 

for( int i = 0; i< x.length; i++){
 x[i] = floor(random(1300)); 
}
//random y coordinate tussen 0 en 400, alleen de hemel dus
int[] y = new int[20]; 

for( int o = 0; o< y.length; o++){
 y[o] = floor(random(400)); 
}
//random grootte van de sterren
int[] d = new int[20]; 

for( int p = 0; p< y.length; p++){
 d[p] = floor(random(50)); 
}
//zorgt ervoor dat de sterren daadwerkelijk te zien zijn.
for (int m = 0; m<20; m++){
ellipse( x[m], y[m], d[m], d[m]);
} 
  
}
//meer muis interactie
void doos(int dia){  
if (mouseX > mouseY){
 kleur = true; 
} else {
kleur = false; 
}

if(kleur == true){
  stroke(0);
  fill(0);
  //gebruik parameters
 ellipse(40,400,dia,dia); 
}

if(kleur == false){
    noStroke();
   fill(wit);
   //gebruik parameters
 ellipse(40,400,dia,dia); 
}

}

void drol(){
  //gebruik colorMode
  colorMode(HSB);
  float i = 0.0;
 while (i <= 50) {
   noStroke();
   fill(30, 69, 51);
  ellipse(400, i+600, i, 20);
  i++;
}
}