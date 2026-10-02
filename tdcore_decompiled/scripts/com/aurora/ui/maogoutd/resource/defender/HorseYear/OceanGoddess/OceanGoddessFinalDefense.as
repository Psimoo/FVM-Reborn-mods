package com.aurora.ui.maogoutd.resource.defender.HorseYear.OceanGoddess
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class OceanGoddessFinalDefense extends a_3976
   {
      
      private static var m_range:int = 2;
      
      private var m_stTiemr:Timer;
      
      private var stBottomEffect:BaseGameEffect;
      
      private var sourceID:String = "";
      
      private var m_SkillTargetsDic:Dictionary = new Dictionary();
      
      public function OceanGoddessFinalDefense()
      {
         super();
         a_1095 = OceanGoddessAuxiliaryDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
         a_1338 = -31;
         m_iMoveByMap = true;
      }
      
      public static function a_3926() : OceanGoddessFinalDefense
      {
         return PoolManager.getInstance().CheckOutOne(OceanGoddessFinalDefense) as OceanGoddessFinalDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return OceanGoddessFinalDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         if(m_bServerIssued)
         {
            if(stFieldGrid.m_stOceanGoddessToolDefense)
            {
               stFieldGrid.m_stOceanGoddessToolDefense.a_3940();
            }
            stFieldGrid.m_stOceanGoddessToolDefense = this;
            m_RotateShotMultiplier = OceanGoddessAuxiliaryDefine.a_3965(a_1094) + 3.5;
            this.sourceID = "OceanGoddess_" + m_iDefenseGlobalID;
            this.m_stTiemr.reset();
            this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTiemr.start();
         }
         super.a_1797(stFieldGrid);
         a_1275 = 1;
         return true;
      }
      
      override public function finalizeInitialization() : void
      {
         super.finalizeInitialization();
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            ++OceanGoddessFinalEffectManager.instance.m_cardCount;
            OceanGoddessFinalEffectManager.instance.showAll(stFieldGrid);
            this.addRangeEffect();
            m_range = OceanGoddessFinalEffectManager.instance.m_cardCount < 4 ? 2 : 8;
         }
      }
      
      private function addRangeEffect() : void
      {
      }
      
      override protected function a_3964() : int
      {
         return OceanGoddessAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         if(!a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         if(!m_bServerIssued || this.sourceID == "")
         {
            return;
         }
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         super.ShowPlayOther(1);
         AttackBuffManager.instance.UpdateBuffRange(this.sourceID,a_1334,m_range,m_range,this.FilterTarget,this.ApplySkillBuff,true,this.OnOutOfRange);
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
         return this.IsTargetDefense(target.a_3512(),m_range == 8 || target.stFieldGrid.m_iYGridNo == a_1334.m_iYGridNo);
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
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            stFieldGrid.m_stOceanGoddessToolDefense = null;
            this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTiemr.stop();
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
            --OceanGoddessFinalEffectManager.instance.m_cardCount;
            OceanGoddessFinalEffectManager.instance.hideAll();
            m_range = OceanGoddessFinalEffectManager.instance.m_cardCount < 4 ? 2 : 8;
         }
         super.a_3940();
         return true;
      }
   }
}

