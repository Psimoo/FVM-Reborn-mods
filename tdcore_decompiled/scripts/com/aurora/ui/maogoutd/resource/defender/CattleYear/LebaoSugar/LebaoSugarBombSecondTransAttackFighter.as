package com.aurora.ui.maogoutd.resource.defender.CattleYear.LebaoSugar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.Bitmap;
   import flash.utils.setTimeout;
   
   public class LebaoSugarBombSecondTransAttackFighter extends a_3960
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8388649,8389221);
      
      private var gobackGrid:int;
      
      public function LebaoSugarBombSecondTransAttackFighter()
      {
         super();
         a_1095 = LebaoSugarBombDefine.SECONDTRANS_DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1279 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(LebaoSugarBombSecondTransAttackFighter) as LebaoSugarBombSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return LebaoSugarBombSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = LebaoSugarBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return LebaoSugarBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 1)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 2,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 2,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo,a_1334.m_iYGridNo);
                     if(stTargetFieldGrid != null && stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray)
                     {
                        this.ChageMouseY(stMoveIntruder);
                     }
                  }
               }
            }
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,a_1334.m_iYGridNo);
               this.RealeasePoisonShot(stFieldGrid);
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function RealeasePoisonShot(stFieldGrid:a_3491) : void
      {
         var stPoisonShot:a_4348 = LebaoSugarPoisonShot.a_4344();
         stPoisonShot.iShotSequenceNum = 0;
         var iPosX:int = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         var iPosY:int = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
         stPoisonShot.a_1797(0,0,350 * 1,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.EFFECT_LAYER_TRAY_BOTTOM_TYPE,stFieldGrid);
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
   }
}

