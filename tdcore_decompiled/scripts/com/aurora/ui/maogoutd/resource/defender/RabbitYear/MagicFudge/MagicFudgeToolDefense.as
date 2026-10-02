package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MagicFudge
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   
   public class MagicFudgeToolDefense extends a_3976
   {
      
      private var m_iStartTime:int = -1;
      
      public function MagicFudgeToolDefense()
      {
         super();
         a_1095 = MagicFudgeDefine.DEFENSE_PRICE;
         a_1338 = 15;
         a_1281 = false;
         m_iToolType = 2;
      }
      
      public static function a_3926() : a_3976
      {
         return PoolManager.getInstance().CheckOutOne(MagicFudgeToolDefense) as MagicFudgeToolDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicFudgeToolDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MagicFudgeDefine.GetLandCardStarDegreeEffectValue(a_1094);
         a_1275 = 1;
         this.m_iStartTime = -1;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MagicFudgeDefine.a_3966(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 450 * 0.5)
         {
            a_1275 = 1;
         }
         else if(a_1339 > 0)
         {
            a_1275 = 2;
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
         if(this.m_iStartTime < 0)
         {
            this.m_iStartTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iStartTime > 24000)
         {
            this.a_3969(a_1339);
         }
      }
   }
}

