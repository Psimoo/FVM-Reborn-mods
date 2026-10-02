package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   
   public class SuperStarSkillEffectStar extends BaseSkillEffect
   {
      
      public var a_1334:a_3491;
      
      public var m_iSuperStarNum:int;
      
      private var m_isBoomed:Boolean;
      
      public function SuperStarSkillEffectStar()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : SuperStarSkillEffectStar
      {
         return PoolManager.getInstance().CheckOutOne(SuperStarSkillEffectStar) as SuperStarSkillEffectStar;
      }
      
      override protected function getBindMovie() : Class
      {
         return SuperStarSkillEffectStarMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_isBoomed = false;
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
         var stBaseMoveIntrude:a_4206 = null;
         var i:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iDropEnergyValue:int = 0;
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
         }
         if(!this.m_isBoomed && a_1273 == a_1274 - 1)
         {
            this.m_isBoomed = true;
            if(this.a_1334)
            {
               for each(stBaseMoveIntrude in this.a_1334.a_1511.slice())
               {
                  stBaseMoveIntrude.a_4212();
               }
            }
            if(this.a_1334.m_stCurrentBattbleFieldView)
            {
               for(i = 0; i < 1; i++)
               {
                  stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
                  if(null != stFreeEnergy)
                  {
                     iDropEnergyValue = this.a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? int(a_3971.a_1341 * 25) : 5;
                     stFreeEnergy.m_stCurrentBattleField = this.a_1334.m_stCurrentBattbleFieldView;
                     stFreeEnergy.a_1797(0,iDropEnergyValue,a_3491.a_1080 * this.a_1334.m_iXGridNo + Math.random() * 30 - 30,a_3491.a_1081 * this.a_1334.m_iYGridNo + Math.random() * 20 - 30);
                     this.a_1334.m_stCurrentBattbleFieldView.addChild(stFreeEnergy);
                  }
               }
            }
         }
      }
   }
}

