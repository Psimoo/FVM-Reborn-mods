package com.aurora.ui.maogoutd.resource.defender.HorseYear.OceanGoddess
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class OceanGoddessBaseDefense extends a_3959
   {
      
      private var stBottomEffect:BaseGameEffect;
      
      protected var sourceID:String = "";
      
      private var m_SkillTargetsDic:Dictionary = new Dictionary();
      
      public function OceanGoddessBaseDefense()
      {
         super();
         a_1095 = OceanGoddessAuxiliaryDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(OceanGoddessBaseDefense) as OceanGoddessBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return OceanGoddessBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         if(m_bServerIssued)
         {
            m_RotateShotMultiplier = OceanGoddessAuxiliaryDefine.a_3965(a_1094);
            this.sourceID = "OceanGoddess_" + m_iDefenseGlobalID;
         }
         super.a_1797(stFieldGrid);
         a_1275 = 1;
         return true;
      }
      
      override public function finalizeInitialization() : void
      {
         super.finalizeInitialization();
         if(m_bServerIssued)
         {
            this.addRangeEffect();
         }
      }
      
      override protected function a_3964() : int
      {
         return OceanGoddessAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            super.ShowPlayOther(iCurrentTime);
            if(a_1334 == null || this.sourceID == "")
            {
               return;
            }
            AttackBuffManager.instance.UpdateBuffRange(this.sourceID,a_1334,2,2,this.FilterTarget,this.ApplySkillBuff,true,this.OnOutOfRange);
         }
      }
      
      private function FilterTarget(target:a_3953) : Boolean
      {
         if(!target || !target.stFieldGrid || !a_1334)
         {
            return false;
         }
         if(m_RotateShotMultiplier <= target.a_1325)
         {
            return false;
         }
         return this.IsTargetDefense(target.a_3512(),target.stFieldGrid.m_iYGridNo == a_1334.m_iYGridNo);
      }
      
      private function IsTargetDefense(iDefenseTypeID:int, isSameRow:Boolean) : Boolean
      {
         if(BattleVOUtil.IsRotateShotCard(iDefenseTypeID))
         {
            return true;
         }
         if(OceanGoddessAuxiliaryDefine.IsSingleStraightShotCard(iDefenseTypeID))
         {
            return isSameRow;
         }
         return false;
      }
      
      private function ApplySkillBuff(srcID:String, target:a_3953) : void
      {
         if(!target)
         {
            return;
         }
         target.a_1325 = m_RotateShotMultiplier;
         this.m_SkillTargetsDic[target.m_iDefenseGlobalID] = target;
      }
      
      private function OnOutOfRange(srcID:String, target:a_3953) : void
      {
         if(!target)
         {
            return;
         }
         target.a_1325 = 1;
         delete this.m_SkillTargetsDic[target.m_iDefenseGlobalID];
      }
      
      private function recoverHurt() : void
      {
         var t:a_3953 = null;
         for each(t in this.m_SkillTargetsDic)
         {
            if(t)
            {
               t.a_1325 = 1;
            }
         }
         this.m_SkillTargetsDic = new Dictionary();
      }
      
      private function addRangeEffect() : void
      {
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.recoverHurt();
            if(this.sourceID != "")
            {
               AttackBuffManager.instance.RemoveBuffBySource(this.sourceID);
            }
            this.sourceID = "";
            if(this.stBottomEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.stBottomEffect);
               }
               this.stBottomEffect.a_3940();
               this.stBottomEffect = null;
            }
         }
         super.a_3940();
         return true;
      }
   }
}

