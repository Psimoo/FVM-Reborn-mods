package com.aurora.ui.maogoutd.resource.defender.TigerYear.DaFuTiger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class DaFuTigerFirstAttackFighter extends a_3953
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var appearedTimes:int = 0;
      
      private var stEffect:SpiceEffect;
      
      private var m_MouseArr:Array = new Array(8388649,8389221);
      
      private var gobackGrid:int;
      
      public function DaFuTigerFirstAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = DaFuTigerDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DaFuTigerFirstAttackFighter) as DaFuTigerFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DaFuTigerFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 10;
         super.a_1797(stFieldGrid);
         a_1339 = 15 * 10;
         a_1311 = DaFuTigerDefence.a_3965(a_1094);
         a_1309 = DaFuTigerDefence.a_3966(m_iSkillDegree);
         this.appearedTimes = 0;
         a_1308 = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DaFuTigerDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(Boolean(iRduceLifeValue > 0) && Boolean(a_1334) && m_iDieType == 1)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(iRduceLifeValue);
                  }
               }
            }
         }
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            else
            {
               this.a_4210();
               super.a_3969(iRduceLifeValue);
            }
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.stEffect)
         {
            this.stEffect.a_3940();
            this.stEffect = null;
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
            if(this.stEffect)
            {
               this.stEffect.a_3940();
               this.stEffect = null;
            }
            this.addSpiceEffect();
            a_1321 = iCurrentTime;
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == a_1274 - 2)
            {
               this.a_4210();
               return false;
            }
            if(a_1273 == a_1274)
            {
               super.a_3969(a_1339);
               return false;
            }
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 1;
            a_1307 = a_1273;
            if(this.stEffect)
            {
               this.stEffect.a_3940();
               this.stEffect = null;
            }
            this.addSpiceEffect();
         }
         return true;
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 0,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 0,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 0,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
      
      private function addSpiceEffect() : void
      {
         if(stFieldGrid != null)
         {
            this.stEffect = SpiceEffect.a_3926();
            this.stEffect.a_1797(false);
            this.stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            this.stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
            this.ReleaseSpiceSkill();
         }
      }
      
      public function ReleaseSpiceSkill() : void
      {
         var xIndex:int = 0;
         var tpFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tpFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = tpFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo,a_1334.m_iYGridNo);
                  if(stTargetFieldGrid != null && stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray && stTargetFieldGrid != stMoveIntruder.m_stCurrentFieldGrid)
                  {
                     this.ChageMouseY(stMoveIntruder);
                  }
               }
            }
         }
      }
      
      private function ChageMouseY(stMoveIntruder:a_4206) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stScareBitmap:Bitmap = null;
         this.gobackGrid = 0;
         if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance)
         {
            return false;
         }
         if(!stMoveIntruder.isFearCatHead)
         {
            return false;
         }
         if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
         {
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo,a_1334.m_iYGridNo);
            a_1334.a_3457(stMoveIntruder);
            a_1334.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            if(-1 == arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               return false;
            }
            if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
            }
            this.gobackGrid = stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo - a_1334.m_iYGridNo;
            stScareBitmap = ms_arrMouseScareBitmapArray.pop();
            if(null == stScareBitmap)
            {
               stScareBitmap = new Bitmap();
               stScareBitmap.bitmapData = BitMapManager.getInstance().GetMouseScareBitmapData();
            }
            stScareBitmap.visible = true;
            stScareBitmap.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x;
            stScareBitmap.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.parent.addChildAt(stScareBitmap,stMoveIntruder.parent.getChildIndex(stMoveIntruder) + 1);
            BattleFieldView.a_1021.play();
            setTimeout(this.OnMouseScareTimeout,100,a_1334.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTargetFieldGrid,stScareBitmap);
         }
         return true;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap) : void
      {
         stMoveIntruder.y += this.gobackGrid * a_3491.a_1081;
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         if(Boolean(stMouseScareBitmap.parent) && stMouseScareBitmap.parent.contains(stMouseScareBitmap))
         {
            stMouseScareBitmap.parent.removeChild(stMouseScareBitmap);
         }
         stMouseScareBitmap.visible = false;
         if(-1 == ms_arrMouseScareBitmapArray.indexOf(stMouseScareBitmap))
         {
            ms_arrMouseScareBitmapArray.push(stMouseScareBitmap);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

