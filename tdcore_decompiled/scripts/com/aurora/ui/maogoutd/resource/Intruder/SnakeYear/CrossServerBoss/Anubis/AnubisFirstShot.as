package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerBoss.Anubis
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AnubisFirstShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var a_1607:a_4206;
      
      public function AnubisFirstShot()
      {
         super();
         a_1279 = -width * 0.5 + 30;
         m_iYDisplayCenterPos = -545;
      }
      
      public static function a_4344() : AnubisFirstShot
      {
         var stShot:AnubisFirstShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new AnubisFirstShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AnubisFirstShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isHited = true;
         if(a_1584.a_3492())
         {
            a_1275 = a_1587 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else
         {
            a_1275 = a_1587 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(iCurrentTime % 2 == 0)
            {
               nextFrame();
               if(a_1273 == (a_1276[a_1275] as FrameLabel).frame + 4)
               {
                  this.a_3502(a_1584);
               }
               else if(a_1273 == a_1274 || a_1278 != null)
               {
                  m_bActive.Value = false;
                  this.a_3940();
               }
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
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

