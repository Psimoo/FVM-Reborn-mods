package com.aurora.ui.maogoutd.resource.defender.HorseYear.thunder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ThunderboltHorseSecondAttackFighter extends a_3953
   {
      
      private static const MAX_COLLECT_BULLET:int = 6;
      
      private var m_collectEffectArray:Array = [];
      
      private var m_iCollectTimeNum:int;
      
      private var m_stTargetMoveIntruder:a_4206;
      
      private const COLLECT_POS:Array = [{
         "x":-1.25,
         "y":24.55,
         "rot":-28
      },{
         "x":4,
         "y":1.85,
         "rot":-25
      },{
         "x":20.65,
         "y":-12.45,
         "rot":0
      },{
         "x":38.9,
         "y":-19.85,
         "rot":17
      },{
         "x":57.8,
         "y":-16.9,
         "rot":38
      },{
         "x":68.55,
         "y":-2.85,
         "rot":55
      }];
      
      public function ThunderboltHorseSecondAttackFighter()
      {
         super();
         a_1095 = ThunderboltHorseDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 2;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ThunderboltHorseSecondAttackFighter) as ThunderboltHorseSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThunderboltHorseSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = ThunderboltHorseDefence.a_3965(a_1094) * 1.35;
            a_1309 = ThunderboltHorseDefence.a_3966(m_iSkillDegree);
            this.m_iCollectTimeNum = 0;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ThunderboltHorseDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            this.m_stTargetMoveIntruder = ThunderboltHorseDefence.GetTheFarthestIntruder(a_1334,x);
            if(this.m_stTargetMoveIntruder == null)
            {
               if(iCurrentTime >= this.m_iCollectTimeNum + a_1309)
               {
                  this.Collectbullets();
                  this.m_iCollectTimeNum = iCurrentTime;
               }
               return false;
            }
            this.Collectbullets(false);
            a_1321 = iCurrentTime;
            this.m_iCollectTimeNum = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -30 : 30;
            stLastWaitShot = a_1324.pop();
            this.RemoveOneCollectEffect();
            if(stLastWaitShot)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 1,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function Collectbullets(needaddEffect:Boolean = true) : void
      {
         if(a_1324.length >= MAX_COLLECT_BULLET)
         {
            return;
         }
         var shot:a_4348 = ThunderboltHorseSecondShot.a_4344();
         if(!shot)
         {
            return;
         }
         (shot as ThunderboltHorseSecondShot).stTargetMoveIntruder = this.m_stTargetMoveIntruder;
         a_1324.push(shot);
         if(!needaddEffect)
         {
            return;
         }
         this.AddCollectEffect();
         this.UpdateCollectEffectPos();
      }
      
      private function AddCollectEffect() : void
      {
         var effect:ThunderboltHorseSecondCollectEffect = ThunderboltHorseSecondCollectEffect.a_3926();
         effect.a_1797(this.IsReversed());
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.OBSTACL_TYPE,a_1334);
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(effect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
         }
         this.m_collectEffectArray.push(effect);
      }
      
      private function RemoveOneCollectEffect() : void
      {
         if(this.m_collectEffectArray.length <= 0)
         {
            return;
         }
         var effect:ThunderboltHorseSecondCollectEffect = this.m_collectEffectArray.pop();
         if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(effect);
         }
         effect.a_3940();
         this.UpdateCollectEffectPos();
      }
      
      private function UpdateCollectEffectPos() : void
      {
         var cfg:Object = null;
         var effect:ThunderboltHorseSecondCollectEffect = null;
         var count:int = int(this.m_collectEffectArray.length);
         if(count == 0)
         {
            return;
         }
         var centerX:Number = x;
         var centerY:Number = y;
         var limit:int = count < this.COLLECT_POS.length ? count : int(this.COLLECT_POS.length);
         for(var i:int = 0; i < limit; i++)
         {
            cfg = this.COLLECT_POS[i];
            effect = this.m_collectEffectArray[i];
            effect.x = centerX + (IsReversed() ? -cfg.x : cfg.x);
            effect.y = centerY + cfg.y;
            effect.rotation = cfg.rot;
         }
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            if(!a_1278)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         var effect:ThunderboltHorseSecondCollectEffect = null;
         while(this.m_collectEffectArray.length > 0)
         {
            effect = this.m_collectEffectArray.pop();
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(effect);
            }
            if(effect.parent)
            {
               effect.parent.removeChild(effect);
            }
            effect.a_3940();
         }
         super.a_3940();
         a_1324.length = 0;
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

