package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class SkillReadyEffect extends a_3909
   {
      
      private var m_iStartTime:int = -1;
      
      public function SkillReadyEffect()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : SkillReadyEffect
      {
         return PoolManager.getInstance().CheckOutOne(SkillReadyEffect) as SkillReadyEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkillReadyEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_iStartTime = -1;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         if(Boolean(parent) && parent.contains(this))
         {
         }
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(this.m_iStartTime < 0)
         {
            this.m_iStartTime = iTimeNum;
         }
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         if(iTimeNum - this.m_iStartTime > 60)
         {
            this.a_3940();
         }
      }
   }
}

