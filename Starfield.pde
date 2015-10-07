Particle part[] = new Particle[500];


void setup()
{
	for (int i = 0; i < part.length; i++)
		part[i] = new NormalParticle();
	part[0] = new OddballParticle();
	size(400, 400);
	background(0);
}
void draw()
{
	background(0);
	for (int i =0; i<part.length; i++)
	{
		part[i].move();
		part[i].show();
		part[i].wrap();
	}
}
class NormalParticle implements Particle
{
	double nX, nY, nSpeed, nAngle, nSize;
	int nColor;
	public NormalParticle()
	{
	nX = 200;
	nY = 200;
	nSpeed = Math.random()*5;
	nAngle = 2*Math.PI*Math.random();
	nColor = (int)(Math.random()*255);
	nSize = 4;
	}

	public void move()
	{
		nX+= Math.cos(nAngle)* nSpeed;
		nY+= Math.sin(nAngle)* nSpeed;
	}

	public void show()
	{
		fill(nColor);
		ellipse((float)nX, (float)nY, (float)nSize, (float)nSize);
	}

	public void wrap()
	{
		if (nX<0 || nX>400)
		{
			nX = 200;
			nY = 200;
			nSpeed = Math.random()*5;
		}
		else if(nY<0 || nY>400)
		{
			nX = 200;
			nY = 200;
			nSpeed = Math.random()*3;
		}
	}
}
/*
interface Particle
{
	public void show();
	public void move();
	public void NormalParticle();
	//public void wrap();
}

class OddballParticle implements Particle
{
	public void show() {
		fill(255, 0, 255);
		ellipse((float)nX, (float)nY, (float)nSize, (float)nSize);
	}
	public void move() {
		nX+= Math.cos(nAngle)* nSpeed;
		nY+= Math.sin(nAngle)* nSpeed;
	}
}

class JumboParticle extends NormalParticle //uses inheritance
{
	JumboParticle() {
		nSize = 10;
		nSpeed = 1.5;
	}
}

*/
