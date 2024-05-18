int preX,preY,control,squSize,gameover,score;
float tmp;
int[] squX=new int[3],squY=new int[3],squType=new int[3],squCon = new int[3],array = new int[81],checkclearArray = new int[81];
PFont font;
String str;

String[] knowledge  = {"鱷魚通常是直立行走的！",
                       "绵羊能記住你们所有人的臉！",
                       "Nokia原本是荷蘭一種水獺的名字。",
                       "在武則天時代，世界上同時出現了三個女皇帝！",
                       "斑馬其實是黑底白毛",
                       "畢卡索全名:勃羅·迪亞哥·荷西·法蘭西斯科·德·保拉·胡安·尼波穆塞諾·\n瑪麗亞·德·洛斯雷梅迪奧斯·西普里亞諾·德拉桑蒂西馬·特立尼達·魯伊斯-畢卡索",
                       "巴西監獄雇用鵝當守衛，讓警犬瞬間失業",
                       "中國古代的肥皂是用豬胰臟製成",
                       "唱歌減肥法，能燃燒2400大卡，還可增強免疫功能",
                       "毛毛蟲是筋肉王，多達4000塊肌肉",
                       "羅馬兩千多年前就發明了自動販賣機在賣聖水",
                       "開燈睡覺會變憂鬱、也更容易變胖",
                       "睡眠中身體抽動一下，是神經大腦測試你死了沒",
                       "以前古墓長明油燈，都是抹香鯨的腦油",
                       "馬蹄是牠們的中指",
                       "你愛吃的食物會影響你的膚色",
                       "禿鷲會禿頭其實是為了預防生病保持健康",
                       "喝酒會讓你想吃鹹食或拉麵(鹽分+碳水化合物+水)",
                       "罵髒話可以降低壓力，減輕疼痛",
                       "沒有鬧鐘的年代，舊世紀的歐洲，有一群拿著長竿的人，稱為敲門人會挨家挨戶叫你起床",
                       "打火機其實比火柴早問世(打火機16世紀，火柴18世紀末)",
                       "工作沒精神就來娃娃菜，效果比咖啡好(鉀含量高)",
                       "以前歐洲人用乳酪來清潔傷口",
                       "嚼口香糖可以幫助剖腹產及手術等快速復原",
                       "兔子其實很討厭吃紅蘿蔔(紅蘿蔔偏冷，兔子腸胃不好吃了會拉肚子)",
                       "溫度會影響烏龜蛋生男生女",
                       "水棲類烏龜是用屁股呼吸",
                       "陸地最大哺乳類動物大象，平均每天只睡２小時",
                       "行人穿越道的斑馬線，前身是跳石",
                       "蒙古烤肉、左宗棠雞其實是台灣人發明的",
                       "古代麵條稱為湯餅，直到宋代才出現細麵條",
                       "冰糖葫蘆源自於南宋，最早是用來治病的",
                       "土耳其人洗臉要繳稅",
                       "一般情況下，人在睡眠時嗅覺幾乎沒有任何反應，聽覺最敏銳、觸覺次之、再次是視覺",
                       "白掌長臂猿經常骨折",
                       "大白鯊24小時都需要游動，停下就會死，包括睡覺",
                       "防彈背心是一位披薩店老闆被搶劫太多次而想到的",
                       "公皇帝企鵝為了孵蛋，需要60天不吃不喝等老婆回家",
                       "蜉蝣是最短命的，成蟲後會在幾小時~幾天內死去",
                       "鼴鼠只要三小時沒有找到食物，就會立即餓死",
                       "儒艮終身無法睡好覺，每10分鐘就得醒來呼吸",
                       "豬是世界上第五聰明的動物，比狗更聰明",
                       "古人把一種叫做「雌黃」的礦物粉塗在錯別字上，類似現在的立可白，「信口雌黃」就是這樣來的",
                       "比基尼的命名由來跟核試爆地有關",
                       "早餐玉米片具有磁性，可以被磁鐵吸著",
                       "先天性盲人在夢裡是沒有影像的",
                       "英國女王伊莉莎白二世終身沒有護照，且有兩個生日",
                       "冰淇淋有一半都是空氣",
                       "站著不動比跑步運動還要累是因為跑步時兩腳交替休息且手臂擺動會分擔10%能量",
                       "巨石像摩艾在土裡是有完整穿褲子的下半身的"
 };


void setup(){
  score = 0;
  gameover = 1;
  for(int i=0;i<81;i++){
    checkclearArray[i] = 0;
    array[i] = 0;
  }
  background(255,255,255);
  size(900,900);
  for(int i=0;i<3;i++)
  squCon[i] = 0;
  preX=mouseX;
  preY=mouseY;
  squSize = 40;
  smooth();
  font = createFont("Silver.ttf", 32);
  textFont(font);
  //reset();
}


void draw(){
  if(gameover==0){
      background(#FFFFFF);
      str = "Score : " + score;
      fill(0,0,0);
      textSize(100);
      text(str, 250, 150);
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
            fill(#DDDDDD);
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
          square(250+j*squSize,250+i*squSize,squSize);
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
               if(squY[i]<=(250+j*squSize+squSize/4)&&squY[i]>=(250+j*squSize-squSize/4)&&squX[i]<=(250+k*squSize+squSize/4)&&squX[i]>=(250+k*squSize-squSize/4)){
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
               squX[0]=250-180;
             else if(i==1)
               squX[1]=550-180;
             else if(i==2)
               squX[2]=850-180;
               squY[i]=650;
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
    fill(0,0,0);
    textSize(100);
    text("LEGO Explode Party!", 180, 300);
    stroke(0,0,0);
    strokeWeight(2);
    DrawButton(300,450,300,100);
    text("Start", 370, 520);
    DrawButton(300,600,300,100);
    text("Quit", 390, 670);
  }
}

void mousePressed(){
  if(gameover==0){
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
    else{
      if(mouseX>=300&&mouseX<=600&&mouseY>=450&&mouseY<=550){
        startGame();
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
  squX[0]=250+170;
  squX[1]=550+170;
  squX[2]=850+170;
  squY[0]=650;
  squY[1]=650;
  squY[2]=650;
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

void DrawButton(int x,int y,int x_size,int y_size){
    line(x, y,x+x_size, y);
    line(x, y,x, y+y_size);
    line(x, y+y_size,x+x_size,y+y_size);
    line(x+x_size, y,x+x_size,y+y_size);


}

void startGame(){
  gameover=0;
  reset();
  for(int i=0;i<81;i++){
    checkclearArray[i] = 0;
    array[i] = 0;
  }
  score=0;
}
//yellow FFFF37
//light_blue 00FFFF
//orange FF8000
//red FF0000
//blue 0000E3
//green 00EC00
//purple E800E8
