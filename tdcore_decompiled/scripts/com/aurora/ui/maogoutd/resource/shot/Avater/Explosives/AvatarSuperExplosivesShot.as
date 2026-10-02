package com.aurora.ui.maogoutd.resource.shot.Avater.Explosives
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AvatarSuperExplosivesShot extends a_4348
   {
      
      private static var ms_stAvatarSuperExplosivesShotVector:Array = new Array();
      
      public var m_numSputteringRate:Number = 0;
      
      public function AvatarSuperExplosivesShot()
      {
         super();
         a_1279 = -80;
         m_iYDisplayCenterPos = -34;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:AvatarSuperExplosivesShot = ms_stAvatarSuperExplosivesShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new AvatarSuperExplosivesShot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperExplosivesShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         gotoAndStop(1);
         param4 = 198 - 30;
         param5 = 19 + 20;
         param7 = param6.a_3438(0,3);
         scaleX = scaleY = 1;
         if(param6.iIntruderMoveDirection > 0)
         {
            param4 = BattleFieldView.a_1013 - param4;
         }
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         if(m_isSpecial <= 2)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[a_1275 - 1] as FrameLabel).frame);
         }
         else if(m_isSpecial <= 9)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[a_1275 - 1] as FrameLabel).frame);
         }
         else if(m_isSpecial <= 14)
         {
            a_1275 = 5;
            gotoAndStop((a_1276[a_1275 - 1] as FrameLabel).frame);
         }
         else if(m_isSpecial == 15)
         {
            a_1275 = 7;
            gotoAndStop((a_1276[a_1275 - 1] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(ms_stAvatarSuperExplosivesShotVector.indexOf(this) == -1)
         {
            ms_stAvatarSuperExplosivesShotVector.push(this);
         }
         return true;
      }
      
      public function ForceRelease() : Boolean
      {
         return this.a_3940();
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            if(iCurrentTime % 1 == 0)
            {
               nextFrame();
               if(a_1273 == 17 || a_1273 == 49 || a_1273 == 81 || a_1273 == 113)
               {
                  this.HitMouseMoveIntruderTest();
               }
               else
               {
                  if(a_1273 == 32 || a_1273 == 64 || a_1273 == 96 || a_1273 == 128)
                  {
                     this.a_3940();
                     return;
                  }
                  if(a_1273 == a_1274 || a_1278 != null)
                  {
                     gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                  }
               }
            }
         }
      }
      
      private function HitMouseMoveIntruderTest() : void
      {
         var stFieldGrid:a_3491 = null;
         if(m_isSpecial <= 2)
         {
            stFieldGrid = a_1583.a_3438(8,3);
            this.BoomHit(stFieldGrid);
         }
         else if(m_isSpecial <= 9)
         {
            stFieldGrid = a_1583.a_3438(8,1);
            this.BoomHit(stFieldGrid);
            stFieldGrid = a_1583.a_3438(8,5);
            this.BoomHit(stFieldGrid);
         }
         else if(m_isSpecial <= 14)
         {
            stFieldGrid = a_1583.a_3438(8,0);
            this.BoomHit(stFieldGrid);
            stFieldGrid = a_1583.a_3438(8,3);
            this.BoomHit(stFieldGrid);
            stFieldGrid = a_1583.a_3438(8,6);
            this.BoomHit(stFieldGrid);
         }
         else if(m_isSpecial == 15)
         {
            stFieldGrid = a_1583.a_3438(8,0);
            this.BoomHit(stFieldGrid);
            stFieldGrid = a_1583.a_3438(8,2);
            this.BoomHit(stFieldGrid);
            stFieldGrid = a_1583.a_3438(8,4);
            this.BoomHit(stFieldGrid);
            stFieldGrid = a_1583.a_3438(8,6);
            this.BoomHit(stFieldGrid);
         }
      }
      
      private function BoomHit(stFieldGrid:a_3491) : void
      {
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(stMoveIntruder != null && stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue > 0)
               {
                  stMoveIntruder.a_4209(a_1579);
                  stMoveIntruder.ShowBoomDieEffect();
                  if(stMoveIntruder.iLifeValue <= 0)
                  {
                     stMoveIntruder.a_3432();
                  }
               }
            }
         }
         this.a_4360(stFieldGrid);
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid && stFieldGrid != stHitenFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != null)
                     {
                        stMouseIntruder.a_4209(int(a_1579 * this.m_numSputteringRate));
                        stMouseIntruder.ShowBoomDieEffect();
                        if(stMouseIntruder.iLifeValue <= 0)
                        {
                           stMouseIntruder.a_3432();
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

