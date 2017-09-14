Die bob = new Die(300,300,1);
Die joe = new Die(300,100,2);


void setup()
{
	size(600,600);
	noLoop();
}
void draw()
{
	background(0);
	bob.show();	
	joe.show();
}
void mousePressed()
{
	redraw();
}
class Die //models one single dice cube
{
	int myX,myY,myType,mySize;
	double diceNum;
	Die(int x, int y, int type) //constructor
	{
		myX = x;
		myY = y;
		mySize = 70;
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
		System.out.println((int)(Math.random()* myType));
		if(myType == 1){
			rect(myX,myY,mySize,mySize,5);
			fill(255);
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
			poly(myX, myY);
		}
	}
}

void poly(int x, int y){
	beginShape();
	vertex(x + 35,y);
	vertex(x, y + 53);
	vertex(x + 35, y + 70);
	vertex(x + 70, y + 53);
	vertex(x + 35,y);
	endShape(CLOSE);
}

void one(int x, int y, int size) {
	ellipse(x + size/2,y + size/2,20,20);
}
void two(int x,int y, int size){
	ellipse(x + size*3/4,y + size*1/4 ,20,20);
	ellipse(x + size*1/4,y + size*3/4 ,20,20);
}
void four(int x, int y, int size){
	ellipse(x + size*3/4,y + size*1/4 ,20,20);
	ellipse(x + size*1/4,y + size*3/4 ,20,20);
	ellipse(x + size*3/4,y + size*3/4 ,20,20);
	ellipse(x + size*1/4,y + size*1/4 ,20,20);
}