package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class a_3975 extends a_3962
   {
      
      private var m_EnergyRateEx:EncrypNumber;
      
      public function a_3975()
      {
         super();
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.EnergyRate = 1;
         return super.a_1797(stFieldGrid);
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
      
      public function a_3957(iCurrentTime:int) : void
      {
         this.nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
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
         buffCom.UpdateBuff(2);
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
      }
      
      override public function a_3940() : Boolean
      {
         if(a_1334)
         {
            a_1334.a_3496(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].a_3496(this);
         }
         super.a_3940();
         this.EnergyRate = 1;
         return true;
      }
      
      public function get EnergyRate() : Number
      {
         if(!this.m_EnergyRateEx)
         {
            this.m_EnergyRateEx = new EncrypNumber(1);
         }
         return this.m_EnergyRateEx.Value;
      }
      
      public function set EnergyRate(value:Number) : void
      {
         if(!this.m_EnergyRateEx)
         {
            this.m_EnergyRateEx = new EncrypNumber(1);
         }
         this.m_EnergyRateEx.Value = value;
      }
   }
}

