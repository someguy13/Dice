Die bob;
boolean toggle = true;
int tot,sum6,sum9,num6,num9,num, rolls, totsum, avg = 0;

void setup()
{
	size(600,600);
	frameRate(30);
}
void draw()
{
	sum6 = 0;
	sum9 = 0;
	num6 = 0;
	num9 = 0;
	tot = 0;
	num = 0;
	background(255);
	for(int j = 5; j <= 400; j += 25){
		for(int i = 5; i <= 600; i += 25){
			bob = new Die(i,j,(int)(Math.random()*2)+1);
			bob.show();
			if(bob.myType == 1){
				sum6 = sum6 + bob.diceNum;
				num6 = num6 + 1;
			}
			else if(bob.myType == 2){
				sum9 = sum9 + bob.diceNum;
				num9 = num9 + 1;
			}
		}
	}
	tot = sum6 + sum9;
	num = num6 + num9;
	fill(0);
	rect(0,425,600,175);
	textSize(20);
	fill(255);
	textAlign(CENTER);
	text("Click Anywhere to Roll!", 300,575);
}
void sum(){
	totsum = totsum + tot;
	avg = totsum/rolls;
	fill(255);
	textSize(12);
	textAlign(LEFT);
	text("Number of six-sided: " + num6,5,450);
	text("Sum of six-sided: " + sum6,5,475);
	text("Number of nine-sided: " + num9,5,500);
	text("Sum of nine-sided: " + sum9,5,525);
	text("Total Number of Dice: " + num,205,450);
	text("Total Sum: " + tot,205,475);
	text("Total Total Sum: " + totsum, 205, 500);
	text("Number of Rolls: " + rolls, 400,450);
	text("Average Sum per Roll: " + avg, 400,475);
}
void mousePressed()
{
	if(toggle == true){
		noLoop();
		redraw();
		rolls = rolls + 1;
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
			textAlign(CENTER);
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