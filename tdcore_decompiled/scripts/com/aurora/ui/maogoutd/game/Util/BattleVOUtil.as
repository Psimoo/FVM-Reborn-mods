package com.aurora.ui.maogoutd.game.Util
{
   import flash.utils.Dictionary;
   
   public class BattleVOUtil
   {
      
      public static var m_GodCreationFinalCopyCard:int;
      
      public static const ATTACKBUFF_MUSICBOXHORSE:String = "MusicBoxHorse_";
      
      private static const ATTACK_BUFF_MAX_GROUP_PREFIXES:Array = [ATTACKBUFF_MUSICBOXHORSE];
      
      private static const OCEAN_MAP_IMMU_DEFENSE_TYPE_IDS:Array = [286523444,286523454,286458272,286458286,286458287,286458368,286458382,286458383,292552992,292553006,292553007,286462474,286462475,286462476,286462477,294846586,294846587,294846588,294846589,286402448,286402462,286402463,286402426,288949851,288949852,288949853];
      
      private static const m_oceanMapImmuDefenseDic:Dictionary = buildLookup(OCEAN_MAP_IMMU_DEFENSE_TYPE_IDS);
      
      public static const m_RotateShotCard:Array = [294850656,294850670,294850671,294846580,294846590,294846591,294846586,294846587,294846588,294846589,294847348,294847358,294847359,294846596,294846606,294846607,286393600,286393614,286393615,286401648,286401662,286401663,286402704,286402718,286402719];
      
      public static const m_SeveralStraightShotCard:Array = [286462064,286462078,286462079,286462144,286462158,286462159,286458432,286458446,286458447,286458448,286458462,286458463,286400784,286400798,286400799,286402624,286402638,286402639,286401674,286401675,286401676,286401677];
      
      private static const m_rotateShotCardDic:Dictionary = buildLookup(m_RotateShotCard);
      
      private static const m_severalStraightShotCardDic:Dictionary = buildLookup(m_SeveralStraightShotCard);
      
      public static const m_arrLavaPreferBurnToolCard:Array = [288817204,288817214,288817189,288817198,288817199,288817248,288817262,288817264,288817278,288817279,292552848,292552862,292552863];
      
      private static const m_lavaPreferBurnToolCardDic:Dictionary = buildLookup(m_arrLavaPreferBurnToolCard);
      
      public static const m_GostMouse:Array = [8388631,8388749,8388750,8392727,8389639];
      
      private static const m_gostMouseDic:Dictionary = buildLookup(m_GostMouse);
      
      public static const m_UnPopularMouse:Array = [8388649,8392745,8389221,8393220,8389320];
      
      private static const m_unPopularMouseDic:Dictionary = buildLookup(m_UnPopularMouse);
      
      public function BattleVOUtil()
      {
         super();
      }
      
      public static function IsOceanMapImmuDefense(iDefenseTypeID:int) : Boolean
      {
         return m_oceanMapImmuDefenseDic[iDefenseTypeID] === true;
      }
      
      public static function IsRotateShotCard(iDefenseTypeID:int) : Boolean
      {
         return m_rotateShotCardDic[iDefenseTypeID] === true;
      }
      
      public static function IsSeveralStraightShotCard(iDefenseTypeID:int) : Boolean
      {
         return m_severalStraightShotCardDic[iDefenseTypeID] === true;
      }
      
      public static function IsLavaPreferBurnToolCard(iDefenseTypeID:int) : Boolean
      {
         return m_lavaPreferBurnToolCardDic[iDefenseTypeID] === true;
      }
      
      public static function IsGostMouse(iMoveIntruderTypeID:int) : Boolean
      {
         return m_gostMouseDic[iMoveIntruderTypeID] === true;
      }
      
      public static function IsUnPopularMouse(iMoveIntruderTypeID:int) : Boolean
      {
         return m_unPopularMouseDic[iMoveIntruderTypeID] === true;
      }
      
      public static function buildLookup(typeIds:Array) : Dictionary
      {
         var dic:Dictionary = new Dictionary();
         for(var i:int = 0; i < typeIds.length; i++)
         {
            dic[typeIds[i]] = true;
         }
         return dic;
      }
      
      public static function GetAttackBuffMaxGroupPrefix(sourceID:String) : String
      {
         var prefix:String = null;
         for each(prefix in ATTACK_BUFF_MAX_GROUP_PREFIXES)
         {
            if(sourceID.indexOf(prefix) == 0)
            {
               return prefix;
            }
         }
         return "";
      }
   }
}

