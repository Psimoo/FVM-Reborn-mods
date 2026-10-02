package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class a_3960 extends a_3962
   {
      
      protected var a_1328:int = 2;
      
      private var m_iLastFrameTimeNumEx:EncrypIntEx;
      
      private var m_iPlacedBoomDelayTimeNumEx:EncrypIntEx;
      
      private var m_isCanBeEatenEx:EncrypBooleanEx;
      
      private var m_iBoomTypeEx:EncrypIntEx;
      
      private var m_isOnlyOnLandEx:EncrypBooleanEx;
      
      public function a_3960()
      {
         super();
      }
      
      protected function get a_1329() : int
      {
         if(!this.m_iLastFrameTimeNumEx)
         {
            this.m_iLastFrameTimeNumEx = new EncrypIntEx();
         }
         return this.m_iLastFrameTimeNumEx.Value;
      }
      
      protected function set a_1329(value:int) : void
      {
         if(!this.m_iLastFrameTimeNumEx)
         {
            this.m_iLastFrameTimeNumEx = new EncrypIntEx();
         }
         this.m_iLastFrameTimeNumEx.Value = value;
      }
      
      protected function get a_1330() : int
      {
         if(!this.m_iPlacedBoomDelayTimeNumEx)
         {
            this.m_iPlacedBoomDelayTimeNumEx = new EncrypIntEx(20);
         }
         return this.m_iPlacedBoomDelayTimeNumEx.Value;
      }
      
      protected function set a_1330(value:int) : void
      {
         if(!this.m_iPlacedBoomDelayTimeNumEx)
         {
            this.m_iPlacedBoomDelayTimeNumEx = new EncrypIntEx(20);
         }
         this.m_iPlacedBoomDelayTimeNumEx.Value = value;
      }
      
      protected function get a_1331() : Boolean
      {
         if(!this.m_isCanBeEatenEx)
         {
            this.m_isCanBeEatenEx = new EncrypBooleanEx(true);
         }
         return this.m_isCanBeEatenEx.Value;
      }
      
      protected function set a_1331(value:Boolean) : void
      {
         if(!this.m_isCanBeEatenEx)
         {
            this.m_isCanBeEatenEx = new EncrypBooleanEx(true);
         }
         this.m_isCanBeEatenEx.Value = value;
      }
      
      protected function get m_iBoomType() : int
      {
         if(!this.m_iBoomTypeEx)
         {
            this.m_iBoomTypeEx = new EncrypIntEx(0);
         }
         return this.m_iBoomTypeEx.Value;
      }
      
      protected function set m_iBoomType(value:int) : void
      {
         if(!this.m_iBoomTypeEx)
         {
            this.m_iBoomTypeEx = new EncrypIntEx(0);
         }
         this.m_iBoomTypeEx.Value = value;
      }
      
      protected function get a_1332() : Boolean
      {
         if(!this.m_isOnlyOnLandEx)
         {
            this.m_isOnlyOnLandEx = new EncrypBooleanEx();
         }
         return this.m_isOnlyOnLandEx.Value;
      }
      
      protected function set a_1332(value:Boolean) : void
      {
         if(!this.m_isOnlyOnLandEx)
         {
            this.m_isOnlyOnLandEx = new EncrypBooleanEx();
         }
         this.m_isOnlyOnLandEx.Value = value;
      }
      
      public function get iBoomType() : int
      {
         return this.m_iBoomType;
      }
      
      public function get isOnlyOnLand() : Boolean
      {
         return this.a_1332;
      }
      
      public function get isCanBeEaten() : Boolean
      {
         return this.a_1331;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1329 = 0;
         return super.a_1797(stFieldGrid);
      }
      
      public function a_3961(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + this.a_1330 && iCurrentTime >= this.a_1329 + this.a_1328)
         {
            this.a_1329 = iCurrentTime;
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0)
         {
            this.a_3940();
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         if(a_1334)
         {
            a_1334.a_3499(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].a_3499(this);
         }
         super.a_3940();
         gotoAndStop(1);
         return true;
      }
   }
}

