int preX,preY,control,squSize,gameover,score;
float tmp;
int[] squX=new int[3],squY=new int[3],squType=new int[3],squCon = new int[3],array = new int[81],checkclearArray = new int[81];



void setup(){
  score = 0;
  gameover = 0;
  for(int i=0;i<81;i++){
    checkclearArray[i] = 0;
    array[i] = 0;
  }
  background(255,255,255);
  size(1280,720);
  for(int i=0;i<3;i++)
  squCon[i] = 0;
  preX=mouseX;
  preY=mouseY;
  control = 0;
  squSize = 40;
  reset();
}


void draw(){
  if(gameover==0){
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
          else if(array[i*9+j]==1||array[i*9+j]==8||array[i*9+j]==15||array[i*9+j]==22||array[i*9+j]==29)
            fill(#FFFF37);
          else if(array[i*9+j]==2||array[i*9+j]==9||array[i*9+j]==16||array[i*9+j]==23)
            fill(#00FFFF);
          else if(array[i*9+j]==3||array[i*9+j]==10||array[i*9+j]==17||array[i*9+j]==24)
            fill(#FF8000);
          else if(array[i*9+j]==4||array[i*9+j]==11||array[i*9+j]==18||array[i*9+j]==25)
            fill(#FF0000);
          else if(array[i*9+j]==5||array[i*9+j]==12||array[i*9+j]==19||array[i*9+j]==26)
            fill(#0000E3);
          else if(array[i*9+j]==6||array[i*9+j]==13||array[i*9+j]==20||array[i*9+j]==27)
            fill(#00EC00);
          else if(array[i*9+j]==7||array[i*9+j]==14||array[i*9+j]==21||array[i*9+j]==28)
            fill(#E800E8);
          square(400+j*squSize,250+i*squSize,squSize);
        }
      }
      for(int i=0;i<3;i++){
        if(squType[i]==1){
          fill(#FFFF37);
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
        else if(squType[i]==10){
          one_mul_three(squX[i],squY[i],squSize);
        }
        else if(squType[i]==11){
          three_mul_one(squX[i],squY[i],squSize);
        }
        else if(squType[i]==12){
          one_mul_four(squX[i],squY[i],squSize);
        }
        else if(squType[i]==13){
          four_mul_one(squX[i],squY[i],squSize);
        }
        else if(squType[i]==14){
          one_mul_five(squX[i],squY[i],squSize);
        }
        else if(squType[i]==15){
          five_mul_one(squX[i],squY[i],squSize);
        }
        else if(squType[i]==16){
          two_mul_three(squX[i],squY[i],squSize);
        }
        else if(squType[i]==17){
          three_mul_two(squX[i],squY[i],squSize);
        }
        else if(squType[i]==18){
           three_plus_right_one_left(squX[i],squY[i],squSize);
        }
        else if(squType[i]==19){
           three_plus_right_one_right(squX[i],squY[i],squSize);
        }
        else if(squType[i]==20){
           three_plus_right_one_up(squX[i],squY[i],squSize);
        }
        else if(squType[i]==21){
           three_plus_right_one_down(squX[i],squY[i],squSize);
        }
        else if(squType[i]==22){
          three_plus_right_two_left(squX[i],squY[i],squSize);
        }
        else if(squType[i]==23){
          three_plus_right_two_right(squX[i],squY[i],squSize);
        }
        else if(squType[i]==24){
          three_plus_right_two_up(squX[i],squY[i],squSize);
        }
        else if(squType[i]==25){
          three_plus_right_two_down(squX[i],squY[i],squSize);
        }
        else if(squType[i]==26){
          lightning_up(squX[i],squY[i],squSize);
        }
        else if(squType[i]==27){
          lightning_down(squX[i],squY[i],squSize);
        }
        else if(squType[i]==28){
          lightning_right(squX[i],squY[i],squSize);
        }
        else if(squType[i]==29){
          lightning_left(squX[i],squY[i],squSize);
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
                 if(squType[i]==2&&j<=7&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0){
                    check=1;
                    array[j*9+k]=2;
                    array[(j+1)*9+k]=2;
                    array[j*9+k+1]=2;
                    array[(j+1)*9+k+1]=2;
                 }
                 if(squType[i]==3&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[j*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k+2]==0){
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
                 if(squType[i]==4&&j<=6&&k<=7&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
                   check=1;
                   array[j*9+k+1]=4;
                   array[(j+1)*9+k]=4;
                   array[(j+1)*9+k+1]=4;
                   array[(j+2)*9+k+1]=4;
                 }
                 if(squType[i]==5&&j<=6&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0){
                   check=1;
                   array[j*9+k]=5;
                   array[(j+1)*9+k]=5;
                   array[(j+1)*9+k+1]=5;
                   array[(j+2)*9+k]=5;
                 }
                 if(squType[i]==6&&j<=7&&k<=6&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
                   check=1;
                   array[j*9+k+1]=6;
                   array[(j+1)*9+k]=6;
                   array[(j+1)*9+k+1]=6;
                   array[(j+1)*9+k+2]=6;
                 }
                 if(squType[i]==7&&j<=7&&k<=6&&array[j*9+k+1]==0&&array[(j)*9+k]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+1]==0){
                   check=1;
                   array[j*9+k+1]=squType[i];
                   array[(j)*9+k]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                 }
                 if(squType[i]==8&&j<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                 }
                 if(squType[i]==9&&k<=7&&array[j*9+k]==0&&array[(j)*9+k+1]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                 }
                 if(squType[i]==10&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                 }
                 if(squType[i]==11&&j<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                 }
                 if(squType[i]==12&&k<=5&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j)*9+k+3]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                   array[(j)*9+k+3]=squType[i];
                 }
                 if(squType[i]==13&&j<=5&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+3)*9+k]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                   array[(j+3)*9+k]=squType[i];
                 }
                 if(squType[i]==14&&k<=4&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j)*9+k+3]==0&&array[(j)*9+k+4]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                   array[(j)*9+k+3]=squType[i];
                   array[(j)*9+k+4]=squType[i];
                 }
                 if(squType[i]==15&&j<=4&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+3)*9+k]==0&&array[(j+4)*9+k]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                   array[(j+3)*9+k]=squType[i];
                   array[(j+4)*9+k]=squType[i];
                 }
                 if(squType[i]==16&&j<=7&&k<=6&&array[j*9+k]==0&&array[j*9+k+1]==0&&array[j*9+k+2]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[j*9+k+1]=squType[i];
                   array[j*9+k+2]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+1)*9+k+2]=squType[i];
                 }
                 if(squType[i]==17&&j<=6&&k<=7&&array[j*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[j*9+k+1]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                   array[(j+2)*9+k+1]=squType[i];
                 }
                 if(squType[i]==18&&j<=6&&k<=7&&array[j*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[j*9+k+1]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+2)*9+k+1]=squType[i];
                 }
                 if(squType[i]==19&&j<=6&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                   array[(j+2)*9+k+1]=squType[i];
                 }
                 if(squType[i]==20&&j<=7&&k<=6&&array[j*9+k+2]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
                   check=1;
                   array[j*9+k+2]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+1)*9+k+2]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                 }
                 if(squType[i]==21&&j<=7&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                 }
                 if(squType[i]==22&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k+2]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                   array[(j+1)*9+k+2]=squType[i];
                   array[(j+2)*9+k+2]=squType[i];
                 }
                 if(squType[i]==23&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k+2]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                   array[(j+2)*9+k+1]=squType[i];
                   array[(j+2)*9+k+2]=squType[i];
                 }
                 if(squType[i]==24&&j<=6&&k<=6&&array[j*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k+2]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k]==0){
                   check=1;
                   array[j*9+k+2]=squType[i];
                   array[(j+1)*9+k+2]=squType[i];
                   array[(j+2)*9+k+2]=squType[i];
                   array[(j+2)*9+k+1]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                 }
                 if(squType[i]==25&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                 }
                 if(squType[i]==26&&j<=6&&k<=7&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0){
                   check=1;
                   array[j*9+k+1]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+2)*9+k]=squType[i];
                 }
                 if(squType[i]==27&&j<=6&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j+1)*9+k]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+2)*9+k+1]=squType[i];
                 }
                 if(squType[i]==28&&j<=7&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
                   check=1;
                   array[j*9+k]=squType[i];
                   array[(j)*9+k+1]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+1)*9+k+2]=squType[i];
                 }
                 if(squType[i]==29&&j<=7&&k<=6&&array[j*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k]==0){
                   check=1;
                   array[j*9+k+1]=squType[i];
                   array[(j)*9+k+2]=squType[i];
                   array[(j+1)*9+k+1]=squType[i];
                   array[(j+1)*9+k]=squType[i];
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
      
      
      gameover = end_game();
      
  }
  else{
    background(255,255,255);
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
    else if(squType[i]==10){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==11){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==12){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*4&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==13){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*4)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==14){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*5&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==15){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*5)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==16){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==17){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==18){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==19){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize*2&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==20){
      if((mouseX>=squX[i]+squSize*2&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==21){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==22){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]+squSize*2&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==23){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]+squSize*2&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==24){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]+squSize*2&&mouseY<=squY[i]+squSize*3)||(mouseX>=squX[i]+squSize*2&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
    else if(squType[i]==25){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
     }
    }
     else if(squType[i]==26){
      if((mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]+squSize*2&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
      }
     }
     else if(squType[i]==27){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize*2&&mouseY<=squY[i]+squSize*3)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
      }
     }
     else if(squType[i]==28){
      if((mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
      }
     }
     else if(squType[i]==29){
      if((mouseX>=squX[i]+squSize&&mouseX<=squX[i]+squSize*3&&mouseY>=squY[i]&&mouseY<=squY[i]+squSize)||(mouseX>=squX[i]&&mouseX<=squX[i]+squSize*2&&mouseY>=squY[i]+squSize&&mouseY<=squY[i]+squSize*2)){
        if(squCon[i] == 1)
          squCon[i] = 0;
        else
          squCon[i] = 1;
      }
     }
    }
  } 
  
  
  
  
  


void two_mul_two(int x,int y,int size){ //type = 2
  fill(#00FFFF);
  square(x,y,size);
  square(x+size,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
}

void three_mul_three(int x,int y,int size){//type=3
  fill(#FF8000);
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
fill(#0000E3);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y+size,size);
}
void three_plus_mid_one_up(int x,int y,int size){//type=6
fill(#00EC00);
  square(x+size,y,size);
  square(x,y+size,size);
  square(x+size*2,y+size,size);
  square(x+size,y+size,size);
}
void three_plus_mid_one_down(int x,int y,int size){//type=7
  fill(#E800E8);
  square(x,y,size);
  square(x+size,y+size,size);
  square(x+size*2,y,size);
  square(x+size,y,size);
}
void one_mul_two(int x,int y,int size){//type=8
  fill(#FFFF37);
  square(x,y,size);
  square(x,y+size,size);
}
void two_mul_one(int x,int y,int size){//type=9
fill(#00FFFF);
  square(x,y,size);
  square(x+size,y,size);
}

void one_mul_three(int x,int y,int size){//type=10
  fill(#FF8000);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
}
void three_mul_one(int x,int y,int size){//type=11
  fill(#FF0000);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
}
void one_mul_four(int x,int y,int size){//type=12
  fill(#0000E3);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
  square(x+size*3,y,size);
}
void four_mul_one(int x,int y,int size){//type=13
  fill(#00EC00);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x,y+size*3,size);
}
void one_mul_five(int x,int y,int size){//type=14
  fill(#E800E8);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
  square(x+size*3,y,size);
  square(x+size*4,y,size);
}
void five_mul_one(int x,int y,int size){//type=15
  fill(#FFFF37);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x,y+size*3,size);
  square(x,y+size*4,size);
}
void two_mul_three(int x,int y,int size){//type=16
  fill(#00FFFF);
  square(x,y,size);
  square(x,y+size,size);
  square(x+size,y,size);
  square(x+size,y+size,size);
  square(x+size*2,y,size);
  square(x+size*2,y+size,size);
}
void three_mul_two(int x,int y,int size){//type=17
  fill(#FF8000);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y,size);
  square(x+size,y+size,size);
  square(x+size,y+size*2,size);
}

void three_plus_right_one_left(int x,int y,int size){//type=18
fill(#FF0000);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size,y+size,size);
  square(x+size,y+size*2,size);
}

void three_plus_right_one_right(int x,int y,int size){//type=19
fill(#0000E3);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y+size*2,size);
}
void three_plus_right_one_up(int x,int y,int size){//type=20
fill(#00EC00);
  square(x+size*2,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
  square(x+size*2,y+size,size);
}
void three_plus_right_one_down(int x,int y,int size){//type=21 FF8000
  fill(#E800E8);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
  square(x,y+size,size);
}
void three_plus_right_two_left(int x,int y,int size){//type=22 00FFFF
fill(#FFFF37);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
  square(x+size*2,y+size,size);
  square(x+size*2,y+size*2,size);
}

void three_plus_right_two_right(int x,int y,int size){//type=23
fill(#00FFFF);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y+size*2,size);
  square(x+size*2,y+size*2,size);
}
void three_plus_right_two_up(int x,int y,int size){//type=24
fill(#FF8000);
  square(x,y+size*2,size);
  square(x+size,y+size*2,size);
  square(x+size*2,y+size*2,size);
  square(x+size*2,y+size,size);
  square(x+size*2,y,size);
}
void three_plus_right_two_down(int x,int y,int size){//type=25
fill(#FF0000);
  square(x,y,size);
  square(x,y+size,size);
  square(x,y+size*2,size);
  square(x+size,y,size);
  square(x+size*2,y,size);
}
void lightning_up(int x,int y,int size){//type=26
fill(#0000E3);
  square(x+size,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
  square(x,y+size*2,size);
}
void lightning_down(int x,int y,int size){//type=27
fill(#00EC00);
  square(x,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
  square(x+size,y+size*2,size);
}
void lightning_right(int x,int y,int size){//type=28
fill(#E800E8);
  square(x,y,size);
  square(x+size,y,size);
  square(x+size,y+size,size);
  square(x+size*2,y+size,size);
}
void lightning_left(int x,int y,int size){//type=29
fill(#FFFF37);
  square(x+size,y,size);
  square(x+size*2,y,size);
  square(x,y+size,size);
  square(x+size,y+size,size);
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
    tmp = random(1,30);
    if(tmp>29)
      squType[i]=29;
    else if(tmp>28)
      squType[i]=28;
    else if(tmp>27)
      squType[i]=27;
    else if(tmp>26)
      squType[i]=26;
    else if(tmp>25)
      squType[i]=25;
    else if(tmp>24)
      squType[i]=24;
    else if(tmp>23)
      squType[i] = 23;
    else if(tmp>22)
      squType[i]=22;
    else if(tmp>21)
      squType[i]=21;
    else if(tmp>20)
      squType[i]=20;
    else if(tmp>19)
      squType[i]=19;
    else if(tmp>18)
      squType[i]=18;
    else if(tmp>17)
      squType[i]=17;
    else if(tmp>16)
      squType[i]=16;
    else if(tmp>15)
      squType[i]=15;
    else if(tmp>14)
      squType[i]=14;
    else if(tmp>13)
      squType[i]=13;
    else if(tmp>12)
      squType[i]=12;
    else if(tmp>11)
      squType[i]=11;
    else if(tmp>10)
      squType[i]=10;
    else if(tmp>9)
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
    else if(tmp>2)
      squType[i] = 2;
    else if(tmp>=1)
        squType[i]=1;
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
      score+=1;
      checkclearArray[i]=0;
      array[i]=0;
    }
  }


}


int end_game(){
  int[] check = new int[3];
  
  for(int i=0;i<3;i++){
    check[i]=0;
    if(squType[i]!=0){
      for(int j=0;j<9;j++){
        for(int k=0;k<9;k++){
          if(squType[i]==1&&array[j*9+k]==0){
            //print(squType[i] +" "+ j + " "+ k + "\n");
                check[i]=1;
             }
             if(squType[i]==2&&j<=7&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
                check[i]=1;
             }
             if(squType[i]==3&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[j*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==4&&j<=6&&k<=7&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==5&&j<=6&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==6&&j<=7&&k<=6&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==7&&j<=7&&k<=6&&array[j*9+k+1]==0&&array[(j)*9+k]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==8&&j<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==9&&k<=7&&array[j*9+k]==0&&array[(j)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==10&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==11&&j<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==12&&k<=5&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j)*9+k+3]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==13&&j<=5&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+3)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==14&&k<=4&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j)*9+k+3]==0&&array[(j)*9+k+4]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==15&&j<=4&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+3)*9+k]==0&&array[(j+4)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==16&&j<=7&&k<=6&&array[j*9+k]==0&&array[j*9+k+1]==0&&array[j*9+k+2]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==17&&j<=6&&k<=7&&array[j*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0){
//print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==18&&j<=6&&k<=7&&array[j*9+k]==0&&array[j*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==19&&j<=6&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==20&&j<=7&&k<=6&&array[j*9+k+2]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==21&&j<=7&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==22&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==23&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==24&&j<=6&&k<=6&&array[j*9+k+2]==0&&array[(j+1)*9+k+2]==0&&array[(j+2)*9+k+2]==0&&array[(j+2)*9+k+1]==0&&array[(j+2)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==25&&j<=6&&k<=6&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+2)*9+k]==0&&array[(j)*9+k+1]==0&&array[(j)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==26&&j<=6&&k<=7&&array[j*9+k+1]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==27&&j<=6&&k<=7&&array[j*9+k]==0&&array[(j+1)*9+k]==0&&array[(j+1)*9+k+1]==0&&array[(j+2)*9+k+1]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==28&&j<=7&&k<=6&&array[j*9+k]==0&&array[(j)*9+k+1]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k+2]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(squType[i]==29&&j<=7&&k<=6&&array[j*9+k+1]==0&&array[(j)*9+k+2]==0&&array[(j+1)*9+k+1]==0&&array[(j+1)*9+k]==0){
               //print(squType[i] +" "+ j + " "+ k + "\n");
               check[i]=1;
             }
             if(check[i]==1)
               break;
        }
        if(check[i]==1)
           break;
      }
      if(check[i]==1)
           break;
    }
    else{
      check[i]=0;
    }      
  }
  int end_game=1;
  for(int i=0;i<3;i++){
    if(check[i]==1)
      end_game = 0;
  }
  return end_game;


}


//yellow FFFF37
//light_blue 00FFFF
//orange FF8000
//red FF0000
//blue 0000E3
//green 00EC00
//purple E800E8
