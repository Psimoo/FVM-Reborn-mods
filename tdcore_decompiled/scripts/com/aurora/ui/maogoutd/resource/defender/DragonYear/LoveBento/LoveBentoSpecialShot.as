package com.aurora.ui.maogoutd.resource.defender.DragonYear.LoveBento
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class LoveBentoSpecialShot extends a_4348
   {
      
      private var stNearestMoveIntruder:a_4206 = null;
      
      private var stTempPosition:Point;
      
      public function LoveBentoSpecialShot()
      {
         super();
         a_1587 = 1;
         a_1279 = -20;
         m_iYDisplayCenterPos = -20.5;
         scaleX = scaleY = 0.9;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(LoveBentoSpecialShot) as LoveBentoSpecialShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.stNearestMoveIntruder = null;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return LoveBentoSpecialShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.stTempPosition = new Point((stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stStartFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081);
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         tagCom.AddTag(30);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         if(a_1578)
         {
            this.FollowingShotHandle();
         }
         x += m_numXSpeed;
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
         this.stNearestMoveIntruder = this.a_3431(a_1584);
         if(null != this.stNearestMoveIntruder)
         {
            numXDistance = this.stNearestMoveIntruder.x - x;
            numYDistance = 0;
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
         return true;
      }
      
      override protected function a_4351() : void
      {
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(y <= 0 || y >= BattleFieldView.a_1014)
         {
            this.a_3940();
            return;
         }
         if(null != this.stNearestMoveIntruder && hitTestObject(this.stNearestMoveIntruder))
         {
            a_4352(this.stNearestMoveIntruder);
            this.SputterHurt(this.stNearestMoveIntruder.m_stCurrentFieldGrid,this.stNearestMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(stHitenFieldGrid)
         {
            return;
         }
         var lx:int = stHitenFieldGrid.m_iXGridNo - 1;
         var rx:int = stHitenFieldGrid.m_iXGridNo + 1;
         var dy:int = stHitenFieldGrid.m_iYGridNo - 1;
         var uy:int = stHitenFieldGrid.m_iYGridNo + 1;
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
                     if(null != stMouseIntruder && stMouseIntruder != stHitenMouseIntruder && stMouseIntruder.iLifeValue > 0)
                     {
                        stMouseIntruder.a_4209(GetFinalDamage() * 0.15);
                     }
                  }
               }
            }
         }
      }
      
      public function a_3431(stFieldGrid:a_3491) : a_4206
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var j:int = 0;
         var stNormalRowIntruderArray:Array = new Array();
         var stSpecialRowIntruderArray:Array = new Array();
         var stNearestMoveIntruder:a_4206 = null;
         if(stFieldGrid)
         {
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               arrMoveIntruder = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[stFieldGrid.m_iYGridNo][j].a_1511;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.iSpaceState != 1)
                  {
                     if(BattleFieldView.m_UnPopularMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                     {
                        stSpecialRowIntruderArray.push(stMoveIntruder);
                     }
                     else
                     {
                        stNormalRowIntruderArray.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
         stNormalRowIntruderArray.sort(this.OnSortToken);
         stSpecialRowIntruderArray.sort(this.OnSortToken);
         if(stSpecialRowIntruderArray.length > 0)
         {
            return stSpecialRowIntruderArray[0];
         }
         if(stNormalRowIntruderArray.length > 0)
         {
            return stNormalRowIntruderArray[0];
         }
         return stNearestMoveIntruder;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         if(this.stTempPosition == null)
         {
            return 0;
         }
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.stTempPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.stTempPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
   }
}

