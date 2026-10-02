package com.aurora.ui.maogoutd.resource.defender.RabbitYear.GluttonousRabbit
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GluttonousRabbitSecondShot extends a_4348
   {
      
      private static var ms_arrSagittariusShotVector:Array = new Array();
      
      private var m_stLastFieldGrid:a_3491;
      
      private var hitMouseArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8388631,8388749,8388750,8392727);
      
      public function GluttonousRabbitSecondShot()
      {
         super();
         a_1587 = 0;
         a_1275 = 0;
         a_1573 = 1;
         a_1588 = true;
         a_1576 = true;
         a_1279 = -46 - 15;
         m_iYDisplayCenterPos = -70 - 25;
      }
      
      public static function a_4344() : a_4348
      {
         var stGluttonousRabbitSecondShot:GluttonousRabbitSecondShot = ms_arrSagittariusShotVector.pop();
         if(null == stGluttonousRabbitSecondShot)
         {
            stGluttonousRabbitSecondShot = new GluttonousRabbitSecondShot();
         }
         BattleFieldView.a_1017.play();
         return stGluttonousRabbitSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GluttonousRabbitSecondShotMovie;
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
         this.hitMouseArray = new Array();
         if(-1 == ms_arrSagittariusShotVector.indexOf(this))
         {
            ms_arrSagittariusShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
         y += m_numXSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(y < 0 - 20 || y > BattleFieldView.a_1014)
         {
            this.a_3940();
            return;
         }
         if(stFieldGrid == null)
         {
            return;
         }
         arrMoveIntruder = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.iLifeValue > 0) && this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
            {
               if(!stMoveIntruder.isCannotSeeByFighter && hitTestObject(stMoveIntruder))
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     stMoveIntruder.a_4212();
                  }
               }
            }
            else if(stMoveIntruder.visible && hitTestObject(stMoveIntruder))
            {
               if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
               {
                  this.hitMouseArray.push(stMoveIntruder);
                  stMoveIntruder.a_4212();
               }
            }
         }
      }
   }
}

