package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.aurora.ui.maogoutd.game.BattleFieldFor4View;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class NightCheeseBeachTempleGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stSeaWaterArea0Bitmap:BitmapData;
      
      private var m_stSeaWaterArea1Bitmap:BitmapData;
      
      private var m_stSeaWaterArea2Bitmap:BitmapData;
      
      private var m_stNoSeaWaterBGBitmap:BitmapData;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iStartChangeMapTime:int = -1;
      
      private var m_stBattleFieldFor4View:BattleFieldFor4View;
      
      public function NightCheeseBeachTempleGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         var iMapID:int = 0;
         this.m_stSeaWaterArea0Bitmap = GetBitMap("BattleArea0BitmapData");
         this.m_stSeaWaterArea1Bitmap = GetBitMap("BattleArea1BitmapData");
         this.m_stSeaWaterArea2Bitmap = GetBitMap("BattleArea2BitmapData");
         this.m_stNoSeaWaterBGBitmap = GetBitMap("BattleBackground0BitmapData");
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               for(j = 0; j < BattleFieldView.a_1011; j++)
               {
                  stCurrentBattleFieldView.stFieldGridsVector[i][j].m_isNeedTray = true;
               }
            }
         }
         this.m_iStartChangeMapTime = -1;
         this.m_iCurrentTimeIntval = 0;
         if(stCurrentBattleFieldView != null && stCurrentBattleFieldView.parent != null)
         {
            this.m_stBattleFieldFor4View = stCurrentBattleFieldView.parent as BattleFieldFor4View;
            if(Boolean(this.m_stBattleFieldFor4View && this.m_stBattleFieldFor4View.root) && Boolean(this.m_stBattleFieldFor4View.root.hasOwnProperty("m_stGameData")) && Boolean((this.m_stBattleFieldFor4View.root as Object).m_stGameData))
            {
               iMapID = int((this.m_stBattleFieldFor4View.root as Object).m_stGameData["iMapID"]);
               if(536870912 == (iMapID & 0xFFFF0000))
               {
                  this.m_iStartChangeMapTime = this.m_iCurrentTimeIntval + 40;
               }
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         if(stData is Array && stData[0] == 1 && stData[1] == 1)
         {
            this.m_iStartChangeMapTime = this.m_iCurrentTimeIntval;
            this.m_stBattleFieldFor4View = stData[2] as BattleFieldFor4View;
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         this.m_iCurrentTimeIntval = iTimeNum;
         if(this.m_iStartChangeMapTime > 0 && Boolean(this.m_stBattleFieldFor4View))
         {
            if(this.m_iCurrentTimeIntval == this.m_iStartChangeMapTime + 20)
            {
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData = this.m_stNoSeaWaterBGBitmap.clone();
               this.m_stBattleFieldFor4View.m_stBackgroudBitmap.bitmapData = this.m_stBattleFieldFor4View.m_stBackgroudBitmapData;
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData.copyPixels(this.m_stSeaWaterArea0Bitmap,this.m_stSeaWaterArea0Bitmap.rect,new Point(293,100));
               stCurrentBattleFieldView = this.m_stBattleFieldFor4View.m_stMyBattleFieldView;
               for(i = 0; i < BattleFieldView.a_1012; i++)
               {
                  for(j = 0; j < BattleFieldView.a_1011; j++)
                  {
                     stCurrentBattleFieldView.stFieldGridsVector[i][j].m_isNeedTray = false;
                  }
               }
            }
            else if(this.m_iCurrentTimeIntval == this.m_iStartChangeMapTime + 40)
            {
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData.copyPixels(this.m_stSeaWaterArea1Bitmap,this.m_stSeaWaterArea1Bitmap.rect,new Point(293,100));
            }
            else if(this.m_iCurrentTimeIntval == this.m_iStartChangeMapTime + 60)
            {
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData.copyPixels(this.m_stSeaWaterArea2Bitmap,this.m_stSeaWaterArea2Bitmap.rect,new Point(293,100));
            }
         }
      }
   }
}

