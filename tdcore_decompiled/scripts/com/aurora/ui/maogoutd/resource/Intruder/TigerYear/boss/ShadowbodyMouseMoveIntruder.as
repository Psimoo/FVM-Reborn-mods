package com.aurora.ui.maogoutd.resource.Intruder.TigerYear.boss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class ShadowbodyMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 900000;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      public function ShadowbodyMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ShadowbodyMouseMoveIntruder) as ShadowbodyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShadowbodyMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         a_1275 = 0;
         a_1463 = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_stMouseObstacle)
            {
               m_stCurrentFieldGrid.m_stMouseObstacle = null;
            }
         }
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var index:int = 0;
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo == 0)
            {
               a_1283 = true;
            }
            else
            {
               a_1283 = false;
            }
            this.m_iAppearedTime = iCurrentTime;
            this.m_iWattingTime = 3 * 20 + 12;
         }
         if(iCurrentTime % 2 == 0)
         {
            return true;
         }
         trace("m_iYGridNo>>>" + m_stCurrentFieldGrid.m_iYGridNo + "m_iCurrentFrame::" + a_1273);
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         if(a_1273 == 331 - 311 || a_1273 == 707 - 311)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == 0 && m_stCurrentFieldGrid.m_iYGridNo == 0)
            {
               for(index = 0; index < 3; index++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + index,0);
                  this.a_3502(stTargetFieldGrid);
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 0 && m_stCurrentFieldGrid.m_iYGridNo == 6)
            {
               for(index = 0; index < 3; index++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + index,6);
                  this.a_3502(stTargetFieldGrid);
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 8 && m_stCurrentFieldGrid.m_iYGridNo == 3)
            {
               for(index = 0; index < 3; index++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8 - index,3);
                  this.a_3502(stTargetFieldGrid);
               }
            }
         }
         else if(a_1273 == 332 - 311 || a_1273 == 709 - 311)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == 0 && m_stCurrentFieldGrid.m_iYGridNo == 0)
            {
               for(index = 0; index < 5; index++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + 3 + index,0);
                  this.a_3502(stTargetFieldGrid);
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 0 && m_stCurrentFieldGrid.m_iYGridNo == 6)
            {
               for(index = 0; index < 5; index++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + 3 + index,6);
                  this.a_3502(stTargetFieldGrid);
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 8 && m_stCurrentFieldGrid.m_iYGridNo == 3)
            {
               for(index = 0; index < 5; index++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8 - 3 - index,3);
                  this.a_3502(stTargetFieldGrid);
               }
            }
         }
         else if(a_1273 == 346 - 311 || a_1273 == 722 - 311)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == 0 && m_stCurrentFieldGrid.m_iYGridNo == 0)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,0);
               this.a_3502(stTargetFieldGrid);
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 0 && m_stCurrentFieldGrid.m_iYGridNo == 6)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6);
               this.a_3502(stTargetFieldGrid);
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo == 8 && m_stCurrentFieldGrid.m_iYGridNo == 3)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 - index,3);
               this.a_3502(stTargetFieldGrid);
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

