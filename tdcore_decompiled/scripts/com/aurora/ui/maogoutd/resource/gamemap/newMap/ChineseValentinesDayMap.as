package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class ChineseValentinesDayMap extends BaseGameMap
   {
      
      private static var ms_stDayAirHighBitmapData:BitmapData;
      
      private static var ms_stDayAirLowBitmapData:BitmapData;
      
      private static var ms_stValentineActiveABitmapData:BitmapData;
      
      private static var ms_stValentineActiveBBitmapData:BitmapData;
      
      private static var ms_stValentineActiveCBitmapData:BitmapData;
      
      private static var ms_stValentineActiveDBitmapData:BitmapData;
      
      private static var m_vActiveBitmapData:Vector.<BitmapData>;
      
      public static const STATE_BEGAIN:int = 1;
      
      public static const STATE_RUN:int = 2;
      
      public static const STATE_AIR:int = 3;
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var ms_arrAirBitmaps:Array;
      
      private var m_stMapTerrainSp:Sprite;
      
      private var m_vTerrainBitmap:Vector.<Vector.<Bitmap>>;
      
      private var m_vTerrainSequence:Vector.<StructTerrainInfo>;
      
      private var m_iWaveStatus:int;
      
      public function ChineseValentinesDayMap()
      {
         var iY:int = 0;
         var iX:int = 0;
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         this.ms_arrAirBitmaps = [];
         this.m_stMapTerrainSp = new Sprite();
         this.m_vTerrainBitmap = new Vector.<Vector.<Bitmap>>();
         for(iY = 0; iY < 7; iY++)
         {
            this.ms_arrAirBitmaps[iY] = [];
            this.m_vTerrainBitmap.push(new Vector.<Bitmap>(9));
            for(iX = 0; iX < 9; iX++)
            {
               this.m_vTerrainBitmap[iY][iX] = new Bitmap();
               this.m_vTerrainBitmap[iY][iX].x = iX * a_3491.a_1080;
               this.m_vTerrainBitmap[iY][iX].y = iY * a_3491.a_1081;
               this.m_vTerrainBitmap[iY][iX].bitmapData = null;
               this.m_stMapTerrainSp.addChildAt(this.m_vTerrainBitmap[iY][iX],iY % 2 ? this.m_stMapTerrainSp.numChildren : 0);
            }
         }
         this.m_vTerrainSequence = new Vector.<StructTerrainInfo>();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function a_4177() : void
      {
         var iX:int = 0;
         for(var iY:int = 0; iY < 7; iY++)
         {
            for(iX = 0; iX < 9; iX++)
            {
               this.m_vTerrainBitmap[iY][iX].bitmapData = null;
            }
         }
         while(this.m_vTerrainSequence.length > 0)
         {
            this.m_vTerrainSequence.pop();
         }
         super.a_4177();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         if(null == ms_stDayAirHighBitmapData)
         {
            ms_stDayAirHighBitmapData = GetBitMap("ValentineHighAirCloudBitmapData");
            ms_stDayAirLowBitmapData = GetBitMap("ValentineLowAirCloudBitmapData");
            ms_stValentineActiveABitmapData = GetBitMap("ValentineActiveABitmapData");
            ms_stValentineActiveBBitmapData = GetBitMap("ValentineActiveBBitmapData");
            ms_stValentineActiveCBitmapData = GetBitMap("ValentineActiveCBitmapData");
            ms_stValentineActiveDBitmapData = GetBitMap("ValentineActiveDBitmapData");
         }
         if(null == m_vActiveBitmapData)
         {
            m_vActiveBitmapData = new Vector.<BitmapData>(4);
            m_vActiveBitmapData[0] = ms_stValentineActiveABitmapData;
            m_vActiveBitmapData[1] = ms_stValentineActiveBBitmapData;
            m_vActiveBitmapData[2] = ms_stValentineActiveCBitmapData;
            m_vActiveBitmapData[3] = ms_stValentineActiveDBitmapData;
         }
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.addChildAt(this.m_stMapTerrainSp,0);
               this.InitTerrain();
            }
         }
         this.m_iChangeCount = 1;
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      private function InitTerrain() : void
      {
         var iRandom:int = 0;
         var bitmapdata:BitmapData = null;
         var iY:int = 0;
         var iX:int = 0;
         this.m_iWaveStatus = 0;
         for(iY = 0; iY < 7; iY++)
         {
            if(null == this.m_vTerrainBitmap[iY])
            {
               this.m_vTerrainBitmap[iY] = new Vector.<Bitmap>(9);
            }
            for(iX = 2; iX < 9; iX++)
            {
               iRandom = (Math.random() * 1000 >> 0) % 3;
               bitmapdata = m_vActiveBitmapData[iRandom];
               this.m_vTerrainBitmap[iY][iX].bitmapData = bitmapdata;
               this.m_vTerrainBitmap[iY][iX].x = iX * a_3491.a_1080;
               this.m_vTerrainBitmap[iY][iX].y = iY * a_3491.a_1081;
            }
         }
      }
      
      override public function OnWaveStatusData(iWaveStatus:int) : void
      {
         if(this.m_iWaveStatus == iWaveStatus)
         {
            return;
         }
         this.m_iWaveStatus = iWaveStatus;
         this.OnWaveStatusChange();
      }
      
      private function OnWaveStatusChange() : void
      {
         switch(this.m_iWaveStatus)
         {
            case 3:
               trace("第三波开始");
               this.LandModification(0);
               this.LandModification(6);
               break;
            case 5:
               trace("第五波开始");
               this.LandModification(1);
               this.LandModification(5);
               break;
            case 7:
               trace("第七波开始");
               this.LandModification(2);
               this.LandModification(3);
               this.LandModification(4);
         }
      }
      
      private function LandModification(iGridY:int) : void
      {
         var sequece:StructTerrainInfo = new StructTerrainInfo();
         sequece.m_iState = STATE_BEGAIN;
         sequece.m_iGridY = iGridY;
         sequece.m_iAirIndex = -1;
         sequece.m_fMoveX = 0;
         sequece.m_vTerrain = this.m_vTerrainBitmap[iGridY].slice();
         sequece.m_iTerrainIndex = -1;
         this.m_vTerrainSequence.push(sequece);
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stTerrain:StructTerrainInfo = null;
         var iYIndex:int = 0;
         var iLastIndex:int = 0;
         var iStartX:int = 0;
         var i:int = 0;
         var iXIndex:int = 0;
         if(this.m_vTerrainSequence.length == 0)
         {
            return;
         }
         this.m_iCurrentTimeIntval = iTimeNum;
         var iNoAirCloudRow:int = -1;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = a_3491.a_1080 / 120;
         var bChange:Boolean = false;
         if(iTimeNum > 100 && iTimeNum % 600 == 1)
         {
            iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
         }
         for each(stTerrain in this.m_vTerrainSequence)
         {
            if(STATE_BEGAIN == stTerrain.m_iState)
            {
               bChange = true;
               stTerrain.m_fMoveX = 0;
               stTerrain.m_iAirIndex = -1;
               stTerrain.m_iState = STATE_RUN;
               this.m_vTerrainBitmap[stTerrain.m_iGridY][BattleFieldView.a_1011 - 1].bitmapData = null;
               this.a_3502(stTerrain.m_iGridY,BattleFieldView.a_1011 - 1);
            }
            stTerrain.m_fMoveX += numAirMoveSpreed;
            iLastIndex = stTerrain.m_fMoveX / a_3491.a_1080 >> 0;
            if(STATE_RUN == stTerrain.m_iState && BattleFieldView.a_1011 - iLastIndex <= 2)
            {
               stTerrain.m_iState = STATE_AIR;
            }
            if(iLastIndex != stTerrain.m_iTerrainIndex)
            {
               stTerrain.m_iTerrainIndex = iLastIndex;
               bChange = true;
               if(stTerrain.m_iAirIndex > 0)
               {
                  --stTerrain.m_iAirIndex;
               }
               if(stTerrain.m_iAirIndex < 2)
               {
                  stTerrain.m_iAirIndex = -1;
               }
            }
            if(STATE_RUN == stTerrain.m_iState)
            {
               this.m_vTerrainBitmap[stTerrain.m_iGridY][BattleFieldView.a_1011 - stTerrain.m_iTerrainIndex - 1].bitmapData = null;
               if(BattleFieldView.a_1011 - stTerrain.m_iTerrainIndex - 1 >= 2)
               {
                  this.a_3502(stTerrain.m_iGridY,BattleFieldView.a_1011 - stTerrain.m_iTerrainIndex - 1);
               }
            }
            if(iNoAirCloudRow == stTerrain.m_iGridY && stTerrain.m_iAirIndex < 0)
            {
               stTerrain.m_iAirIndex = BattleFieldView.a_1011 - 1;
            }
            if(stTerrain.m_iAirIndex > 0)
            {
               if(this.CheckAir(stTerrain.m_iAirIndex,stTerrain.m_iGridY))
               {
                  stTerrain.m_vTerrain[stTerrain.m_iAirIndex].bitmapData = (iLastIndex + i) % 2 ? ms_stDayAirHighBitmapData : ms_stDayAirLowBitmapData;
                  stTerrain.m_iAirIndex = -1;
               }
               else if(iTimeNum % 120 > 0 && iTimeNum % 120 < 100)
               {
                  stTerrain.m_vTerrain[stTerrain.m_iAirIndex].bitmapData = null;
                  this.a_3502(stTerrain.m_iGridY,stTerrain.m_iAirIndex);
               }
            }
            iStartX = BattleFieldView.a_1011 - stTerrain.m_iTerrainIndex - 1;
            iStartX = iStartX < 1 ? 1 : iStartX;
            for(i = iStartX; i < BattleFieldView.a_1011 - 1; i++)
            {
               if(i != stTerrain.m_iAirIndex && bChange && i != BattleFieldView.a_1011 - stTerrain.m_iTerrainIndex - 1)
               {
                  stTerrain.m_vTerrain[i].bitmapData = (iLastIndex + i) % 2 ? ms_stDayAirHighBitmapData : ms_stDayAirLowBitmapData;
               }
               if(bChange && stTerrain.m_iAirIndex > 0)
               {
                  stTerrain.m_vTerrain[stTerrain.m_iAirIndex].bitmapData = null;
               }
               stTerrain.m_vTerrain[i].x = (i + 1) * a_3491.a_1080 - stTerrain.m_fMoveX % a_3491.a_1080;
            }
         }
         for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
         {
            for(iXIndex = 0; iXIndex < BattleFieldView.a_1011; iXIndex++)
            {
               if((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense)
               {
                  (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense.a_3940();
               }
            }
         }
      }
      
      private function CheckAir(iXIndex:int, iYIndex:int) : Boolean
      {
         if(Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex] as a_3491).m_stBaseToolDefense) || Boolean(iXIndex + 1 < BattleFieldView.a_1012 && (this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex + 1] as a_3491).m_stBaseToolDefense) || Boolean((this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex - 1] as a_3491).m_stBaseToolDefense))
         {
            return true;
         }
         return false;
      }
      
      protected function a_3502(iGridY:int, iGridX:int) : Boolean
      {
         var stFieldGrid:a_3491 = this.m_stCurrentBattleFieldView.stFieldGridsVector[iGridY][iGridX];
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

import flash.display.Bitmap;

class StructTerrainInfo
{
   
   public var m_iState:int;
   
   public var m_iGridY:int;
   
   public var m_iTerrainIndex:int;
   
   public var m_fMoveX:Number;
   
   public var m_iAirIndex:int;
   
   public var m_vTerrain:Vector.<Bitmap>;
   
   public var m_vAir:Vector.<Bitmap>;
   
   public function StructTerrainInfo()
   {
      super();
   }
}
