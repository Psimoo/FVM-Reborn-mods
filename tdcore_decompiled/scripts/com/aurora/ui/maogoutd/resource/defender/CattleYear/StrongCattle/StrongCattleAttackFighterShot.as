package com.aurora.ui.maogoutd.resource.defender.CattleYear.StrongCattle
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class StrongCattleAttackFighterShot extends a_4348
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var a_1595:a_4206;
      
      private var a_1596:int;
      
      public var a_1334:a_3491;
      
      private var gobackGrid:int;
      
      private var m_MouseArr:Array = new Array(8388649,8389221);
      
      public function StrongCattleAttackFighterShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 2;
         a_1574 = 0;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(StrongCattleAttackFighterShot,StrongCattleAttackFighterShotMovie) as StrongCattleAttackFighterShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(StrongCattleAttackFighterShot,StrongCattleAttackFighterShot1Movie) as StrongCattleAttackFighterShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(StrongCattleAttackFighterShot,StrongCattleAttackFighterShot2Movie) as StrongCattleAttackFighterShot;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntrude:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iIntruderIndex:int = 0;
         var numDistance:Number = NaN;
         a_1588 = true;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         for(var i:int = iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruder = stFieldGrid.a_1511;
               if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
               {
                  arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
               }
               else
               {
                  arrMoveIntruder.sortOn("x",Array.NUMERIC);
               }
               for(iIntruderIndex = 0; iIntruderIndex < stFieldGrid.a_1511.length; iIntruderIndex++)
               {
                  if((arrMoveIntruder[iIntruderIndex] as a_4206).iSpaceState == 0)
                  {
                     stMoveIntrude = arrMoveIntruder[0];
                     break;
                  }
               }
            }
            if(stMoveIntrude)
            {
               break;
            }
         }
         if(stMoveIntrude)
         {
            numDistance = Math.abs(stMoveIntrude.x - x) - 0.2 * stMoveIntrude.width;
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < 2 * a_3491.a_1080)
            {
               if(a_1581 < 4)
               {
                  a_1581 = 4;
               }
               m_numYSpeed = a_3491.a_1081 * (m_iYGridNo + 0.6) / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
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
         a_4351();
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      override public function a_4352(stMoveIntruder:a_4206) : Boolean
      {
         var ScaredX:int = 0;
         var iXGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stScareBitmap:Bitmap = null;
         this.a_1334 = stMoveIntruder.m_stCurrentFieldGrid;
         this.gobackGrid = 0;
         super.a_4352(stMoveIntruder);
         this.a_4360(this.a_1334,stMoveIntruder);
         if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance)
         {
            return false;
         }
         if(!stMoveIntruder.isFearCatHead)
         {
            return false;
         }
         if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
         {
            ScaredX = a_1580 == 0 ? 1 : 2;
            iXGridNo = this.a_1334.m_iXGridNo;
            if(a_1283)
            {
               iXGridNo = iXGridNo - Math.abs(ScaredX) < 0 ? 0 : int(iXGridNo - Math.abs(ScaredX));
            }
            else
            {
               iXGridNo = iXGridNo + Math.abs(ScaredX) >= BattleFieldView.a_1011 - 1 ? int(BattleFieldView.a_1011 - 1) : int(iXGridNo + Math.abs(ScaredX));
            }
            stTargetFieldGrid = this.a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,this.a_1334.m_iYGridNo);
            this.gobackGrid = iXGridNo - this.a_1334.m_iXGridNo;
            this.a_1334.a_3457(stMoveIntruder);
            this.a_1334.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
            arrBaseMoveIntruderVector = this.a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
            }
            stScareBitmap = ms_arrMouseScareBitmapArray.pop();
            if(null == stScareBitmap)
            {
               stScareBitmap = new Bitmap();
               stScareBitmap.bitmapData = BitMapManager.getInstance().GetMouseScareBitmapData();
            }
            stScareBitmap.visible = true;
            stScareBitmap.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x;
            stScareBitmap.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.parent.addChildAt(stScareBitmap,stMoveIntruder.parent.getChildIndex(stMoveIntruder) + 1);
            BattleFieldView.a_1021.play();
            setTimeout(this.OnMouseScareTimeout,100,this.a_1334.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTargetFieldGrid,stScareBitmap);
         }
         return true;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap) : void
      {
         stMoveIntruder.x += this.gobackGrid * a_3491.a_1080;
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         if(Boolean(stMouseScareBitmap.parent) && stMouseScareBitmap.parent.contains(stMouseScareBitmap))
         {
            stMouseScareBitmap.parent.removeChild(stMouseScareBitmap);
         }
         stMouseScareBitmap.visible = false;
         if(-1 == ms_arrMouseScareBitmapArray.indexOf(stMouseScareBitmap))
         {
            ms_arrMouseScareBitmapArray.push(stMouseScareBitmap);
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(stHitenFieldGrid == null || stHitenMouseIntruder == null)
         {
            return;
         }
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
                     {
                        stMouseIntruder.a_4209(int(a_1579 * 0.25));
                        if(a_1573 > 0)
                        {
                           stMouseIntruder.a_4208(b_182.a_432,a_1573);
                        }
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1595 = null;
         this.a_1596 = -1;
         return true;
      }
   }
}

