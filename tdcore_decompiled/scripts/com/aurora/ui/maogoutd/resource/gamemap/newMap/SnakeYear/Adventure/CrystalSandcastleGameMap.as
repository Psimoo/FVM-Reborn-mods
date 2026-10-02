package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.game.BattleFieldFor4View;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class CrystalSandcastleGameMap extends SeasonBaseGameMap
   {
      
      private var m_stSeaWaterArea0Bitmap:BitmapData;
      
      private var m_stSeaWaterArea1Bitmap:BitmapData;
      
      private var m_stNoSeaWaterBG0Bitmap:BitmapData;
      
      private var m_stNoSeaWaterBG1Bitmap:BitmapData;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iStartChangeMapTime:int = -1;
      
      private var m_stBattleFieldFor4View:BattleFieldFor4View;
      
      private var m_TotalObstacle2Pos:Array = new Array([0,5],[3,4],[3,7],[6,7]);
      
      private var arrBron:Array = new Array([0,6],[3,3],[6,6]);
      
      public function CrystalSandcastleGameMap()
      {
         super();
         m_stMapInfoData.m_iBattleFieldStageType = 1;
         m_stMapInfoData.m_iBattleModType = 0;
         m_stMapInfoData.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var k:int = 0;
         var j:int = 0;
         this.m_stSeaWaterArea0Bitmap = GetBitMap("BattleArea0BitmapData");
         this.m_stSeaWaterArea1Bitmap = GetBitMap("BattleArea1BitmapData");
         this.m_stNoSeaWaterBG0Bitmap = GetBitMap("BattleBackground0BitmapData");
         this.m_stNoSeaWaterBG1Bitmap = GetBitMap("BattleBackground1BitmapData");
         super.SetBattleFieldTerrain(stBattleFieldObject);
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
            for(k = 0; k < this.m_TotalObstacle2Pos.length; k++)
            {
               stCurrentBattleFieldView.stFieldGridsVector[this.m_TotalObstacle2Pos[k][0]][this.m_TotalObstacle2Pos[k][1]].m_iFieldGridType = 4;
            }
            m_iCreateTick = 20 * 15;
         }
         this.m_iStartChangeMapTime = -1;
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
         var arr:Array = null;
         var stCurrentBattleFieldView:BattleFieldView = null;
         var j:int = 0;
         this.m_iCurrentTimeIntval = iTimeNum;
         var i:int = 0;
         for(i = 0; i < m_ringBallArray.length; i++)
         {
            if(m_ringBallArray[i] != null)
            {
               m_ringBallArray[i].RunTick();
            }
         }
         for(i = 0; i < m_rayArray.length; i++)
         {
            if(m_rayArray[i] != null)
            {
               m_rayArray[i].RunTick();
            }
         }
         --m_iCreateTick;
         if(m_iCreateTick == 840)
         {
            CreateShadow3();
         }
         else if(m_iCreateTick <= 0)
         {
            lBallPath.length = 0;
            arr = CreateBestGridArray(this.arrBron);
            CreateBall(arr[0]);
            CreateBall(arr[1]);
            ++m_iCreateCount;
            m_iCreateTick = 45 * 20;
         }
         if(this.m_iStartChangeMapTime > 0 && Boolean(this.m_stBattleFieldFor4View))
         {
            if(this.m_iCurrentTimeIntval == this.m_iStartChangeMapTime + 20)
            {
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData = this.m_stNoSeaWaterBG0Bitmap.clone();
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
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData = this.m_stNoSeaWaterBG1Bitmap.clone();
               this.m_stBattleFieldFor4View.m_stBackgroudBitmap.bitmapData = this.m_stBattleFieldFor4View.m_stBackgroudBitmapData;
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData.copyPixels(this.m_stSeaWaterArea1Bitmap,this.m_stSeaWaterArea1Bitmap.rect,new Point(293,100));
            }
         }
      }
   }
}

