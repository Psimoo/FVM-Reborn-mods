package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MagicFudge
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class MagicFudgeWaterTrayDefense extends a_3977
   {
      
      private var a_1363:a_4448;
      
      public function MagicFudgeWaterTrayDefense()
      {
         super();
         a_1095 = MagicFudgeDefine.DEFENSE_PRICE;
         a_1338 = 7;
         m_iOffsetByY = 18;
         a_1281 = false;
      }
      
      public static function a_3926() : a_3977
      {
         return PoolManager.getInstance().CheckOutOne(MagicFudgeWaterTrayDefense) as MagicFudgeWaterTrayDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicFudgeWaterTrayDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MagicFudgeDefine.GetWaterCardStarDegreeEffectValue(a_1094);
         a_1275 = 1;
         if(a_1336)
         {
            a_1336.x += 2;
            a_1336.y += -2;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MagicFudgeDefine.a_3966(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(null == this.a_1363 && Boolean(parent))
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (width - this.a_1363.width) + 5 + 5;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (width - this.a_1363.width) - 5 + 5;
            }
            this.a_1363.y = y + height - 0.5 * this.a_1363.height - 22;
            parent.addChildAt(this.a_1363,0);
         }
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
            if(this.a_1363)
            {
               this.a_1363.nextFrame();
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         return true;
      }
   }
}

