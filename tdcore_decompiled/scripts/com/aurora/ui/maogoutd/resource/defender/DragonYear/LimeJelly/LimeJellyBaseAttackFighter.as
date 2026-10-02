package com.aurora.ui.maogoutd.resource.defender.DragonYear.LimeJelly
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class LimeJellyBaseAttackFighter extends a_3953
   {
      
      private var m_appearedTimes:int = 0;
      
      private var m_isStartBoom:Boolean = false;
      
      private var m_bAutoRemove:Boolean = false;
      
      private var cdTime:int;
      
      public function LimeJellyBaseAttackFighter()
      {
         super();
         a_1313 = true;
         a_1310 = 8;
         a_1317 = 2;
         a_1333 = true;
         a_1309 = 1 * 20;
         this.m_isStartBoom = false;
         this.m_bAutoRemove = false;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(LimeJellyBaseAttackFighter) as LimeJellyBaseAttackFighter;
      }
      
      public function get appearedTimes() : int
      {
         return this.m_appearedTimes;
      }
      
      override public function CanBeEat() : Boolean
      {
         return false;
      }
      
      public function set appearedTimes(value:int) : void
      {
         this.m_appearedTimes = value;
      }
      
      override protected function getBindMovie() : Class
      {
         return LimeJellyBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 1 * 20;
         a_1275 = 0;
         this.appearedTimes = 0;
         a_1308 = 0;
         a_1339 = 1800;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         this.cdTime = a_1321 == 0 ? 0 : a_1309;
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(iCurrentTime - this.appearedTimes >= 30 * 20)
         {
            this.m_bAutoRemove = true;
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            return false;
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
         if(this.m_bAutoRemove && a_1273 == a_1274 - 1)
         {
            this.a_3969(a_1339);
         }
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

