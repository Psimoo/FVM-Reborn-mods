package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_3977 extends a_3962
   {
      
      public function a_3977()
      {
         super();
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
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
      
      public function a_3957(iCurrentTime:int) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         this.ShowPlayOther(iCurrentTime);
      }
      
      public function ShowPlayOther(iCurrentTime:int) : void
      {
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
      
      override public function a_3940() : Boolean
      {
         if(a_1334)
         {
            a_1334.a_3498(this);
            a_1334.m_stCurrentBattbleFieldView.stCheckFieldGridsVector[a_1334.m_iYGridNo][a_1334.m_iXGridNo].a_3498(this);
         }
         super.a_3940();
         return true;
      }
   }
}

