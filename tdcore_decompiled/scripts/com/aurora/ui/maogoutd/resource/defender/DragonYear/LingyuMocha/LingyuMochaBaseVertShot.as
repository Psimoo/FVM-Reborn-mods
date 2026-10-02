package com.aurora.ui.maogoutd.resource.defender.DragonYear.LingyuMocha
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   
   public class LingyuMochaBaseVertShot extends a_4348
   {
      
      protected var a_1351:Array = [];
      
      private var stlastFieldGrid:a_3491;
      
      private var hitMouseArray:Array = new Array();
      
      public function LingyuMochaBaseVertShot()
      {
         super();
         a_1587 = 0;
         a_1275 = 0;
         a_1573 = 1;
         a_1588 = true;
         m_isShotHighSkySpace = true;
         a_1279 = -65;
         m_iYDisplayCenterPos = -304 + 29;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(LingyuMochaBaseVertShot,LingyuMochaBaseVertShotMovie) as LingyuMochaBaseVertShot;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         m_isPenetrate = true;
         this.hitMouseArray = new Array();
         this.stlastFieldGrid = null;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1351 = [];
         ms_iCritFrameLable = 0;
         this.hitMouseArray = new Array();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(this.CalculationBoundary())
         {
            return;
         }
         this.a_4351();
         y += m_numXSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         var stIntruderRemoteThrowEffect:a_4425 = null;
         var Random:int = 0;
         var stTestBd:BitmapData = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         stIntruderRemoteThrowEffect = null;
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(this.stlastFieldGrid != stFieldGrid)
         {
            this.stlastFieldGrid = stFieldGrid;
            if(m_isSpecial == 3)
            {
               BattleDestroyUtil.ClearMouseHole(this.stlastFieldGrid);
            }
            else if(m_isSpecial == 2 && this.stlastFieldGrid.m_stMouseEarthHole != null)
            {
               Random = BattleFieldView.m_stRandomSeed.nextInt(10) + 1;
               if(Random <= 4)
               {
                  BattleDestroyUtil.ClearMouseHole(this.stlastFieldGrid);
               }
            }
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(stMoveIntruder.visible && hitTestObject(stMoveIntruder) && -1 == this.a_1351.indexOf(stMoveIntruder))
               {
                  if(0 == stMoveIntruder.iSpaceState)
                  {
                     stTestBd = stMoveIntruder.stDisplayBitmap.bitmapData.clone();
                  }
                  stMoveIntruder.a_4212();
                  if(!stMoveIntruder.visible && stMoveIntruder.iLifeValue <= 0 && stTestBd != null)
                  {
                     stIntruderRemoteThrowEffect = a_4425.a_3926();
                     stIntruderRemoteThrowEffect.a_1797(stTestBd,a_1283);
                     stIntruderRemoteThrowEffect.x = stMoveIntruder.x;
                     stIntruderRemoteThrowEffect.y = stMoveIntruder.y;
                     parent.addChild(stIntruderRemoteThrowEffect);
                  }
                  if(stMoveIntruder.visible)
                  {
                     this.a_1351.push(stMoveIntruder);
                  }
               }
            }
         }
         stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(stMoveIntruder.visible && hitTestObject(stMoveIntruder) && -1 == this.a_1351.indexOf(stMoveIntruder))
               {
                  if(0 == stMoveIntruder.iSpaceState)
                  {
                     stTestBd = stMoveIntruder.stDisplayBitmap.bitmapData.clone();
                  }
                  stMoveIntruder.a_4212();
                  if(!stMoveIntruder.visible && stMoveIntruder.iLifeValue <= 0 && stTestBd != null)
                  {
                     stIntruderRemoteThrowEffect = a_4425.a_3926();
                     stIntruderRemoteThrowEffect.a_1797(stTestBd,a_1283);
                     stIntruderRemoteThrowEffect.x = stMoveIntruder.x;
                     stIntruderRemoteThrowEffect.y = stMoveIntruder.y;
                     parent.addChild(stIntruderRemoteThrowEffect);
                  }
                  if(stMoveIntruder.visible)
                  {
                     this.a_1351.push(stMoveIntruder);
                  }
               }
            }
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x > BattleFieldView.a_1013 + 20)
         {
            this.a_3940();
            return true;
         }
         return false;
      }
   }
}

