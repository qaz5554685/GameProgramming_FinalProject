int preX,preY,control,squSize;
float tmp;
int[] squX=new int[3],squY=new int[3],squType=new int[3],squCon = new int[3],array = new int[81],checkclearArray = new int[81];



void setup(){
  for(int i=0;i<81;i++){
    checkclearArray[i] = 0;
    array[i] = 0;
  }
  background(255,255,255);
  size(1280,720);
  squX[0]=250;
  squX[1]=550;
  squX[2]=850;
  squY[0]=50;
  squY[1]=50;
  squY[2]=50;
  for(int i=0;i<3;i++)
  squCon[i] = 0;
  preX=mouseX;
  preY=mouseY;
  control = 0;
  squSize = 40;
  for(int i=0;i<3;i++){
    tmp = random(1,10);
    if(tmp>9)
      squType[i]=9;
    else if(tmp>8)
      squType[i]=8;
    else if(tmp>7)
      squType[i]=7;
    else if(tmp>6)
      squType[i]=6;
    else if(tmp>5)
      squType[i]=5;
    else if(tmp>4)
      squType[i]=4;
    else if(tmp>3)
      squType[i]=3;
    else if(tmp>2){
      squType[i] = 2;
    }
    else if(tmp>1){
        squType[i]=1;
    }
  }
  squType[0]=5;
}


void draw(){
  background(255,255,255);
  fill(#FFFFFF);
  for(int i=0;i<3;i++){
    if(squCon[i] == 1){
      squX[i]+= (mouseX-preX);
      squY[i]+= (mouseY-preY);
    }
  }
  preX=mouseX;
  preY=mouseY;
  for(int i=0;i<9;i++){
    for(int j=0;j<9;j++){
      if(array[i*9+j]==0)
        fill(#FFFFFF);
      else if(array[i*9+j]==5)
        fill(#28FF28);
      else
        fill(#FF0000);
      square(400+j*squSize,250+i*squSize,squSize);
    }
  }
  for(int i=0;i<3;i++){
    if(squType[i]==1){
      fill(#FF0000);
      square(squX[i],squY[i],squSize);
    }
    else if(squType[i]==2){
      two_mul_two(squX[i],squY[i],squSize);
    }
    else if(squType[i]==3){
      three_mul_three(squX[i],squY[i],squSize);
    }
    else if(squType[i]==4){
      three_plus_mid_one_left(squX[i],squY[i],squSize);
    }
    else if(squType[i]==5){
       three_plus_mid_one_right(squX[i],squY[i],squSize);
    }
    else if(squType[i]==6){
      three_plus_mid_one_up(squX[i],squY[i],squSize);
    }
    else if(squType[i]==7){
      three_plus_mid_one_down(squX[i],squY[i],squSize);
    }
    else if(squType[i]==8){
      one_mul_two(squX[i],squY[i],squSize);
    }
    else if(squType[i]==9){
      two_mul_one(squX[i],squY[i],squSize);
    }
  }
  
  for(int i=0;i<3;i++){
     if(squCon[i]==0){
       int check=0;
       for(int j=0;j<9;j++){
         for(int k=0;k<9;k++){
           if(squY[i]<=(250+j*squSize+squSize/4)&&squY[i]>=(250+j*squSize-squSize/4)&&squX[i]<=(400+k*squSize+squSize/4)&&squX[i]>=(400+k*squSize-squSize/4)){
             if(squType[i]==1&&array[j*9+k]==0){
                array[j*9+k]=1;
                check=1;
             }
             if(squType[i]==2&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0){
                check=1;
                array[j*9+k]=2;
                array[(j+1)*9+k]=2;
                array[j*9+k+1]=2;
                array[(j+1)*9+k+1]=2;
             }
             if(squType[i]==3&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[j*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k+2]==0){
               check=1;
               array[j*9+k]=3;
               array[(j+1)*9+k]=3;
               array[j*9+k+1]=3;
               array[(j+1)*9+k+1]=3;
               array[j*9+k+2]=3;
               array[(j+1)*9+k+2]=3;
               array[(j+2)*9+k]=3;
               array[(j+2)*9+k+1]=3;
               array[(j+2)*9+k+2]=3;
             }
             if(squType[i]==4&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
               check=1;
               array[j*9+k+1]=4;
               array[(j+1)*9+k]=4;
               array[(j+1)*9+k+1]=4;
               array[(j+2)*9+k+1]=4;
             }
             if(squType[i]==5&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0){
               check=1;
               array[j*9+k]=5;
               array[(j+1)*9+k]=5;
               array[(j+1)*9+k+1]=5;
               array[(j+2)*9+k]=5;
             }
             if(squType[i]==6&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
               check=1;
               array[j*9+k+1]=6;
               array[(j+1)*9+k]=6;
               array[(j+1)*9+k+1]=6;
               array[(j+1)*9+k+2]=6;
             }
             if(squType[i]==7&&array[j*9+k+1]==0&&array[(j)*9+k]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+1]==0){
               check=1;
               array[j*9+k+1]=7;
               array[(j)*9+k]=7;
               array[(j)*9+k+2]=7;
               array[(j+1)*9+k+1]=7;
             }
             if(squType[i]==8&&array[j*9+k]==0&&array[(j+1)*9+k]==0){
               check=1;
               array[j*9+k]=8;
               array[(j+1)*9+k]=8;
             }
             if(squType[i]==9&&array[j*9+k]==0&&array[(j)*9+k+1]==0){
               check=1;
               array[j*9+k]=9;
               array[(j)*9+k+1]=9;
             }
           }
         }
       }
       if(check==0){
         if(i==0)
           squX[0]=250;
         else if(i==1)
           squX[1]=550;
         else if(i==2)
           squX[2]=850;
           squY[i]=50;
       }
       else{
         squType[i]=0;
         clear();
       }
     }
    
    
  }
  
  if(squType[0]==0&&squType[2]==0&&squType[1]==0){
    reset();
  }
  
  
  
  
  
}

void mousePressed(){
  for(int i=0;i<3;i++){
    if(squType[i]==1){
      if(mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==2){
      if(mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*2){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
      
    }
    else if(squType[i]==3){
      if(mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==4){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==5){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==6){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==7){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==8){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==9){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
  } 
  
  
  
  
  
}

void two_mul_two(int x,int y,int size){ //type = 2
  fill(#FF0000);
  square(x,y,size);
  square(x+size,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
}

void three_mul_three(int x,int y,int size){//type=3
  fill(#FF0000);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
  square(x+size*2,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y+size*2,size);
  square(x+size*2,y+size*2,size);
}

void three_plus_mid_one_left(int x,int y,int size){//type=4
fill(#FF0000);
  square(x,y+size,size);
  square(x+size,y,size);
  square(x+size,y+size,size);
  square(x+size,y+size*2,size);
}
void three_plus_mid_one_right(int x,int y,int size){//type=5
fill(#28FF28);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y+size,size);
}
void three_plus_mid_one_up(int x,int y,int size){//type=6
fill(#FF0000);
  square(x+size,y,size);
  square(x,y+size,size);
  square(x+size*2,y+size,size);
  square(x+size,y+size,size);
}
void three_plus_mid_one_down(int x,int y,int size){//type=7
fill(#FF0000);
  square(x,y,size);
  square(x+size,y+size,size);
  square(x+size*2,y,size);
  square(x+size,y,size);
}
void one_mul_two(int x,int y,int size){//type=8
fill(#FF0000);
  square(x,y,size);
  square(x,y+size,size);
}
void two_mul_one(int x,int y,int size){//type=9
fill(#FF0000);
  square(x,y,size);
  square(x+size,y,size);
}

void reset(){
  squX[0]=250;
  squX[1]=550;
  squX[2]=850;
  squY[0]=50;
  squY[1]=50;
  squY[2]=50;
  for(int i=0;i<3;i++)
  squCon[i] = 0;

  for(int i=0;i<3;i++){
    tmp = random(1,10);
    if(tmp>9)
      squType[i]=9;
    else if(tmp>8)
      squType[i]=8;
    else if(tmp>7)
      squType[i]=7;
    else if(tmp>6)
      squType[i]=6;
    else if(tmp>5)
      squType[i]=5;
    else if(tmp>4)
      squType[i]=4;
    else if(tmp>3)
      squType[i]=3;
    else if(tmp>2){
      squType[i] = 2;
    }
    else if(tmp>1){
        squType[i]=1;
    }
  }
}


void clear(){
  int checkclear = 0;
  for(int i=0;i<9;i++){
    checkclear = 1;
    for(int j=0;j<9;j++){
      if(array[i*9+j]==0){
        checkclear = 0;
      }
    }
    if(checkclear==1){
      for(int j=0;j<9;j++){
          checkclearArray[i*9+j]=1;
      }
    }
    checkclear = 1;
    for(int j=0;j<9;j++){
      if(array[j*9+i]==0){
        checkclear = 0;
      }
    }
    if(checkclear==1){
      for(int j=0;j<9;j++){
          checkclearArray[j*9+i]=1;
      }
    }
  }
  
  for(int i=0;i<81;i++){
    if(checkclearArray[i]==1){
      checkclearArray[i]=0;
      array[i]=0;
    }
  }


}
