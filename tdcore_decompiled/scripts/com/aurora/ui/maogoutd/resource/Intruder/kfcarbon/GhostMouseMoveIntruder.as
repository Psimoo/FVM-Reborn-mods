package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GhostMouseMoveIntruder extends a_4206
   {
      
      protected var m_isFlying:Boolean = true;
      
      protected var a_1496:int;
      
      public function GhostMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GhostMouseMoveIntruder) as GhostMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GhostMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1464 = true;
         a_1339 = 1800;
         a_1279 = -width * 0.5;
         a_1462 = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            a_3419();
         }
         else if(a_1339 > 0)
         {
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            a_3419();
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 50)
         {
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            a_3419();
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
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
         var indexY:int = 0;
         var indexX:int = 0;
         super.a_4216(iCurrentTime);
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo <= 0 || iXGridNo >= BattleFieldView.a_1011)
         {
            a_1462 = false;
         }
         else
         {
            a_1462 = true;
         }
         if(a_1339 > 50)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else if(a_1339 > 0)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(m_stCurrentFieldGrid)
         {
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
            xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
            yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
            xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
            for(indexY = yStart; indexY <= yEnd; indexY++)
            {
               for(indexX = xStart; indexX <= xEnd; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 1)
                  {
                     a_1462 = false;
                     if(a_1339 > 50)
                     {
                        a_1275 = 2;
                        gotoAndStop((a_1276[2] as FrameLabel).frame);
                     }
                     else if(a_1339 > 0)
                     {
                        a_1275 = 3;
                        gotoAndStop((a_1276[3] as FrameLabel).frame);
                     }
                  }
               }
            }
            for(indexY = 0; indexY < BattleFieldView.a_1012; indexY++)
            {
               for(indexX = 0; indexX < BattleFieldView.a_1011; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 3)
                  {
                     a_1462 = false;
                     if(a_1339 > 50)
                     {
                        a_1275 = 2;
                        gotoAndStop((a_1276[2] as FrameLabel).frame);
                     }
                     else if(a_1339 > 0)
                     {
                        a_1275 = 3;
                        gotoAndStop((a_1276[3] as FrameLabel).frame);
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

