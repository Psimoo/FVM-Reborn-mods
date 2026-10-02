package com.aurora.utils.anticheat
{
   public class PieceBehaviorVerifycationEngine
   {
      
      private var _collector:BehaviorCollector;
      
      private var _checker:PieceBehaviorComplianceChecker;
      
      public function PieceBehaviorVerifycationEngine(isDebug:Boolean)
      {
         super();
         this._collector = new BehaviorCollector();
         this._checker = new PieceBehaviorComplianceChecker(isDebug);
      }
      
      public function record(type:String, data:Object) : void
      {
         if(this._collector)
         {
            this._collector.record(type,data);
         }
      }
      
      public function recordBan(ban:Boolean) : void
      {
         if(this._collector)
         {
            this._collector.recordBan(ban);
         }
      }
      
      public function evaluateResultCompliance() : Boolean
      {
         var seq:Array = this._collector.getEventSequence();
         this._checker.loadEventSequence(seq);
         return this._checker.evaluateCompliance();
      }
      
      public function getBanState() : Boolean
      {
         return this._collector.getBanValue();
      }
      
      public function clear() : void
      {
         this._collector.clear();
      }
   }
}

