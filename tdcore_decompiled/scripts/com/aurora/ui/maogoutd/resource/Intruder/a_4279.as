package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class a_4279 extends a_4206
   {
      
      private var a_1534:int = 0;
      
      public function a_4279()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(a_4279,SelfBoomMouseMoveIntruderMovie) as a_4279;
      }
      
      public static function GetFreePVPInstance() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(a_4279,SelfBoomPVPMouseMoveIntruderMovie) as a_4279;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 170;
         a_1279 = -width * 0.4;
         this.a_1534 = 300;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 9)
         {
            a_1275 = 9;
            gotoAndStop((a_1276[9] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 50)
         {
            if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 9)
         {
            a_1275 = 9;
            gotoAndStop((a_1276[9] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         var numOrigXPos:Number = x;
         if(this.a_1534 >= 34)
         {
            --this.a_1534;
         }
         if(this.a_1534 > 0 && this.a_1534 <= 32)
         {
            --this.a_1534;
            if(this.a_1534 == 12)
            {
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            if(this.a_1534 == 8)
            {
               BattleFieldView.a_1048.play();
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3466();
               stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
               xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
               yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
               xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
               trace("CokeBoom: yStart:" + yStart + " yEnd: " + yEnd + " xStart:" + xStart + " xEnd:" + xEnd);
               for(y = yStart; y <= yEnd; y++)
               {
                  for(x = xStart; x <= xEnd; x++)
                  {
                     if(stFieldGridVector[y][x].m_stProtector)
                     {
                        stFieldGridVector[y][x].m_stProtector.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stProtector.a_3969(stFieldGridVector[y][x].m_stProtector.iLifeValue);
                     }
                     if(stFieldGridVector[y][x].m_stAttackFighter)
                     {
                        stFieldGridVector[y][x].m_stAttackFighter.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stAttackFighter.a_3969(stFieldGridVector[y][x].m_stAttackFighter.iLifeValue);
                     }
                     if(stFieldGridVector[y][x].m_stFlowerDefense)
                     {
                        stFieldGridVector[y][x].m_stFlowerDefense.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stFlowerDefense.a_3969(stFieldGridVector[y][x].m_stFlowerDefense.iLifeValue);
                     }
                     if(stFieldGridVector[y][x].m_stBaseAuxiliaryFighter)
                     {
                        stFieldGridVector[y][x].m_stBaseAuxiliaryFighter.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stBaseAuxiliaryFighter.a_3969(stFieldGridVector[y][x].m_stBaseAuxiliaryFighter.iLifeValue);
                     }
                     if(stFieldGridVector[y][x].m_stHoneyTrapBaseDefense)
                     {
                        stFieldGridVector[y][x].m_stHoneyTrapBaseDefense.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stHoneyTrapBaseDefense.a_3969(stFieldGridVector[y][x].m_stHoneyTrapBaseDefense.iLifeValue);
                     }
                     if(stFieldGridVector[y][x].m_stOceanGoddessToolDefense)
                     {
                        stFieldGridVector[y][x].m_stOceanGoddessToolDefense.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stOceanGoddessToolDefense.a_3969(stFieldGridVector[y][x].m_stOceanGoddessToolDefense.iLifeValue);
                     }
                     if(stFieldGridVector[y][x].m_stBoomDefense)
                     {
                        stFieldGridVector[y][x].m_stBoomDefense.m_iDieType = 1;
                        stFieldGridVector[y][x].m_stBoomDefense.a_3969(stFieldGridVector[y][x].m_stBoomDefense.iLifeValue);
                     }
                  }
               }
            }
            if(this.a_1534 == 0)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               a_3940();
            }
            return true;
         }
         super.a_4216(iCurrentTime);
         if(Boolean(m_stCurrentFieldGrid) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false,false))
         {
            if(33 == this.a_1534)
            {
               this.a_1534 = 32;
            }
            if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
            return true;
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

