package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class FountainShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var m_arrPosOne:Array = [[-1,-1],[-1,1],[1,1],[1,-1]];
      
      private var m_arrPosTwo:Array = [[-1,0],[0,1],[1,0],[0,-1]];
      
      public function FountainShot()
      {
         super();
         a_1279 = -22;
         m_iYDisplayCenterPos = -56;
         a_1574 = 0;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : FountainShot
      {
         var stShot:FountainShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new FountainShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return FountainShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1588 = true;
         a_1275 = m_isSpecial;
         gotoAndStop((a_1276[m_isSpecial] as FrameLabel).frame);
         a_1573 = 1;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(a_1588 && iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1273 == 6 || a_1273 == 13 || a_1273 == 20 || a_1273 == 27)
            {
               if(m_isSpecial == 0 || m_isSpecial == 2)
               {
                  this.a_4360(a_1584,this.m_arrPosOne);
               }
               else if(m_isSpecial == 1 || m_isSpecial == 3)
               {
                  this.a_4360(a_1584,this.m_arrPosTwo);
               }
            }
            else if(a_1273 == a_1274 || a_1278 != null)
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
      
      private function a_4360(stFieldGrid:a_3491, m_arrPos:Array) : void
      {
         var iLen:int = 0;
         var i:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         if(stFieldGrid)
         {
            iLen = int(m_arrPos.length);
            for(i = 0; i < iLen; i++)
            {
               iXGridNo = stFieldGrid.m_iXGridNo + m_arrPos[i][1];
               iYGridNo = stFieldGrid.m_iYGridNo + m_arrPos[i][0];
               stCurFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
               if(null != stCurFieldGrid)
               {
                  this.a_3502(stCurFieldGrid);
               }
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stAttackFighter.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stOceanGoddessToolDefense && !stFieldGrid.m_stOceanGoddessToolDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stHoneyTrapBaseDefense && !stFieldGrid.m_stHoneyTrapBaseDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(a_1579);
         }
         else if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.a_3969(a_1579);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
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

