package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.ElectricGuitar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class ElectricGuitarMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1200;
      
      private static const MAX_INJURED_LIFE:Number = MAX_LIFE * 0.3;
      
      private var m_iAppearedTime:int;
      
      private var m_isFlute:Boolean = true;
      
      public function ElectricGuitarMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ElectricGuitarMouseMoveIntruder) as ElectricGuitarMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricGuitarMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2 - 20;
         a_1272 = 0;
         this.m_iAppearedTime = 0;
         this.m_isFlute = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(!this.m_isFlute)
            {
               if(a_1475)
               {
                  if(a_1275 != 2)
                  {
                     a_1275 = 2;
                     gotoAndStop((a_1276[2] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_isFlute)
            {
               if(a_1475)
               {
                  if(a_1275 != 3)
                  {
                     a_1275 = 3;
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
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
         var stMoveIntruder:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(!a_1460)
         {
            a_1465 = 0;
            a_1275 = 5;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            a_1460 = true;
            this.m_isFlute = true;
            this.m_iAppearedTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iAppearedTime == 60)
         {
            for each(stMoveIntruder in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
            {
               if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.parent) && stMoveIntruder.iLifeValue > 0)
               {
                  stMoveIntruder.a_3969(-400);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = stMoveIntruder.x;
                  stAddBloodEffect.y = stMoveIntruder.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
            }
            this.addSpeed();
            if(a_1339 > MAX_INJURED_LIFE)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            this.m_isFlute = false;
         }
         if(iCurrentTime - this.m_iAppearedTime > 60)
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function addSpeed() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 6;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               stTargetFieldGrid.m_SpeedBool = true;
               setTimeout(this.ClearSpeedBool,10 * 1000,stTargetFieldGrid);
            }
         }
      }
      
      private function ClearSpeedBool(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         stFieldGrid.m_SpeedBool = false;
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

