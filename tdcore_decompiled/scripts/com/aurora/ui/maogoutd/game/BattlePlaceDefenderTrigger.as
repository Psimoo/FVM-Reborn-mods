package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class BattlePlaceDefenderTrigger
   {
      
      public function BattlePlaceDefenderTrigger()
      {
         super();
      }
      
      internal static function GoldLightBaderBoomTrigger(gride:a_3491, iDefenseTypeID:int) : void
      {
         var maxCount:int = 0;
         var nearestDefenses:Array = null;
         var def:a_3962 = null;
         if(iDefenseTypeID == 286400570 || iDefenseTypeID == 286400571 || iDefenseTypeID == 286400572 || iDefenseTypeID == 286400573)
         {
            maxCount = GetGlobalTriggerLimit(gride.m_stCurrentBattbleFieldView);
            if(maxCount > 0)
            {
               nearestDefenses = GetNearestDefensesByTypeID(gride,gride.m_iXGridNo,gride.m_iYGridNo,maxCount);
               for each(def in nearestDefenses)
               {
                  def.SpecialSkillCallBack(1);
               }
            }
         }
      }
      
      private static function GetNearestDefensesByTypeID(gride:a_3491, targetX:int, targetY:int, maxCount:int) : Array
      {
         var x:int = 0;
         var stFieldGrid:a_3491 = null;
         var defense:a_3962 = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var distSquared:Number = NaN;
         var battlefield:BattleFieldView = gride.m_stCurrentBattbleFieldView;
         var candidates:Array = [];
         for(var y:int = 0; y < BattleFieldView.a_1012; y++)
         {
            for(x = 0; x < BattleFieldView.a_1011; x++)
            {
               stFieldGrid = battlefield.a_3438(x,y);
               if(stFieldGrid)
               {
                  defense = stFieldGrid.m_stAttackFighter;
                  if(Boolean(defense) && isGoldLightBaderTower(defense.a_3512()))
                  {
                     dx = defense.stFieldGrid.m_iXGridNo - targetX;
                     dy = defense.stFieldGrid.m_iYGridNo - targetY;
                     distSquared = dx * dx + dy * dy;
                     candidates.push({
                        "def":defense,
                        "dist":distSquared
                     });
                  }
               }
            }
         }
         candidates.sortOn("dist",Array.NUMERIC);
         var result:Array = [];
         var len:int = Math.min(maxCount,candidates.length);
         for(var i:int = 0; i < len; i++)
         {
            result.push(candidates[i].def);
         }
         return result;
      }
      
      private static function isGoldLightBaderTower(id:uint) : Boolean
      {
         return id == 286401899 || id == 286401900 || id == 286401901;
      }
      
      private static function GetGlobalTriggerLimit(battlefield:BattleFieldView) : int
      {
         if(battlefield.a_3422(286401901) > 0)
         {
            return 7;
         }
         if(battlefield.a_3422(286401900) > 0)
         {
            return 7;
         }
         if(battlefield.a_3422(286401899) > 0)
         {
            return 5;
         }
         return 0;
      }
   }
}

