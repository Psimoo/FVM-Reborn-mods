package com.aurora.ui.maogoutd.resource.defender.PigYear.thunderExplosionPig
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class ThunderExplosionPigBaseDefence extends a_3953
   {
      
      private var m_iCurrentTime:int = 0;
      
      public function ThunderExplosionPigBaseDefence()
      {
         super();
         a_1337 = 0;
         a_1312 = 15;
         a_1313 = true;
         a_1095 = ThunderExplosionPigDefence.DEFENSE_PRICE;
         a_1311 = ThunderExplosionPigDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ThunderExplosionPigBaseDefence) as ThunderExplosionPigBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThunderExplosionPigBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 10;
         super.a_1797(stFieldGrid);
         this.m_iCurrentTime = 0;
         this.visible = true;
         this.alpha = 1;
         a_1339 = 60;
         a_1311 = ThunderExplosionPigDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ThunderExplosionPigDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iCurrentTime = 0;
         this.visible = true;
         this.alpha = 1;
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -80;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:ThunderExplosionPigBaseShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var tempX:int = 0;
         var tempY:int = 0;
         var tempX1:int = 0;
         var tempY1:int = 0;
         if(a_1273 == a_1274 - 1)
         {
            this.visible = false;
            this.alpha = 0;
         }
         if(this.m_iCurrentTime == 0)
         {
            this.m_iCurrentTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iCurrentTime == 34)
         {
            stLastWaitShot = ThunderExplosionPigBaseShot.a_4344() as ThunderExplosionPigBaseShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
            tempX = stStartField.m_iXGridNo * a_3491.a_1080;
            tempY = stStartField.m_iYGridNo * a_3491.a_1081 - 139;
            stLastWaitShot.a_1797(0,a_1312,a_1311,tempX,tempY,a_1334.m_stCurrentBattbleFieldView,stStartField);
            stLastWaitShot.m_BOOMRate = 2000 / 900;
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         if(iCurrentTime - this.m_iCurrentTime == 50)
         {
            stLastWaitShot = ThunderExplosionPigBaseShot.a_4344() as ThunderExplosionPigBaseShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
            tempX1 = stStartField.m_iXGridNo * a_3491.a_1080;
            tempY1 = stStartField.m_iYGridNo * a_3491.a_1081 - 139;
            stLastWaitShot.a_1797(0,a_1312,a_1311,tempX1,tempY1,a_1334.m_stCurrentBattbleFieldView,stStartField);
            stLastWaitShot.m_BOOMRate = 2000 / 900;
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3969(a_1339);
         }
         return true;
      }
   }
}

