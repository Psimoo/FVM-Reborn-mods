package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.GuaGuaMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   
   public class GuaGuaGameMap extends BaseGameMap
   {
      
      protected var m_iFogGridNum:int = 0;
      
      protected var m_XiangpuArr:Array = new Array();
      
      protected var m_WaterArr:Array = new Array();
      
      protected var m_stCurrentBattleFieldView:BattleFieldView;
      
      public function GuaGuaGameMap()
      {
         super();
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         var stCurrentBattleFieldView:BattleFieldView = null;
         var i:int = 0;
         var grid:a_3491 = null;
         if(Boolean(stBattleFieldObject) && stBattleFieldObject is BattleFieldView)
         {
            stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
            if(stCurrentBattleFieldView.isOwnBattleField)
            {
               this.m_stCurrentBattleFieldView = stBattleFieldObject as BattleFieldView;
               if(this.m_iFogGridNum > 0)
               {
                  a_4128.a_1413 = true;
                  stCurrentBattleFieldView.m_stLargeFogEffect.a_1797();
                  stCurrentBattleFieldView.a_3462(this.m_iFogGridNum);
               }
               i = 0;
               for(i = 0; i < this.m_WaterArr.length; i++)
               {
                  grid = this.m_stCurrentBattleFieldView.a_3438(this.m_WaterArr[i][0],this.m_WaterArr[i][1]);
                  if(grid != null)
                  {
                     grid.m_isNeedTray = true;
                  }
               }
               for(i = 0; i < this.m_XiangpuArr.length; i++)
               {
                  this.AddXiangPu(this.m_XiangpuArr[i][0],this.m_XiangpuArr[i][1],this.m_XiangpuArr[i][2]);
               }
            }
         }
         return true;
      }
      
      override public function ChangeGameMap(stData:Object) : Boolean
      {
         return true;
      }
      
      protected function AddXiangPu(iNoX:int, iNoY:int, state:int) : void
      {
         var bDay:Boolean = a_4176().m_iBattleFieldStageType == 1;
         var grid:a_3491 = this.m_stCurrentBattleFieldView.a_3438(iNoX,iNoY);
         var effect:GuaGuaXiangPuEffect = BattleEffectUtil.CreateGameEffect(GuaGuaXiangPuEffect,bDay ? GuaGuaDayXiangPuMovie : GuaGuaNightXiangPuMovie,grid) as GuaGuaXiangPuEffect;
         effect.InitData(grid,state,bDay);
      }
   }
}

