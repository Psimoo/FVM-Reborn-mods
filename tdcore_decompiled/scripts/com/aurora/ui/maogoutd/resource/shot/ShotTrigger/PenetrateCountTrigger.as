package com.aurora.ui.maogoutd.resource.shot.ShotTrigger
{
   public class PenetrateCountTrigger extends BaseShotTrigger
   {
      
      private var m_PeneCount:int = 0;
      
      private var m_MaxCount:int = 0;
      
      public function PenetrateCountTrigger(probability:int = 100, seed:int = -1, nowCount:int = 0, maxCount:int = -1)
      {
         super(probability,seed);
         this.m_PeneCount = nowCount;
         this.m_MaxCount = maxCount;
      }
      
      override protected function OnExecute() : void
      {
         if(!m_caster || !m_caster.m_isPenetrate)
         {
            return;
         }
         ++this.m_PeneCount;
         if(this.m_PeneCount >= this.m_MaxCount)
         {
            if(m_caster)
            {
               m_caster.m_isPenetrate = false;
            }
         }
      }
      
      override protected function CheckValid() : Boolean
      {
         return true;
      }
      
      override public function a_4451() : BaseShotTrigger
      {
         return new PenetrateCountTrigger(m_probability,m_seed,this.m_PeneCount,this.m_MaxCount);
      }
   }
}

