*/COUFFIN Manon
  JOBERT Pauline
      1A SRI       */

import processing.serial.*;
Serial myPort;
String inString;
int limit;
float y;

void setup(){
  //taille de la fenetre 
  size(640,480);
  textSize(24);
  //On definit le port utilisé comme le port numéro zero (car on lit sur A0)
  String portName = Serial.list()[0];
  //on relit la variable myPort à l'arduino avec son numero de port et le frequence de transmission
  myPort = new Serial(this, portName, 19200); 
  //on récupère la valeur
  myPort.bufferUntil('\n');

}

void draw(){
  
  //on definit un fond noir
  background(0);
  //on écrit la valeur recue grace à la fonction serialEvent
  text("recu : " + inString,10,50);
 
  stroke(128); // choix de la couleur des axes
  strokeWeight(1);  //epaisseur du tracé des axes
  //on définit la taille des axes
  line(0, height/2, width, height/2); 
  line(width/2, 0, width/2, height);
 
  limit++;                        //Incrementation du compteur, afin de décaler le dessin du point de chaque pixel à chaque fois
  if (limit > width) limit = 0;  //on remet la point à zéro quand on a traversé toute la fenetre
  
  strokeWeight(3);//épaisseur de la courbe
  stroke(255, 0, 0);// choix de la couleur courbe
  for(int i = 0; i< limit; i++)
    {
    y = Float.valueOf(inString); //on recupère la valeur et on la convertit en réel
    
    point(i, y + height/2);      // Tracé du point
    }
  
  fill(255); // couleur de l'ecriture de la valeur
  textAlign(LEFT, CENTER);
  text(y, limit+10, y + height/2);
}


//permet de lire la valeur
void serialEvent(Serial p){
 inString = p.readString(); 
}



