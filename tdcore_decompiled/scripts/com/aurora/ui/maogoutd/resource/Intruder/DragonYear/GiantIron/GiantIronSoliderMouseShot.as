package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.GiantIron
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GiantIronSoliderMouseShot extends a_4348
   {
      
      private static var ms_stGiantIronSoliderMouseShotVector:Array = new Array();
      
      public function GiantIronSoliderMouseShot()
      {
         super();
         a_1573 = 1;
      }
      
      public static function a_4344() : GiantIronSoliderMouseShot
      {
         var stGiantIronSoliderMouseShot:GiantIronSoliderMouseShot = ms_stGiantIronSoliderMouseShotVector.pop();
         if(null == stGiantIronSoliderMouseShot)
         {
            stGiantIronSoliderMouseShot = new GiantIronSoliderMouseShot();
         }
         BattleFieldView.a_1017.play();
         return stGiantIronSoliderMouseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GiantIronSoliderMouseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         scaleX = 1;
         if(iHurtPower == 10)
         {
            gotoAndStop(6);
            this.SetAnimation(1);
         }
         else
         {
            gotoAndStop(1);
            this.SetAnimation(0);
         }
         return true;
      }
      
      public function SetReverse() : void
      {
         m_numXSpeed *= -1;
         scaleX = -1;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stGiantIronSoliderMouseShotVector.indexOf(this))
         {
            ms_stGiantIronSoliderMouseShotVector.push(this);
         }
         return true;
      }
      
      public function SetAnimation(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4373();
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 + 1 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         var stBaseDefense:a_3962 = null;
         iXGridNo = int(x / a_3491.a_1080);
         var iYGridNo:int = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         var isHero:Boolean = false;
         if(stFieldGrid.a_3492())
         {
            if(null != stFieldGrid.m_stProtector)
            {
               stBaseDefense = stFieldGrid.m_stProtector;
            }
            else if(null != stFieldGrid.m_stFlowerDefense)
            {
               stBaseDefense = stFieldGrid.m_stFlowerDefense;
            }
            else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
            {
               stBaseDefense = stFieldGrid.m_stBaseAuxiliaryFighter;
            }
            else if(null != stFieldGrid.m_stTrayDefense)
            {
               stBaseDefense = stFieldGrid.m_stTrayDefense;
            }
            else if(null != stFieldGrid.m_stAttackFighter)
            {
               stBaseDefense = stFieldGrid.m_stAttackFighter;
               isHero = stFieldGrid.m_stAttackFighter is a_3924;
            }
            else if(null != stFieldGrid.m_stBoomDefense)
            {
               stBaseDefense = stFieldGrid.m_stBoomDefense;
            }
            if(Boolean(stBaseDefense) && hitTestObject(stBaseDefense))
            {
               this.a_4374(stBaseDefense,isHero);
               this.a_3940();
               return;
            }
         }
      }
      
      private function a_4374(stBaseDefense:a_3962, isHero:Boolean) : Boolean
      {
         stBaseDefense.m_iDieType = 1;
         var hurt:int = a_1579;
         if(isHero)
         {
            hurt = Math.min(a_1579,stBaseDefense.iLifeValue - 10);
         }
         stBaseDefense.a_3969(hurt);
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

