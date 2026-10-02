package com.aurora.ui.maogoutd.resource.defender.HorseYear.lanternCake
{
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class LanternCakeManager
   {
      
      private static var _instance:LanternCakeManager;
      
      internal static const PATH3_MIN_CARD_COUNT:int = 10;
      
      internal static const PATH3_SHOT_INTERVAL:int = 5 * 20;
      
      private var _iCurrentTime:int = -1;
      
      private var _defenderArr:Array = [];
      
      private var _maxDefender:a_3953 = null;
      
      private var _attackTick:int = 0;
      
      public function LanternCakeManager()
      {
         super();
      }
      
      public static function getInstance() : LanternCakeManager
      {
         if(_instance == null)
         {
            _instance = new LanternCakeManager();
         }
         return _instance;
      }
      
      public function Add(defender:a_3953) : void
      {
         if(defender is LanternCakeBaseAttackFighter)
         {
            return;
         }
         var idx:int = this._defenderArr.indexOf(defender);
         if(idx == -1)
         {
            this._defenderArr.push(defender);
         }
      }
      
      public function a_3897(iCurrentTime:int) : void
      {
         if(this._iCurrentTime == iCurrentTime)
         {
            return;
         }
         this._iCurrentTime = iCurrentTime;
         if(this._defenderArr.length >= PATH3_MIN_CARD_COUNT)
         {
            ++this._attackTick;
            if(this._attackTick == PATH3_SHOT_INTERVAL)
            {
               this.UpdateDefender();
               if(this._maxDefender != null)
               {
                  this._maxDefender.SpecialSkillCallBack();
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
         var defender:a_3953 = null;
         var maxHurt:int = -1;
         this._maxDefender = null;
         for(var i:int = 0; i < this._defenderArr.length; i++)
         {
            defender = this._defenderArr[i];
            if(defender.iAttackDamage > maxHurt)
            {
               maxHurt = defender.iAttackDamage;
               this._maxDefender = defender;
            }
         }
      }
      
      public function Remove(defender:a_3953) : void
      {
         if(defender is LanternCakeBaseAttackFighter)
         {
            return;
         }
         var idx:int = this._defenderArr.indexOf(defender);
         if(idx != -1)
         {
            this._defenderArr.splice(idx,1);
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

