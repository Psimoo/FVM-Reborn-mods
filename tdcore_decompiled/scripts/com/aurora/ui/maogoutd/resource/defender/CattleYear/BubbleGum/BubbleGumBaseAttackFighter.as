package com.aurora.ui.maogoutd.resource.defender.CattleYear.BubbleGum
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class BubbleGumBaseAttackFighter extends a_3960
   {
      
      protected var a_1386:int;
      
      private var m_SecondSkillWaitTime:int = -100;
      
      private var m_BoundStopMouse:Array = new Array();
      
      private var stEffect:BubbleEffect;
      
      public function BubbleGumBaseAttackFighter()
      {
         super();
         a_1095 = BubbleGumBoomDefine.DEFENSE_PRICE;
         a_1332 = true;
         a_1330 = 0;
         m_iBoomType = 1;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(BubbleGumBaseAttackFighter) as BubbleGumBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BubbleGumBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         while(this.m_BoundStopMouse.length > 0)
         {
            this.m_BoundStopMouse.pop();
         }
         this.visible = true;
         this.a_1386 = BubbleGumBoomDefine.a_3966(m_iSkillDegree);
         this.m_SecondSkillWaitTime = -100;
         a_1275 = 0;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         a_1340 = true;
         a_1339 = BubbleGumBoomDefine.GetCardLifeValue(a_1094);
         a_1331 = true;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BubbleGumBoomDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         this.removeEffectMovie();
         super.a_3940();
         while(this.m_BoundStopMouse.length > 0)
         {
            this.m_BoundStopMouse.pop();
         }
         return true;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         --this.a_1386;
         if(this.stEffect != null)
         {
            this.stEffect.a_4003(iCurrentTime);
         }
         if(this.a_1386 == 0)
         {
            BattleFieldView.a_1033.play();
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.addEffect();
            this.visible = false;
            a_3968();
            a_1340 = false;
            a_1331 = false;
            this.m_SecondSkillWaitTime = 15 * 20;
         }
         if(this.m_SecondSkillWaitTime > 0)
         {
            for each(stMoveIntruder in stFieldGrid.a_1511)
            {
               if((0 == stMoveIntruder.iSpaceState || 1 == stMoveIntruder.iSpaceState) && this.m_BoundStopMouse.indexOf(stMoveIntruder) == -1)
               {
                  this.m_BoundStopMouse.push(stMoveIntruder);
                  setTimeout(this.showMouseEffect,3500,stMoveIntruder);
               }
            }
            --this.m_SecondSkillWaitTime;
         }
         else if(this.m_SecondSkillWaitTime == 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               if(this.stEffect != null)
               {
                  this.stEffect.gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
         }
         if(a_1273 == a_1274)
         {
            if(this.stEffect != null)
            {
               this.stEffect.a_3940();
            }
            super.a_3969(a_1339);
         }
         return true;
      }
      
      private function addEffect() : void
      {
         if(!stFieldGrid)
         {
            return;
         }
         if(this.stEffect == null)
         {
            this.stEffect = BubbleEffect.a_3926();
            this.stEffect.a_1797(false);
         }
         this.stEffect.x = a_3491.a_1080 * a_1334.m_iXGridNo - 10;
         this.stEffect.y = a_3491.a_1081 * a_1334.m_iYGridNo;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
      }
      
      private function removeEffectMovie() : void
      {
         if(this.stEffect != null)
         {
            this.stEffect.a_3940();
         }
      }
      
      private function showMouseEffect(stMoveIntruder:a_4206) : void
      {
         stMoveIntruder.a_4208(b_182.a_435,this.m_SecondSkillWaitTime / 2);
      }
   }
}

