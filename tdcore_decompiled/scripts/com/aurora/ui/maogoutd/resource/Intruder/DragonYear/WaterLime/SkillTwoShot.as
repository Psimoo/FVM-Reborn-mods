package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.WaterLime
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SkillTwoShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var m_iStopTime:int = 0;
      
      public function SkillTwoShot()
      {
         super();
         a_1279 = -48;
         m_iYDisplayCenterPos = -364;
         a_1574 = 0;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1587 = 1;
      }
      
      public static function a_4344() : SkillTwoShot
      {
         var stShot:SkillTwoShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new SkillTwoShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkillTwoShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1588 = true;
         a_1573 = 1;
         this.m_iStopTime = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            if(this.m_iStopTime > 0)
            {
               --this.m_iStopTime;
            }
            nextFrame();
            if(a_1273 == a_1274)
            {
               if(this.m_iStopTime > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               else
               {
                  if(a_1584)
                  {
                     a_1584.ClearFieldGridDefenseNoraml();
                  }
                  this.a_3940();
               }
            }
            return;
         }
         if(a_1588 && iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1273 == 3)
            {
               this.m_iStopTime = 40;
               m_isHited = true;
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
      }
      
      private function a_4360(stFieldGrid:a_3491, range:int) : void
      {
         var xIndex:int = 0;
         var stCurFieldGrid:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stCurFieldGrid = a_1583.a_3438(xIndex,yIndex);
               if(stCurFieldGrid)
               {
                  stCurFieldGrid.ClearFieldGridDefenseNoraml();
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(GetFinalDamage());
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage());
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
            }
         }
         if(a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(a_1584) && a_1584.m_iSpecialType == 1)
         {
            a_1584.m_iSpecialType = 0;
         }
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

