package com.aurora.ui.maogoutd.resource.defender.PigYear.windPoweredAirdropPig
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WindPoweredAirdropPigFirstShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      public var a_1607:a_4206;
      
      public function WindPoweredAirdropPigFirstShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1574 = 100;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : WindPoweredAirdropPigFirstShot
      {
         var stShot:WindPoweredAirdropPigFirstShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new WindPoweredAirdropPigFirstShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindPoweredAirdropPigFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= 0;
         a_1275 = 0;
         a_1587 = 1;
         a_1574 = 100;
         gotoAndStop(1);
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1573 = 1;
         return true;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y + 0.5 * stMoveIntruder.height - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               this.a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         y += m_numYSpeed;
         return true;
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(x <= 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         stMoveIntruder = a_1583.a_3431();
         if(null == stMoveIntruder)
         {
            iXGridNo = Math.random() * BattleFieldView.a_1011;
            iYGridNo = Math.random() * BattleFieldView.a_1012;
            this.x = (iXGridNo + 0.5) * a_3491.a_1080;
            this.y = (iYGridNo + 0.5) * a_3491.a_1081 - 128;
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
         }
         else if(null != stMoveIntruder && hitTestObject(stMoveIntruder))
         {
            m_isHited = true;
            this.a_4360(stMoveIntruder);
         }
      }
      
      private function a_4360(stMoveIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var stHitenFieldGrid:a_3491 = stMoveIntruder.m_stCurrentFieldGrid;
         this.x = stMoveIntruder.x;
         this.y = stMoveIntruder.y - 128;
         trace("123");
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
         var lx:int = stHitenFieldGrid.m_iXGridNo;
         var rx:int = stHitenFieldGrid.m_iXGridNo;
         var dy:int = stHitenFieldGrid.m_iYGridNo;
         var uy:int = stHitenFieldGrid.m_iYGridNo;
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(null != stMouseIntruder && false == stMouseIntruder.isCannotSeeByFighter)
                     {
                        if(ms_iCritFrameLable > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_435,20);
                        }
                        if(a_1573 > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_432,a_1573);
                        }
                        if(a_1574 > 0)
                        {
                           if(stMouseIntruder.iArmorLifeValue <= 0 || a_1576)
                           {
                              stMouseIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
                           }
                        }
                        if(a_1325 > 1)
                        {
                           stMouseIntruder.a_4208(b_182.a_433,0);
                        }
                        stMouseIntruder.a_4210();
                     }
                  }
               }
            }
         }
         BattleFieldView.ms_tianshen83.play();
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1607 = null;
         ms_iCritFrameLable = 0;
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

