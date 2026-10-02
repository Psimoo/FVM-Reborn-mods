package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.NationalDay
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import com.aurora.ui.maogoutd.resource.wave.a_4454;
   
   public class TwelveAnniversaryFourthMap extends BaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      public function TwelveAnniversaryFourthMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var j:int = 0;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][5].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][2].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][2].m_iFieldGridType = 4;
               this.m_stCurrentBattleFieldView.stFieldGridsVector[3][3].m_iFieldGridType = 4;
               for(i = 0; i < BattleFieldView.a_1011; i++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[0][i].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[4][i].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[6][i].m_isNeedTray = true;
               }
               for(j = 0; j < BattleFieldView.a_1012; j++)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[j][0].m_isNeedTray = true;
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[j][8].m_isNeedTray = true;
               }
            }
         }
         return true;
      }
      
      override public function a_4175() : a_4450
      {
         return a_4454.a_3926();
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stBaseShot:a_4348 = null;
         var arrFireXRang:Array = null;
         if(iTimeNum % 2 == 0)
         {
            arrFireXRang = this.GetFireHurtXRangByRow(0);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[0].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(1);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[1].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(2);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[2].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(3);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[3].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(4);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[4].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(5);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[5].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
            arrFireXRang = this.GetFireHurtXRangByRow(6);
            for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[6].slice())
            {
               if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.x > a_3491.a_1080 * 0 && stBaseShot.x < a_3491.a_1080 * 9 && this.IsShotInXRang(stBaseShot.x,arrFireXRang))
               {
                  stBaseShot.a_4350();
               }
            }
         }
      }
      
      protected function IsShotInXRang(numXShotPos:Number, arrXRang:Array) : Boolean
      {
         var arrXTempRang:Array = null;
         for each(arrXTempRang in arrXRang)
         {
            if(numXShotPos > arrXTempRang[0] && numXShotPos < arrXTempRang[1])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function GetFireHurtXRangByRow(iYIndexNum:int) : Array
      {
         var arrXFireRange:Array = [];
         if(1 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[1][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
         }
         else if(2 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][5]))
            {
               arrXFireRange.push([a_3491.a_1080 * 5,a_3491.a_1080 * 6]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][6]))
            {
               arrXFireRange.push([a_3491.a_1080 * 6,a_3491.a_1080 * 7]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][2]))
            {
               arrXFireRange.push([a_3491.a_1080 * 2,a_3491.a_1080 * 3]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[2][3]))
            {
               arrXFireRange.push([a_3491.a_1080 * 3,a_3491.a_1080 * 4]);
            }
         }
         else if(3 == iYIndexNum)
         {
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][2]))
            {
               arrXFireRange.push([a_3491.a_1080 * 2,a_3491.a_1080 * 3]);
            }
            if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[3][3]))
            {
               arrXFireRange.push([a_3491.a_1080 * 3,a_3491.a_1080 * 4]);
            }
         }
         return arrXFireRange;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.a_3492())
         {
            return true;
         }
         return false;
      }
   }
}

