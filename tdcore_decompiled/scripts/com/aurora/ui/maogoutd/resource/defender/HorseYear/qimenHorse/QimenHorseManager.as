package com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseBaseHitEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseBaseRangeEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseFirstHitEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseFirstRangeEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseSecondHitEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseSecondRangeEffectMovie;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class QimenHorseManager
   {
      
      private static var _instance:QimenHorseManager;
      
      private var _trans0Range:Array = [[0,2],[0,3],[0,4],[4,2],[4,3],[4,4],[8,2],[8,3],[8,4]];
      
      private var _trans1Range:Array = [[0,1],[0,2],[0,3],[0,4],[0,5],[4,1],[4,2],[4,3],[4,4],[4,5],[8,1],[8,2],[8,3],[8,4],[8,5]];
      
      private var _trans2Range:Array = [[0,1],[0,2],[0,3],[0,4],[0,5],[2,1],[2,2],[2,3],[2,4],[2,5],[4,1],[4,2],[4,3],[4,4],[4,5],[6,1],[6,2],[6,3],[6,4],[6,5],[8,1],[8,2],[8,3],[8,4],[8,5]];
      
      private var _trans3Range:Array = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[4,0],[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[8,0],[8,1],[8,2],[8,3],[8,4],[8,5],[8,6]];
      
      private var _iTimeNum:int = 0;
      
      private var _lastAttackNum:int = 0;
      
      private var _battleView:BattleFieldView;
      
      private var _horses:Array = [];
      
      private var _maxTranCard:QimenHorseBaseAttackFighter = null;
      
      private var _maxAttack:int = -1;
      
      private var _lastBarrierType:int = -1;
      
      private var _barrierEffectArr:Array = [];
      
      public function QimenHorseManager()
      {
         super();
      }
      
      public static function getInstance() : QimenHorseManager
      {
         if(_instance == null)
         {
            _instance = new QimenHorseManager();
         }
         return _instance;
      }
      
      private function UpdateMax() : void
      {
         var horse:QimenHorseBaseAttackFighter = null;
         this._maxAttack = -1;
         this._maxTranCard = null;
         for(var i:int = 0; i < this._horses.length; i++)
         {
            horse = this._horses[i];
            if(this._maxTranCard == null || horse.trans > this._maxTranCard.trans)
            {
               this._maxTranCard = horse;
            }
            if(horse.iShotHurtForEach > this._maxAttack)
            {
               this._maxAttack = horse.iShotHurtForEach;
            }
         }
      }
      
      public function AddOne(attacker:QimenHorseBaseAttackFighter) : void
      {
         this._battleView = attacker.stFieldGrid.m_stCurrentBattbleFieldView;
         if(this._horses.indexOf(attacker) == -1)
         {
            this._horses.push(attacker);
         }
      }
      
      public function a_3897(iTimeNum:int) : void
      {
         if(this._iTimeNum == iTimeNum)
         {
            return;
         }
         this._iTimeNum = iTimeNum;
         this.UpdateMax();
         var type:int = -1;
         if(this._horses.length == 0)
         {
            type = -1;
         }
         else if(this._horses.length <= 7)
         {
            type = 0;
         }
         else if(this._horses.length <= 14)
         {
            type = 1;
         }
         else if(this._horses.length >= 22 && this._maxTranCard.trans >= 2)
         {
            type = 3;
         }
         else
         {
            type = 2;
         }
         if(type != this._lastBarrierType)
         {
            this._lastBarrierType = type;
            this._lastAttackNum = this._iTimeNum;
            this.RealeaseAll();
            if(type == 0)
            {
               this.AddEffect(0);
               this.AddEffect(4);
               this.AddEffect(8);
            }
            else if(type == 1)
            {
               this.AddEffect(0);
               this.AddEffect(4);
               this.AddEffect(8);
            }
            else if(type == 2 || type == 3)
            {
               this.AddEffect(0);
               this.AddEffect(2);
               this.AddEffect(4);
               this.AddEffect(6);
               this.AddEffect(8);
            }
         }
         if(this._lastBarrierType != -1 && this._maxTranCard != null && iTimeNum - this._lastAttackNum == this._maxTranCard.iShotIntervalTimeNum)
         {
            this.DoAttack();
            this._lastAttackNum = this._iTimeNum;
         }
      }
      
      private function DoAttack() : void
      {
         if(this._lastBarrierType == 0)
         {
            this.AttackRange(this._trans0Range);
         }
         else if(this._lastBarrierType == 1)
         {
            this.AttackRange(this._trans1Range);
         }
         else if(this._lastBarrierType == 2)
         {
            this.AttackRange(this._trans2Range);
         }
         else if(this._lastBarrierType == 3)
         {
            this.AttackRange(this._trans3Range);
         }
      }
      
      private function AttackRange(arr:Array) : void
      {
         var grid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < arr.length; i++)
         {
            grid = this._battleView.a_3438(arr[i][0],arr[i][1]);
            if(grid != null)
            {
               arrMoveIntruder = grid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  this.AttackOneMouse(stMoveIntruder);
               }
            }
         }
      }
      
      private function AttackOneMouse(stMoveIntruder:a_4206) : void
      {
         if(stMoveIntruder.iLifeValue <= 0)
         {
            return;
         }
         if(stMoveIntruder.isCannotSeeByFighter && stMoveIntruder.iSpaceState != 1)
         {
            return;
         }
         if(stMoveIntruder.iSpaceState == 3)
         {
            return;
         }
         var attackDamage:Number = this._maxAttack * this._horses.length;
         if(this._lastBarrierType == 0)
         {
            BattleEffectUtil.AddHitEffect(stMoveIntruder,QimenHorseBaseHitEffectMovie);
         }
         else if(this._lastBarrierType == 1 || this._lastBarrierType == 2)
         {
            BattleEffectUtil.AddHitEffect(stMoveIntruder,QimenHorseFirstHitEffectMovie);
         }
         else if(this._lastBarrierType == 3)
         {
            BattleEffectUtil.AddHitEffect(stMoveIntruder,QimenHorseSecondHitEffectMovie);
         }
         if(this._maxTranCard.trans >= 2)
         {
            stMoveIntruder.PowerfulBombReduceLifeRate(attackDamage / 900);
         }
         else
         {
            stMoveIntruder.a_3969(attackDamage);
            if(stMoveIntruder.iLifeValue > 0)
            {
               stMoveIntruder.a_4208(b_182.a_432,1);
            }
         }
      }
      
      private function RealeaseAll() : void
      {
         var effect:BaseGameEffect = null;
         var i:int = 0;
         for(i = 0; i < this._barrierEffectArr.length; i++)
         {
            effect = this._barrierEffectArr[i];
            effect.a_3940();
         }
         this._barrierEffectArr.length = 0;
      }
      
      private function AddEffect(iNoX:int) : void
      {
         var effect:BaseGameEffect = null;
         var grid:a_3491 = this._battleView.a_3438(iNoX,3);
         if(grid == null)
         {
            return;
         }
         if(this._lastBarrierType == 0)
         {
            effect = BattleEffectUtil.CreateGameEffect2(QimenHorseBaseRangeEffectMovie,grid);
         }
         else if(this._lastBarrierType == 2 || this._lastBarrierType == 1)
         {
            effect = BattleEffectUtil.CreateGameEffect2(QimenHorseFirstRangeEffectMovie,grid);
         }
         else if(this._lastBarrierType == 3)
         {
            effect = BattleEffectUtil.CreateGameEffect2(QimenHorseSecondRangeEffectMovie,grid);
         }
         effect.SetAnimation(0);
         this._barrierEffectArr.push(effect);
      }
      
      public function RemoveOne(attacker:QimenHorseBaseAttackFighter) : void
      {
         var idx:int = this._horses.indexOf(attacker);
         if(idx != -1)
         {
            this._horses.splice(idx,1);
         }
         if(this._horses.length == 0)
         {
            this.RealeaseAll();
            this._lastBarrierType = -1;
            this._maxTranCard = null;
            this._lastAttackNum = 0;
         }
      }
   }
}

