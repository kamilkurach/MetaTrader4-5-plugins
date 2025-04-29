
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

void OnStart()
   {
   string timeFrame = StringSubstr(EnumToString(_Period), 7);
   long periodSec = PeriodSeconds(_Period);
   string text = "DIFF IN [" + timeFrame + "] HIGH and LOW: ";
   string value = "high_low_diff";
   
   ObjectCreate(0,value,OBJ_LABEL,0,0,0);           
   ObjectSetInteger(0,value,OBJPROP_XDISTANCE,25);
   ObjectSetInteger(0,value,OBJPROP_YDISTANCE,25);
   ObjectSetInteger(0,value,OBJPROP_COLOR,clrYellow);
   ObjectSetString(0,value,OBJPROP_TEXT, text);
   ObjectSetString(0,value,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,value,OBJPROP_FONTSIZE, 20);
   ObjectSetDouble(0,value,OBJPROP_ANGLE, 360);
   ObjectSetInteger(0,value,OBJPROP_SELECTABLE,false);
   ChartRedraw(0);
   
   while(true) 
      {
      switch(_Period)
         {
         case PERIOD_M1:
            {
            double high  = iHigh(Symbol(),_Period,0);
            double high_M15  = iHigh(Symbol(),PERIOD_M15,1);
            double low  = iLow(Symbol(),_Period,0);
            double low_M15  = iLow(Symbol(),PERIOD_M15,1);
            double diff = high - low;
            
            ObjectCreate(0,"High",OBJ_HLINE,0,0,high);
            ObjectCreate(0,"High_M15",OBJ_HLINE,0,0,high_M15);
            ObjectSetInteger(0,"High",OBJPROP_COLOR,clrYellowGreen);
            ObjectSetInteger(0,"High_M15",OBJPROP_COLOR,clrBlue);
            ObjectSetString(0,"High_M15",OBJPROP_TEXT,"15M HIGH: " + DoubleToString(high_M15, _Digits));
            ObjectSetInteger(0,"High_M15",OBJPROP_FONTSIZE,10);
            
            ObjectCreate(0,"Low",OBJ_HLINE,0,0,low);
            ObjectCreate(0,"Low_M15",OBJ_HLINE,0,0,low_M15);
            ObjectSetInteger(0,"Low",OBJPROP_COLOR,clrRed);
            ObjectSetInteger(0,"Low_M15",OBJPROP_COLOR,clrChocolate);
            ObjectSetString(0,"Low_M15",OBJPROP_TEXT,"15M LOW: " + DoubleToString(low_M15, _Digits));
            
            string text = "DIFF IN [" + timeFrame + "] HIGH and LOW: " + DoubleToString(diff, _Digits) +
            " | DIFF IN [M15] H/L: " + DoubleToString(high_M15 - low_M15, _Digits);
            
            ObjectSetString(0,value,OBJPROP_TEXT,text);
            ChartRedraw(0);
            }
         case PERIOD_M5:
            {
            
            }
         case PERIOD_M15:
            {
            
            }
         }
      }
   }

//+------------------------------------------------------------------+
