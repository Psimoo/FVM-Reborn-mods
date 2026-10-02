package com.aurora.ui.maogoutd.resource.shot.ShotTrigger
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class BaseShotTrigger
   {
      
      protected var m_probability:int = 100;
      
      protected var m_random:RandomSeed;
      
      protected var m_seed:int;
      
      protected var m_caster:a_4348;
      
      protected var m_target:a_4206;
      
      protected var m_isTriggered:Boolean = false;
      
      public function BaseShotTrigger(probability:int = 100, seed:int = -1)
      {
         var enterRoom:Object = null;
         super();
         this.m_probability = probability;
         this.m_seed = seed;
         this.m_random = new RandomSeed();
         if(seed > 0)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_random.setSeed(enterRoom.m_RandomSeed,this.m_seed);
         }
      }
      
      public function a_3014(caster:a_4348, target:a_4206) : void
      {
         this.m_caster = caster;
         this.m_target = target;
         this.m_isTriggered = false;
      }
      
      public function Execute() : void
      {
         if(!this.CheckValid())
         {
            return;
         }
         if(this.RollProbability())
         {
            this.m_isTriggered = true;
            this.OnExecute();
         }
      }
      
      protected function CheckValid() : Boolean
      {
         if(!this.m_target)
         {
            return false;
         }
         if(this.m_target.iLifeValue <= 0)
         {
            return false;
         }
         if(!this.m_target.visible)
         {
            return false;
         }
         if(this.m_target.IsBossIntruder)
         {
            return false;
         }
         if(!this.m_target.m_stCurrentFieldGrid)
         {
            return false;
         }
         return true;
      }
      
      protected function RollProbability() : Boolean
      {
         if(this.m_probability >= 100)
         {
            return true;
         }
         var random:int = int(this.m_random.nextInt(101));
         return random <= this.m_probability;
      }
      
      protected function OnExecute() : void
      {
      }
      
      public function a_4451() : BaseShotTrigger
      {
         return new BaseShotTrigger(this.m_probability);
      }
      
      public function Dispose() : void
      {
         this.m_caster = null;
         this.m_target = null;
         this.m_random = null;
      }
   }
}

