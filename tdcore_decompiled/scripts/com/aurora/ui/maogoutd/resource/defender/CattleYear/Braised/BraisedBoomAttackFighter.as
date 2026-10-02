package com.aurora.ui.maogoutd.resource.defender.CattleYear.Braised
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class BraisedBoomAttackFighter extends a_3960
   {
      
      private var HurtTime:int;
      
      public function BraisedBoomAttackFighter()
      {
         super();
         a_1095 = BraisedBoomDefine.DEFENSE_PRICE;
         a_1330 = 2;
         a_1333 = true;
         m_iBoomType = 1;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(BraisedBoomAttackFighter) as BraisedBoomAttackFighter;
      }
      
      override protected function a_3964() : int
      {
         return BraisedBoomDefine.a_3964(a_1094);
      }
      
      override protected function getBindMovie() : Class
      {
         return BraisedBoomAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = BraisedBoomDefine.MAX_LIFE_VALUE;
         this.HurtTime = 10;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var isEatingDefense:Boolean = false;
         if(Boolean(a_1334) && iRduceLifeValue > 0)
         {
            arrMoveIntruder = a_1334.a_1511.slice();
            for each(stMoveIntruder in arrMoveIntruder)
            {
               if(stMoveIntruder.isEatingDefense)
               {
                  if(this.HurtTime > 0)
                  {
                     --this.HurtTime;
                     stMoveIntruder.a_3969(50);
                  }
                  isEatingDefense = true;
               }
            }
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 >= 800)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 >= 600)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 >= 400)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(a_1339 >= 300 && isEatingDefense)
         {
            if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
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
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 4)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
            yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
         else if(a_1273 == a_1274)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
      
      protected function a_3955() : Number
      {
         return width * 0.1;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
   }
}

