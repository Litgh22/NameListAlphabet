String[] names = {"Leo", "Hector", "Celia"};
String newName = "";
int state = 0;
String nameString = "";

void setup() {
  size(500, 400);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  if (state==0) {
    textSize(30);
    text(newName, width/2, height/2);
    textSize(20);
    text("Click here to add", width/2, height/1.5);
    text("Enter to order", width/2, height/1.3);
  } else {
    text(nameString, width/2, height/2);
  }
}

void keyPressed() {
  if ( (key>='a' && key<='z') ||
    (key>='A' && key<='Z') ||
    (key>='0' && key<='9') 
    ) {
    newName+=key;
  } else if (key == BACKSPACE) {
    if (newName.length()>0)newName = newName.substring(0, newName.length()-1);
  } else if ((key == RETURN || key == ENTER) && state == 0) {
    names = sort(names);
    for (int i = 0; i < names.length; i++) {
      nameString += names[i]+"\n";
    }
    state = 1;
  }
}

void mousePressed() {
  if (mouseY > height/1.8 && mouseY < height/1.3 && newName != "") {
    names = expand(names, names.length+1);
    names[names.length-1] = newName;
    newName = "";
  }
}
