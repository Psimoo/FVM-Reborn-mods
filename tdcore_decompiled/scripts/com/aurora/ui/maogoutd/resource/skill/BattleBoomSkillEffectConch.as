package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class BattleBoomSkillEffectConch extends BaseSkillEffect
   {
      
      public var a_1334:a_3491;
      
      public var m_stAttackTargetFieldGrid:a_3491;
      
      public function BattleBoomSkillEffectConch()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : BattleBoomSkillEffectConch
      {
         return PoolManager.getInstance().CheckOutOne(BattleBoomSkillEffectConch) as BattleBoomSkillEffectConch;
      }
      
      override protected function getBindMovie() : Class
      {
         return BattleBoomSkillEffectConchMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
         }
      }
   }
}

