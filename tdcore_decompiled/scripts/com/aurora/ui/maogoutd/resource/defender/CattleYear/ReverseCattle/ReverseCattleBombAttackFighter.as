package com.aurora.ui.maogoutd.resource.defender.CattleYear.ReverseCattle
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.Bitmap;
   import flash.utils.setTimeout;
   
   public class ReverseCattleBombAttackFighter extends a_3960
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8388649,8389221);
      
      private var gobackGrid:int;
      
      public function ReverseCattleBombAttackFighter()
      {
         super();
         a_1095 = ReverseCattleBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(ReverseCattleBombAttackFighter) as ReverseCattleBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ReverseCattleBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = ReverseCattleBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ReverseCattleBombDefine.a_3964(a_1094);
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
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 1,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 1,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo);
                     if(stTargetFieldGrid != null && stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray)
                     {
                        this.ChageMouseX(stMoveIntruder);
                     }
                  }
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function ChageMouseX(stMoveIntruder:a_4206) : Boolean
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
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo);
            a_1334.a_3457(stMoveIntruder);
            a_1334.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
            }
            this.gobackGrid = BattleFieldView.a_1011 - 1 - stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
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
         stMoveIntruder.x += this.gobackGrid * a_3491.a_1080;
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

