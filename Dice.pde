Die bob;
boolean toggle = true;
int tot = 0;
void setup()
{
	size(600,600);
	textAlign(CENTER);
	//noLoop();
}
void draw()
{
	tot = 0;
	background(0);
	for(int j = 5; j <= 400; j += 25){
		for(int i = 5; i <= 600; i += 25){
			bob = new Die(i,j,(int)(Math.random()*2)+1);
			bob.show();
			tot = tot + bob.diceNum;
		}
		
	}

}
void sum(){
	fill(255);
	text(tot,100,500);
}
void mousePressed()
{
	if(toggle == true){
		noLoop();
		redraw();
		toggle = false;
		sum();
		
	}
	else {
		loop();
		toggle = true;	
	}
}
class Die //models one single dice cube
{
	int myX,myY,myType,mySize,diceNum;
	Die(int x, int y, int type) //constructor
	{
		myX = x;
		myY = y;
		mySize = 20;
		myType = type;
	}
	void roll()
	{
		if(myType == 1){
			diceNum = (int)(Math.random() * 6) + 1;
		}
		else {
			diceNum = (int)(Math.random() * 9) + 1;
		}
	}
	void show()
	{
		roll();
		if(myType == 1){
			fill((int)(Math.random()*205) + 50,(int)(Math.random()*205) + 50,(int)(Math.random()*205) + 50);
			rect(myX,myY,mySize,mySize,5);
			fill(0);
			if(diceNum == 1) {
				one(myX,myY,mySize);
			}
			else if(diceNum == 2){
				two(myX,myY,mySize);
			}
			else if(diceNum == 3){
				two(myX,myY,mySize);
				one(myX,myY,mySize);
			}
			else if(diceNum == 4){
				four(myX,myY,mySize);
			}
			else if(diceNum == 5){
				four(myX,myY,mySize);
				one(myX,myY,mySize);
			}
			else{
				four(myX,myY,mySize);
				one(myX + mySize/4,myY,mySize);
				one(myX - mySize/4,myY,mySize);
			}
		}
		else {
			fill((int)(Math.random()*205) + 50,(int)(Math.random()*205) + 50,(int)(Math.random()*205) + 50);
			poly(myX, myY, mySize);
			fill(0);
			textSize(mySize/2);
			text(diceNum,myX+mySize/2,myY+mySize*4/5);
		}
	}
}

void poly(int x, int y, int size){
	beginShape();
	vertex(x + size/2,y);
	vertex(x, y + size*3/4);
	vertex(x + size/2, y + size);
	vertex(x + size, y + size*3/4);
	vertex(x + size/2,y);
	endShape(CLOSE);
}

void one(int x, int y, int size) {
	ellipse(x + size/2,y + size/2,size/4,size/4);
}
void two(int x,int y, int size){
	ellipse(x + size*3/4,y + size*1/4 ,size/4,size/4);
	ellipse(x + size*1/4,y + size*3/4 ,size/4,size/4);
}
void four(int x, int y, int size){
	ellipse(x + size*3/4,y + size*1/4 ,size/4,size/4);
	ellipse(x + size*1/4,y + size*3/4 ,size/4,size/4);
	ellipse(x + size*3/4,y + size*3/4 ,size/4,size/4);
	ellipse(x + size*1/4,y + size*1/4 ,size/4,size/4);
}