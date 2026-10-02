package com.aurora.ui.maogoutd.resource.defender.PigYear.CatStick
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CatStickShot extends a_4348
   {
      
      private var m_stLastFieldGrid:a_3491;
      
      private var hitMouseArray:Array = new Array();
      
      public function CatStickShot()
      {
         super();
         a_1587 = 0;
         a_1275 = 0;
         a_1573 = 1;
         a_1588 = true;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(CatStickShot,CatStickShotMovie) as CatStickShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(CatStickShot,CatStickShot1Movie) as CatStickShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(CatStickShot,CatStickShot2Movie) as CatStickShot;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         if(m_isSpecial == 0)
         {
            a_1279 = -105.35;
            m_iYDisplayCenterPos = -50.7;
         }
         else if(m_isSpecial == 1)
         {
            a_1279 = -104.75;
            m_iYDisplayCenterPos = -65.8;
         }
         else if(m_isSpecial == 2)
         {
            a_1279 = -118.3;
            m_iYDisplayCenterPos = -70;
         }
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.hitMouseArray = new Array();
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         this.hitMouseArray = new Array();
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
               if(m_isSpecial == 0)
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1 && 0 == stMoveIntruder.iSpaceState)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     stMoveIntruder.a_4212();
                  }
               }
               else if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
               {
                  this.hitMouseArray.push(stMoveIntruder);
                  stMoveIntruder.a_4212();
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
               if(m_isSpecial == 0)
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1 && 0 == stMoveIntruder.iSpaceState)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     stMoveIntruder.a_4212();
                  }
               }
               else if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
               {
                  this.hitMouseArray.push(stMoveIntruder);
                  stMoveIntruder.a_4212();
               }
            }
         }
      }
   }
}

