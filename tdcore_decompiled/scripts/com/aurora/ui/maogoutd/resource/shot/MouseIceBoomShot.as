package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.DefenseIceFreezeUpEffect;
   import flash.display.FrameLabel;
   
   public class MouseIceBoomShot extends a_4348
   {
      
      private var a_1598:a_3491;
      
      public function MouseIceBoomShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.enm_MouseIceBoomShot;
         a_1573 = 1;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MouseIceBoomShot) as MouseIceBoomShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseIceBoomShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iTargetPos:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var isExistDefenseAhead:Boolean = false;
         for(var i:int = 0; i <= iXGridNo; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
            {
               isExistDefenseAhead = true;
               this.a_1598 = stFieldGrid;
               break;
            }
         }
         if(!isExistDefenseAhead)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 3,m_iYGridNo);
            isExistDefenseAhead = true;
            this.a_1598 = stFieldGrid;
         }
         if(isExistDefenseAhead)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5));
            numDistance = Math.abs(iTargetPos - x);
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < a_3491.a_1080)
            {
               if(a_1581 < 2)
               {
                  a_1581 = 2;
               }
               m_numYSpeed = 0.5 * numDistance / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            nextFrame();
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
         this.a_4373();
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 + 1 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var indexY:int = 0;
         var indexX:int = 0;
         var stDefenseIceFreezeUpEffect:DefenseIceFreezeUpEffect = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == this.a_1598)
         {
            BattleFieldView.a_1048.play();
            this.a_1598.m_stCurrentBattbleFieldView.a_3466();
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            stFieldGridVector = this.a_1598.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = this.a_1598.m_iYGridNo - 1 < 0 ? 0 : int(this.a_1598.m_iYGridNo - 1);
            xStart = this.a_1598.m_iXGridNo - 1 < 0 ? 0 : int(this.a_1598.m_iXGridNo - 1);
            yEnd = this.a_1598.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.a_1598.m_iYGridNo + 1);
            xEnd = this.a_1598.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.a_1598.m_iXGridNo + 1);
            for(indexY = yStart; indexY <= yEnd; indexY++)
            {
               for(indexX = xStart; indexX <= xEnd; indexX++)
               {
                  stFieldGrid = stFieldGridVector[indexY][indexX];
                  if(stFieldGrid.m_stAttackFighter)
                  {
                     stFieldGrid.m_stAttackFighter.a_3958(200);
                     stDefenseIceFreezeUpEffect = DefenseIceFreezeUpEffect.a_3926();
                     stDefenseIceFreezeUpEffect.a_1797(false);
                     stDefenseIceFreezeUpEffect.x = stFieldGrid.m_stAttackFighter.x + 0.5 * (stFieldGrid.m_stAttackFighter.width - stDefenseIceFreezeUpEffect.width) + stFieldGrid.m_stAttackFighter.stDisplayBitmap.x;
                     stDefenseIceFreezeUpEffect.y = stFieldGrid.m_stAttackFighter.y + (stFieldGrid.m_stAttackFighter.height - stDefenseIceFreezeUpEffect.height) + stFieldGrid.m_stAttackFighter.stDisplayBitmap.y;
                     stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDefenseIceFreezeUpEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
                     if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
                     {
                        stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stDefenseIceFreezeUpEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
                     }
                  }
               }
            }
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         stBaseDefense.m_iDieType = 1;
         stBaseDefense.a_3969(a_1579);
         stBaseDefense.m_iDieType = 0;
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

