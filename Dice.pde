Die bob = new Die(300,300,6);


void setup()
{
	size(600,600);
	noLoop();
}
void draw()
{
	background(0);
	bob.show();	
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
		roll();
		myX = x;
		myY = y;
		mySize = 70;
		myType = type;
	}
	void roll()
	{
		if(type == 1){
			diceNum = (int)(Math.random() * 6) + 1;
		}
		else {
			diceNum = (int)(Math.random() * 9) + 1;
		}
	}
	void show()
	{
		System.out.println((int)(Math.random()* myType));
		if(myType == 1){
			rect(myX,myY,mySize,mySize,5);
			fill(255);
			if(diceNum == 1) {
				ellipse(myX + mySize/2,myY + mySize/2,15,15);
			}
			else if(diceNum == 2){
				ellipse(myX + mySize*3/4,myY + mySize*1/4 ,20,20);
				ellipse(myX + mySize*1/4,myY + mySize*3/4 ,20,20);
			}
			else if(diceNum == 3){
				ellipse(myX + mySize*3/4,myY + mySize/4 ,20,20);
				ellipse(myX + mySize/4, myY + mySize*3/4 ,20,20);
				ellipse(myX + mySize/2, myY + mySize/2 ,20,20);
			}
		}
		else{
			//nine sided dice
		}
	}
}
