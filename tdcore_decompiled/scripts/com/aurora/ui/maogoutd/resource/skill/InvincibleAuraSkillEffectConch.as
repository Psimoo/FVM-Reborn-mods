package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.FrameLabel;
   
   public class InvincibleAuraSkillEffectConch extends BaseSkillEffect
   {
      
      private var m_iStartTime:int;
      
      public function InvincibleAuraSkillEffectConch()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : InvincibleAuraSkillEffectConch
      {
         return PoolManager.getInstance().CheckOutOne(InvincibleAuraSkillEffectConch) as InvincibleAuraSkillEffectConch;
      }
      
      override protected function getBindMovie() : Class
      {
         return InvincibleAuraSkillEffectConchMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_iStartTime = -1;
         a_1275 = 1;
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
         if(this.m_iStartTime < 0)
         {
            this.m_iStartTime = iTimeNum;
         }
         if(iTimeNum - this.m_iStartTime == 80)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
   }
}

