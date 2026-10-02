package com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge.effect.MagicFudgeBoomEffect;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge.effect.MagicFudgeBubbleEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class MagicFudgeWaterTrayPrimaryDefense extends a_3977
   {
      
      private static var a_1400:Array = new Array();
      
      private static var a_1300:Vector.<BitmapData> = new Vector.<BitmapData>(100);
      
      private static var a_1301:Vector.<Point> = new Vector.<Point>(100);
      
      private static var a_1302:MovieClip = new MagicFudgeWaterTrayPrimaryDefenseMovie();
      
      private var a_1363:a_4448;
      
      private var m_iWaitTime:int;
      
      private var m_BomDie:Boolean = false;
      
      private var stBubbleEffect:a_4108;
      
      public function MagicFudgeWaterTrayPrimaryDefense()
      {
         super();
         a_1095 = 0;
         a_1338 = -7;
         a_1337 = -7;
         m_iOffsetByY = 61;
      }
      
      public static function a_3926() : a_3977
      {
         var stWaterTrayDefense:MagicFudgeWaterTrayPrimaryDefense = null;
         stWaterTrayDefense = a_1400.pop();
         if(null == stWaterTrayDefense)
         {
            stWaterTrayDefense = new MagicFudgeWaterTrayPrimaryDefense();
         }
         stWaterTrayDefense.visible = true;
         return stWaterTrayDefense;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1339 = MagicFudgeDefine.GetWaterCardStarDegreeEffectValue(a_1094);
            a_1275 = 1;
            this.m_iWaitTime = MagicFudgeDefine.GetCardPrimaryValueByGradeDegree(m_iGradeDegree);
            this.m_BomDie = false;
            if(a_1336)
            {
               a_1336.x += 9;
            }
         }
         return true;
      }
      
      override protected function a_3911() : Vector.<BitmapData>
      {
         return a_1300;
      }
      
      override protected function a_3912() : Vector.<Point>
      {
         return a_1301;
      }
      
      override protected function a_3913() : MovieClip
      {
         return a_1302;
      }
      
      override protected function a_3964() : int
      {
         return MagicFudgeDefine.a_3966(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1 || m_iDieType == 2)
            {
               this.addBoomEffect();
            }
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(Boolean(null == this.a_1363) && Boolean(parent) && !this.m_BomDie)
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (width - this.a_1363.width) - 5;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (width - this.a_1363.width) + 5;
            }
            this.a_1363.y = y + height - 0.5 * this.a_1363.height - 9;
            parent.addChildAt(this.a_1363,0);
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1273 == 5)
            {
               this.addBubbleEffect();
            }
            if(a_1278 != null || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            ShowPlayOther(iCurrentTime);
            if(this.a_1363)
            {
               this.a_1363.nextFrame();
            }
         }
      }
      
      public function addBoomEffect() : void
      {
         var stBoomEffect:a_4108 = null;
         if(!a_1334)
         {
            return;
         }
         stBoomEffect = MagicFudgeBoomEffect.a_3926();
         (stBoomEffect as MagicFudgeBoomEffect).stOriginalFieldGrid = a_1334;
         stBoomEffect.a_1797(false);
         stBoomEffect.x = x + (a_1283 ? -56 : 56);
         stBoomEffect.y = y + 71;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stBoomEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
      }
      
      private function addBubbleEffect() : void
      {
         if(Boolean(!a_1334) || Boolean(this.stBubbleEffect) || !a_1336)
         {
            return;
         }
         this.stBubbleEffect = MagicFudgeBubbleEffect.a_3926();
         (this.stBubbleEffect as MagicFudgeBubbleEffect).stOriginalFieldGrid = a_1334;
         (this.stBubbleEffect as MagicFudgeBubbleEffect).m_iWaitTime = this.m_iWaitTime;
         this.stBubbleEffect.a_1797(this.a_1283);
         this.stBubbleEffect.x = this.x + a_1336.x + a_1336.width / 2;
         this.stBubbleEffect.y = this.y + a_1336.y + BattleFieldView.yOffsetList[a_1094];
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.stBubbleEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
      }
      
      private function removeEffectMovie() : void
      {
         if(this.stBubbleEffect != null)
         {
            this.stBubbleEffect.a_3940();
            this.stBubbleEffect = null;
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         this.removeEffectMovie();
         gotoAndStop(1);
         super.a_3940();
         if(-1 == a_1400.indexOf(this))
         {
            a_1400.push(this);
         }
         return true;
      }
   }
}

