package com.aurora.ui.maogoutd.resource.shot.ShotTrigger
{
   public class ShotTriggerManager
   {
      
      private static var _instance:ShotTriggerManager;
      
      public function ShotTriggerManager()
      {
         super();
         if(_instance)
         {
            throw new Error("ShotTriggerManager is singleton!");
         }
      }
      
      public static function get Instance() : ShotTriggerManager
      {
         if(!_instance)
         {
            _instance = new ShotTriggerManager();
         }
         return _instance;
      }
      
      public function CreateTrigger(type:int, probability:int = 100, seed:int = -1, param1:Number = 0, param2:Number = 0, param3:Number = 0) : BaseShotTrigger
      {
         var trigger:BaseShotTrigger = null;
         switch(type)
         {
            case ShotTriggerType.BURNBUFFTRIGGER:
               trigger = new BurnBuffTrigger(probability,seed,param1,param2);
               break;
            case ShotTriggerType.PENETRATECOUNTTRIGGER:
               trigger = new PenetrateCountTrigger(probability,seed,param1,param2);
               break;
            default:
               throw new Error("找不到对应的触发器 type=" + type);
         }
         return trigger;
      }
   }
}

