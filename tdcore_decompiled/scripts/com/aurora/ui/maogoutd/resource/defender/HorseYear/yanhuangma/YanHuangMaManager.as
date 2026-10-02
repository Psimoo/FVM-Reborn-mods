package com.aurora.ui.maogoutd.resource.defender.HorseYear.yanhuangma
{
   public class YanHuangMaManager
   {
      
      private static var _instance:YanHuangMaManager;
      
      private const MAX_COUNT:int = 7;
      
      private const ATTACK_INTERVAL:int = 100;
      
      private var _iCurrentTime:int = -1;
      
      private var _defenderArr:Array = [];
      
      private var _maxDefender:YanHuangMaBaseAttackFighter = null;
      
      private var _attackTick:int = 0;
      
      public function YanHuangMaManager()
      {
         super();
      }
      
      public static function getInstance() : YanHuangMaManager
      {
         if(_instance == null)
         {
            _instance = new YanHuangMaManager();
         }
         return _instance;
      }
      
      public function Add(defender:YanHuangMaBaseAttackFighter) : void
      {
         if(defender.trans <= 0)
         {
            return;
         }
         var idx:int = this._defenderArr.indexOf(defender);
         if(idx == -1)
         {
            this._defenderArr.push(defender);
            this.UpdateDefender();
         }
      }
      
      public function a_3897(iCurrentTime:int) : void
      {
         if(this._iCurrentTime == iCurrentTime)
         {
            return;
         }
         this._iCurrentTime = iCurrentTime;
         if(this._defenderArr.length >= this.MAX_COUNT)
         {
            ++this._attackTick;
            if(this._attackTick == this.ATTACK_INTERVAL)
            {
               if(this._maxDefender != null)
               {
                  this._maxDefender.AddRightShot();
               }
               this._attackTick = 0;
            }
         }
         else
         {
            this._attackTick = 0;
         }
      }
      
      private function UpdateDefender() : void
      {
         var defender:YanHuangMaBaseAttackFighter = null;
         var maxStar:int = -1;
         this._maxDefender = null;
         for(var i:int = 0; i < this._defenderArr.length; i++)
         {
            defender = this._defenderArr[i];
            if(defender.a_1094 > maxStar)
            {
               maxStar = defender.a_1094;
               this._maxDefender = defender;
            }
         }
      }
      
      public function Remove(defender:YanHuangMaBaseAttackFighter) : void
      {
         if(defender.trans <= 0)
         {
            return;
         }
         var idx:int = this._defenderArr.indexOf(defender);
         if(idx != -1)
         {
            this._defenderArr.splice(idx,1);
            this.UpdateDefender();
         }
         if(this._defenderArr.length == 0)
         {
            this._iCurrentTime = -1;
            this._attackTick = 0;
            this._maxDefender = null;
         }
      }
   }
}

