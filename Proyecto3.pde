import processing.sound.*;

SoundFile c2;

PImage inicio;
PImage seleccion;
PImage batalla;
PImage fin;
PImage sheriff1;
PImage sheriff2;
PImage plcbot1;
PImage plcbot2;
PImage p11;
PImage p12;
PImage p21;
PImage p22;
PImage p31;
PImage p32;

PFont retro;

personaje sheriff;
personaje robot;
personaje p1;
personaje p2;
personaje p3;
personaje sheriffp2;
personaje robotp2;
personaje p1p2;
personaje p2p2;
personaje p3p2;

int x;
int y;
int jugador1 = 0;
int jugador2 = 0;
int escenario = 0;
int atacante = 1;


void setup(){
  size(1000,720);
  
  c2 = new SoundFile(this, "02.mp3");
  
  retro = createFont("Minecraft.ttf", 32);
  inicio = loadImage("Pantalla de Inicio.png");
  seleccion = loadImage("Pantalla de Selección.png");
  fin = loadImage("Pantalla Final.png");
  batalla = loadImage("Pantalla de Batalla.png");
  sheriff1 = loadImage("sheriff.png");
  sheriff2 = loadImage("sheriff(2).png");
  plcbot1 = loadImage("plcbot.png");
  plcbot2 = loadImage("plcbot(2).png");
  p11 = loadImage("1101.png");
  p12 = loadImage("1101(2).png");
  p21 = loadImage("0010.png");
  p22 = loadImage("0010(2).png");
  p31 = loadImage("1110.png");
  p32 = loadImage("1110(2).png");
  
  sheriff = new personaje("Sheriff",400,ceil(random(50,100)),0,0);
  robot = new personaje("PLC-BOT",400,ceil(random(50,100)),1,1);
  p1 = new personaje("1101", 400,50,2,2);
  p2 = new personaje("0010", 400,50,3,3);
  p3 = new personaje("1110", 400,50,4,4);
  sheriffp2 = new personaje("Sheriff",400,ceil(random(50,100)),5,0);
  robotp2 = new personaje("PLC-BOT",400,ceil(random(50,100)),6,1);
  p1p2 = new personaje("1101", 400,50,7,2);
  p2p2 = new personaje("0010", 400,50,8,3);
  p3p2 = new personaje("1110", 400,50,9,4);
  
  c2.play();
}


void draw(){  
  if(escenario == 0){
    image(inicio,0,0);
    efectoPantalla();
    textFont(retro);
    textAlign(CENTER);
    textSize(200);
    fill(random(255),random(255),random(255),80);
    text("R A Z E", width/2,300);
    fill(0);
    text("R A Z E", width/2,305);
    fill(255);
    textSize(25);
    text("PARA INICIAR PRESIONA\nE N T E R",width/2,600);
  }
  if (key == ENTER){
    escenario = 1;
  }
  if(escenario == 1){
    image(seleccion,0,0);
    efectoPantalla();
    pushMatrix();
    scale(.2);
    translate(2050,700);
    sheriff.Display();
    translate(700,0);
    p1.Display();
    translate(-1100,950);
    p2.Display();
    translate(750,0);
    p3.Display();
    translate(750,0);
    scale(.8);
    robot.Display();
    popMatrix();
    
    fill(255);
    text("q,y.",370,280);
    text("w,u.",510,280);
    text("e,i.",290,470);
    text("r,o.",450,470);
    text("t,p.",610,470);
    textSize(50);
    text("SELECCION DE PERSONAJES",width/2,100);
    textSize(20);
    text("Selecciona a tu personaje presionando la letra correspondiente\nJugador 1: q,w,e,r,t\nJugador 2: y,u,i,o,p",width/2,600);

    if(key == 'q'){
      jugador1 = 1;
    }else if(key == 'w'){
      jugador1 = 2;
    }else if(key == 'e'){
      jugador1 = 3;
    }else if(key == 'r'){
      jugador1 = 4;
    }else if(key == 't'){
      jugador1 = 5;
    }
    
    if(key == 'y'){
      jugador2 = 1;
    }else if(key == 'u'){
      jugador2 = 2;
    }else if(key == 'i'){
      jugador2 = 3;
    }else if(key == 'o'){
      jugador2 = 4;
    }else if(key == 'p'){
      jugador2 = 5;
    }
    
   if (jugador1 != 0 && jugador2 != 0){
     escenario = 2;
   }
 }
 
  //Tercera pantalla(Comienzo de la batalla)
  if(escenario == 2){
    image(batalla,0,0);
    efectoPantalla();
    fill(255);
    textSize(20);
    text("Ataque: s",200,650);
    textSize(20);
    text("Ataque: k",800,650);
    switch(jugador1){
      
      case 1:
      pushMatrix();
      scale(.5);
      translate(100,500);
      sheriff.Display();
      popMatrix();
      sheriff.BarraDeVida();
      break;
      
      case 2:
      pushMatrix();
      scale(.35);
      translate(150,600);
      robot.Display();
      popMatrix();
      sheriff.BarraDeVida();
      break;
      
      case 3:
      pushMatrix();
      scale(.5);
      p1.Display();
      popMatrix();
      sheriff.BarraDeVida();
      break;
      
      case 4:
      pushMatrix();
      scale(.5);
      p2.Display();
      popMatrix();
      sheriff.BarraDeVida();
      break;
      
      case 5:
      pushMatrix();
      scale(.5);
      p3.Display();
      popMatrix();
      sheriff.BarraDeVida();
      break;
    }
    
    switch(jugador2){
      
      case 1:
      pushMatrix();
      scale(.5);
      translate(1600,500);
      sheriffp2.Display();
      popMatrix();
      translate(560,0);
      robot.BarraDeVida();
      break;
      
      case 2:
      pushMatrix();
      scale(.35);
      translate(2100,550);
      robotp2.Display();
      popMatrix();
      translate(560,0);
      robot.BarraDeVida();
      break;
      
      case 3:
      pushMatrix();
      scale(.5);
      translate(1600,500);
      p1p2.Display();
      popMatrix();
      translate(560,0);
      robot.BarraDeVida();
      break;
      
      case 4:
      pushMatrix();
      scale(.5);
      translate(1600,500);
      p2p2.Display();
      popMatrix();
      translate(560,0);
      robot.BarraDeVida();
      break;
      
      case 5:
      pushMatrix();
      scale(.5);
      translate(1600,500);
      p3p2.Display();
      popMatrix();
      translate(560,0);
      robot.BarraDeVida();
      break;
      
    }
    if(key == 's'){
      if (atacante == 1){
        atacante = 2;
        robot.vida -= sheriff.ataque;
      }
    } else if(key == 'k'){ 
      if (atacante == 2){
        atacante = 1;
        sheriff.vida -= robot.ataque; 
      }
    }
    if(sheriff.vida <= 0){
      escenario = 3;
    }
    if(robot.vida <= 0){
      escenario = 4;
    }
  }
  
  if(escenario == 3){
    image(fin,0,0);
    efectoPantalla();
    fill(255);
    textSize(40);
    text("JUGADOR 2 GANASTE",width/2,560);
    textSize(15);
    text("Presiona ENTER para volver a Jugar",width/2,670);
    
    if(key == ENTER){
    escenario = 1;
    key = 0;
    jugador1 = 0;
    jugador2 = 0;
    sheriff.vida = 400;
    robot.vida = 400;
    atacante = 1;
    }
    
  }
  //Pantalla final(2)
  if(escenario == 4){
    image(fin,0,0);
    efectoPantalla();
    fill(255);
    textSize(40);
    text("JUGADOR 1 GANASTE",width/2,560);
    textSize(15);
    text("Presiona ENTER para volver a Jugar",width/2,670);
    
    if(key == ENTER){
    escenario = 1;
    key = 0;
    jugador1 = 0;
    jugador2 = 0;
    sheriff.vida = 400;
    robot.vida = 400;
    atacante = 1;
    }
  }
}
 

class personaje{
String nombre;
int vida, ataque, ilustracion, cara;

personaje(String nombre_, int vida_, int ataque_, int ilustracion_, int cara_){
  nombre = nombre_;
  vida = vida_;
  ataque = ataque_;
  ilustracion = ilustracion_;
  cara = cara_;
}


void Display(){
  
  switch(ilustracion){
    
    case 0:
    image(sheriff1,0,0);
    break;
    
    case 1:
    image(plcbot1,0,0);
    break;
    
    case 2:
    image(p11,0,0);
    break;
    
    case 3:
    image(p21,0,0);
    break;
    
    case 4:
    image(p31,0,0);
    break;
    
    case 5:
    image(sheriff2,0,0);
    break;
    
    case 6:
    image(plcbot2,0,0);
    break;
    
    case 7:
    image(p12,0,0);
    break;
    
    case 8:
    image(p22,0,0);
    break;
    
    case 9:
    image(p32,0,0);
    break;
    
  }
}
 
void BarraDeVida(){
  fill(255);
  rect(20,20,vida,20);
}
}

void efectoPantalla(){
  for(int i = 0;i<700;i++){
    strokeWeight(5);
    stroke(random(255),random(255),random(255),15);
    line(0,i*5,1000,i*5); 
  } 
}
