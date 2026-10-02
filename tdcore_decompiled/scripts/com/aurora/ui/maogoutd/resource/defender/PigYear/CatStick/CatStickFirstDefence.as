package com.aurora.ui.maogoutd.resource.defender.PigYear.CatStick
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class CatStickFirstDefence extends a_3953
   {
      
      private var a_1368:int;
      
      public function CatStickFirstDefence()
      {
         a_1271 = true;
         super();
         a_1095 = CatStickDefence.DEFENSE_PRICE;
      }
      
      public static function a_3926() : CatStickFirstDefence
      {
         return PoolManager.getInstance().CheckOutOne(CatStickFirstDefence) as CatStickFirstDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return CatStickFirstDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.a_1368 = 0;
         this.visible = true;
         gotoAndStop(1);
         a_1095 = CatStickDefence.DEFENSE_PRICE;
         a_1339 = 30;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            this.a_4003(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return CatStickDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1368 = 0;
         return true;
      }
      
      private function a_4003(iCurrentTime:int) : void
      {
         var stStartField:a_3491 = null;
         nextFrame();
         trace("m_iCurrentFrame::>>>" + a_1273);
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.a_1368;
         if(this.a_1368 > 25)
         {
            stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
            this.addShot(stStartField);
            m_iDieType = 5;
            this.a_3969(a_1339);
            m_iDieType = 0;
         }
      }
      
      private function addShot(stStartField:a_3491) : Boolean
      {
         var stLastWaitShot:CatStickShot = null;
         if(!stStartField)
         {
            return false;
         }
         stLastWaitShot = CatStickShot.GetFreeShot1() as CatStickShot;
         if(null == stLastWaitShot)
         {
            return false;
         }
         var tempX2:int = stStartField.m_iXGridNo * a_3491.a_1080;
         var tempY2:int = stStartField.m_iYGridNo * a_3491.a_1081 + 50;
         stLastWaitShot.m_isSpecial = 1;
         stLastWaitShot.a_1797(0,a_1312,a_1311,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
   }
}

