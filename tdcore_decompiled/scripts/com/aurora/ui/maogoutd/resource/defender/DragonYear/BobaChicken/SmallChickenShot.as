package com.aurora.ui.maogoutd.resource.defender.DragonYear.BobaChicken
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   
   public class SmallChickenShot extends a_4348
   {
      
      private static var ms_arrSagittariusShotVector:Array = new Array();
      
      private var m_stLastFieldGrid:a_3491;
      
      private var hitMouseArray:Array = new Array();
      
      public function SmallChickenShot()
      {
         super();
         a_1279 = -60;
         m_iYDisplayCenterPos = -47;
         a_1587 = 0;
         a_1275 = 0;
         a_1573 = 1;
         a_1588 = true;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stSmallChickenShot:SmallChickenShot = ms_arrSagittariusShotVector.pop();
         if(null == stSmallChickenShot)
         {
            stSmallChickenShot = new SmallChickenShot();
         }
         BattleFieldView.a_1017.play();
         return stSmallChickenShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallChickenShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.hitMouseArray = new Array();
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         this.hitMouseArray = new Array();
         if(-1 == ms_arrSagittariusShotVector.indexOf(this))
         {
            ms_arrSagittariusShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
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
         this.a_4351();
         if(x < 0 || x > BattleFieldView.a_1013 + 20)
         {
            this.a_3940();
            return;
         }
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         arrMoveIntruder = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(stMoveIntruder.visible && hitTestObject(stMoveIntruder))
            {
               if(BobaChickenDefence.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1 && BobaChickenDefence.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1)
               {
                  if(m_isSpecial == 0)
                  {
                     if(stMoveIntruder.iSpaceState != 3 && stMoveIntruder.iSpaceState != 1)
                     {
                        this.DropMouse(stMoveIntruder);
                     }
                  }
                  else
                  {
                     this.DropMouse(stMoveIntruder);
                  }
               }
            }
         }
         stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         arrMoveIntruder = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(stMoveIntruder.visible && hitTestObject(stMoveIntruder))
            {
               if(BobaChickenDefence.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1 && BobaChickenDefence.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) == -1)
               {
                  if(m_isSpecial == 0)
                  {
                     if(stMoveIntruder.iSpaceState != 3 && stMoveIntruder.iSpaceState != 1)
                     {
                        this.DropMouse(stMoveIntruder);
                     }
                  }
                  else
                  {
                     this.DropMouse(stMoveIntruder);
                  }
               }
            }
         }
      }
      
      private function DropMouse(stMoveIntruder:a_4206) : void
      {
         var stIntruderRemoteThrowEffect:a_4425 = null;
         var stTestBd:BitmapData = null;
         if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
         {
            this.hitMouseArray.push(stMoveIntruder);
            if(0 == stMoveIntruder.iSpaceState)
            {
               stTestBd = stMoveIntruder.stDisplayBitmap.bitmapData.clone();
            }
            stMoveIntruder.PowerfulBombReduceLifeRate(-0.5);
            stMoveIntruder.a_4212();
            if(!stMoveIntruder.visible && stMoveIntruder.iLifeValue <= 0 && stTestBd != null)
            {
               stIntruderRemoteThrowEffect = a_4425.a_3926();
               stIntruderRemoteThrowEffect.a_1797(stTestBd,a_1283);
               stIntruderRemoteThrowEffect.x = stMoveIntruder.x;
               stIntruderRemoteThrowEffect.y = stMoveIntruder.y;
               parent.addChild(stIntruderRemoteThrowEffect);
            }
         }
      }
   }
}

