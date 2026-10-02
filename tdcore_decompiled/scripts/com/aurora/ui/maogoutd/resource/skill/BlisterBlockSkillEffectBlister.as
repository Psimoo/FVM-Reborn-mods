package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.FrameLabel;
   
   public class BlisterBlockSkillEffectBlister extends BaseSkillEffect
   {
      
      private var m_iStartTime:int;
      
      public function BlisterBlockSkillEffectBlister()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : BlisterBlockSkillEffectBlister
      {
         return PoolManager.getInstance().CheckOutOne(BlisterBlockSkillEffectBlister) as BlisterBlockSkillEffectBlister;
      }
      
      override protected function getBindMovie() : Class
      {
         return BlisterBlockSkillEffectBlisterMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         a_1275 = 1;
         this.m_iStartTime = -1;
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
         if(iTimeNum - this.m_iStartTime == 100)
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

