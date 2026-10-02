package com.aurora.ui.maogoutd.resource.Intruder.newBoss.mermaidMary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class TideMouseMoveIntruder extends a_4206
   {
      
      private static var m_vMouseInst:Vector.<TideMouseMoveIntruder> = new Vector.<TideMouseMoveIntruder>();
      
      private var m_bIsCanDead:Boolean;
      
      public function TideMouseMoveIntruder()
      {
         super();
         this.m_bIsCanDead = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TideMouseMoveIntruder) as TideMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TideMouseMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == m_vMouseInst.indexOf(this))
         {
            this.m_bIsCanDead = false;
         }
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 20;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 500;
         a_1279 = -width * 0.5;
         SetCannotSeeByFighter(true);
         a_1463 = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.a_3492()) || m_stCurrentFieldGrid.m_iXGridNo == 0)
         {
            if(m_stCurrentFieldGrid.a_3492())
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            this.m_bIsCanDead = true;
            this.a_3969(a_1339);
            this.m_bIsCanDead = false;
         }
         else if((a_1276[1] as FrameLabel).frame - 1 == a_1273)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            play();
         }
         return true;
      }
      
      private function ChangeFrameLabelIndex() : void
      {
         if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         a_3419();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         this.ChangeFrameLabelIndex();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_bIsCanDead)
         {
            return false;
         }
         super.a_3969(iRduceLifeValue);
         this.ChangeFrameLabelIndex();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return false;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         if(!(stBaseDefense is a_3924))
         {
            BattleFieldView.ms_kenShi29.play();
         }
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(a_1377);
         return true;
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

