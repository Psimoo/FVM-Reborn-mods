package com.aurora.ui.maogoutd.resource.defender.RabbitYear.PirateRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class PirateRabbitSmallShot extends a_4348
   {
      
      public var TargetMouse:a_4206;
      
      public function PirateRabbitSmallShot()
      {
         super();
         a_1279 = -28;
         m_iYDisplayCenterPos = -11;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(PirateRabbitSmallShot,PirateRabbitSmallShotMovie) as PirateRabbitSmallShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(PirateRabbitSmallShot,PirateRabbitSmallShot1Movie) as PirateRabbitSmallShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(PirateRabbitSmallShot,PirateRabbitSmallShot2Movie) as PirateRabbitSmallShot;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = this.TargetMouse;
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y + 0.5 * stMoveIntruder.height - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         y += m_numYSpeed;
         return true;
      }
      
      override protected function a_4351() : void
      {
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(Boolean(this.TargetMouse) && Boolean(this.TargetMouse.visible) && this.TargetMouse.iLifeValue > 0)
         {
            if(hitTestObject(this.TargetMouse))
            {
               a_4352(this.TargetMouse);
               m_isHited = true;
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
         }
         else if(m_numYSpeed == 0 && m_numXSpeed == 0)
         {
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
         else
         {
            m_bActive.Value = false;
            a_3940();
         }
      }
   }
}

