package com.aurora.ui.maogoutd.resource.gamemap
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.SkyAirShipFansEffect;
   
   public class DaySkyAirshipTempleGameMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_arrSkyAirShipFansEffect:Array = [];
      
      private var m_arrFieldGridExistFans:Array = [];
      
      public function DaySkyAirshipTempleGameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 1;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var iIndex1:int = 0;
         var stSkyAirShipFansEffect:SkyAirShipFansEffect = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               for(iIndex1 = 0; iIndex1 < 5; iIndex1++)
               {
                  stSkyAirShipFansEffect = SkyAirShipFansEffect.a_3926();
                  stSkyAirShipFansEffect.a_1797(false);
                  stSkyAirShipFansEffect.x = a_3491.a_1080 * (8 - 2 * (iIndex1 % 2)) + 0.5 * (a_3491.a_1080 - stSkyAirShipFansEffect.width);
                  stSkyAirShipFansEffect.y = a_3491.a_1081 * (1.5 + iIndex1) - 0.5 * stSkyAirShipFansEffect.height;
                  stCurrentBattleFieldView.addChildAt(stSkyAirShipFansEffect,1);
                  this.m_arrSkyAirShipFansEffect[iIndex1] = stSkyAirShipFansEffect;
               }
               this.m_arrFieldGridExistFans.push(this.m_stCurrentBattleFieldView.a_3438(8,1));
               this.m_arrFieldGridExistFans.push(this.m_stCurrentBattleFieldView.a_3438(6,2));
               this.m_arrFieldGridExistFans.push(this.m_stCurrentBattleFieldView.a_3438(8,3));
               this.m_arrFieldGridExistFans.push(this.m_stCurrentBattleFieldView.a_3438(6,4));
               this.m_arrFieldGridExistFans.push(this.m_stCurrentBattleFieldView.a_3438(8,5));
               stCurrentBattleFieldView.stFieldGridsVector[1][8].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[3][8].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[4][6].m_iFieldGridType = 3;
               stCurrentBattleFieldView.stFieldGridsVector[5][8].m_iFieldGridType = 3;
            }
         }
         this.m_iChangeCount = 1;
         this.m_stRandomSeed.setSeed(100,500);
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         var stSkyAirShipFansEffect:SkyAirShipFansEffect = null;
         if(stData is Array && stData[0] == 2)
         {
            for each(stSkyAirShipFansEffect in this.m_arrSkyAirShipFansEffect.slice())
            {
               stSkyAirShipFansEffect.a_3940();
            }
            this.m_arrSkyAirShipFansEffect = [];
            this.m_arrFieldGridExistFans = [];
         }
         return true;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stSkyAirShipFansEffect:SkyAirShipFansEffect = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTempFieldGrid:a_3491 = null;
         this.m_iCurrentTimeIntval = iTimeNum;
         for each(stSkyAirShipFansEffect in this.m_arrSkyAirShipFansEffect)
         {
            stSkyAirShipFansEffect.a_4003(iTimeNum);
         }
         if(iTimeNum % 160 == 0)
         {
            arrBaseMoveIntruderVector = this.m_stCurrentBattleFieldView.m_arrBaseMoveIntruderVector;
            for each(stTempFieldGrid in this.m_arrFieldGridExistFans)
            {
               for each(stMoveIntruder in stTempFieldGrid.a_1511.slice())
               {
                  if(stMoveIntruder.iLifeValue <= 1800 && stMoveIntruder.iSpaceState == 0)
                  {
                     stTempFieldGrid.a_3457(stMoveIntruder);
                     stTempFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                     if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                     {
                        arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                     }
                     this.m_stCurrentBattleFieldView.a_3459(stMoveIntruder,this.m_stCurrentBattleFieldView.a_3438(stTempFieldGrid.m_iXGridNo - 3,stTempFieldGrid.m_iYGridNo),false);
                     stMoveIntruder.x = a_3491.a_1080 * (stTempFieldGrid.m_iXGridNo - 2.5);
                  }
               }
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

