Particle part[] = new Particle[500];


void setup()
{
	for (int i = 0; i < part.length; i++)
		part[i] = new NormalParticle();
	part[0] = new OddballParticle();
	part[1] = new JumboParticle();
	size(400, 400);
	background(0);
	noStroke();
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
	int nColor, rdmN;
	public NormalParticle()
	{
	nX = 200;
	nY = 200;
	nSpeed = Math.random()*5;
	nAngle = 2*Math.PI*Math.random();
	nColor = (int)(Math.random()*255);
	nSize = 2.5;
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
			nAngle = 2*Math.PI*Math.random();
		}
		else if(nY<0 || nY>400)
		{
			nX = 200;
			nY = 200;
			nSpeed = Math.random()*5;
			nAngle = 2*Math.PI*Math.random();
		}
	}
}

interface Particle
{
	public void show();
	public void move();
	public void wrap();
}

class OddballParticle implements Particle
{
	double nX, nY, nSize, nSpeed, nAngle;
	public void show() {
		fill(175, 75, 175);
		nSize = 10;
		ellipse((float)nX, (float)nY, (float)nSize, (float)nSize);
	}
	public void move() {
		nX++;
		nY++;
	}
	public void wrap() {
		int rdmN = ((int)Math.random()*4+1);
		if (nX==200 && nY==200 || nX>400 || nY>400 || nY<0 || nX<0) {
			if (rdmN == 1) {
				nX = (int)(Math.random()*400);
				nY = 0;
			}
			else if (rdmN == 2) {
				nX = 400;
				nY = (int)(Math.random()*400);
			}
			else if (rdmN == 3) {
				nX = (int)(Math.random()*400);
				nY = 400;
			}
			else
				nX = 0;
				nY = (int)(Math.random()*400);
			}
		}
		/*if (nX ==200 && nY ==200)
		{
			nX = (int)(Math.random()*400);
			nY = (int)(Math.random()*400);
			nSpeed = Math.random()*-5;
			nAngle = 2*Math.PI*Math.random();
		} */
	//}
}

class JumboParticle extends NormalParticle //uses inheritance
{
	JumboParticle() {
		nSize = 20;
		nSpeed = 6;
		nColor = 255;
	}
}


//Arc and change x, y?