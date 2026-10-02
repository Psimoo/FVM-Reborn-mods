package com.aurora.ui.maogoutd.game
{
   import flash.display.Sprite;
   
   public class MoveIntruderWaveNumberIndicatorView extends Sprite
   {
      
      public var m_stIntruderProgress:Sprite;
      
      public var m_stMouseHead:WaveIndicatorMouseHead;
      
      public var m_stMouseWaveNumberView:a_3561;
      
      private var a_1116:Array = [];
      
      private var a_1117:Array = [];
      
      public var m_iWaveNum:int;
      
      private var a_1118:int;
      
      private var a_1119:int;
      
      public function MoveIntruderWaveNumberIndicatorView()
      {
         super();
         this.m_stMouseWaveNumberView = new a_3561();
         this.m_stMouseWaveNumberView.a_1797(0);
         this.m_stMouseWaveNumberView.x = 25 + 0.5 * (36 - this.m_stMouseWaveNumberView.width);
         this.m_stMouseWaveNumberView.y = -18;
         addChild(this.m_stMouseWaveNumberView);
      }
      
      public function a_3563(nTotalWaveNum:int) : void
      {
         var stIndicatorRedFlag:WaveIndicatorRedFlag = null;
         var i:int = 0;
         this.a_1118 = int(124 / nTotalWaveNum);
         for each(stIndicatorRedFlag in this.a_1116)
         {
            if(contains(stIndicatorRedFlag))
            {
               removeChild(stIndicatorRedFlag);
            }
            this.a_1117.push(stIndicatorRedFlag);
         }
         this.a_1116 = [];
         for(i = 1; i < nTotalWaveNum; i++)
         {
            stIndicatorRedFlag = this.a_1117.pop();
            if(null == stIndicatorRedFlag)
            {
               stIndicatorRedFlag = new WaveIndicatorRedFlag();
            }
            this.a_1116.push(stIndicatorRedFlag);
            stIndicatorRedFlag.x = 82 + this.a_1118 * i;
            stIndicatorRedFlag.y = -17;
            addChild(stIndicatorRedFlag);
         }
         this.a_1119 = nTotalWaveNum;
         this.m_iWaveNum = 0;
         this.m_stMouseWaveNumberView.a_1797(this.m_iWaveNum);
         this.m_stMouseWaveNumberView.x = 25 + 0.5 * (36 - this.m_stMouseWaveNumberView.width);
         this.m_stIntruderProgress.width = 0;
         this.m_stMouseHead.x = 213;
         this.m_stIntruderProgress.x = this.m_stMouseHead.x;
         addChild(this.m_stMouseHead);
      }
      
      public function a_3564(iWaveProgress:int) : void
      {
         this.m_stMouseHead.x = 213 - this.a_1118 * (this.m_iWaveNum % this.a_1119 + iWaveProgress / 100);
         this.m_stIntruderProgress.width = this.a_1118 * (this.m_iWaveNum % this.a_1119 + iWaveProgress / 100);
         this.m_stIntruderProgress.x = this.m_stMouseHead.x;
         if(iWaveProgress == 100)
         {
            ++this.m_iWaveNum;
            this.m_stMouseWaveNumberView.a_1797(this.m_iWaveNum);
            this.m_stMouseWaveNumberView.x = 25 + 0.5 * (36 - this.m_stMouseWaveNumberView.width);
         }
      }
   }
}

