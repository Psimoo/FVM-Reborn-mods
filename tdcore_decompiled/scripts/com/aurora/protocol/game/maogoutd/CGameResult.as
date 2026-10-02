package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CGameResult implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_byTeamID:int;
      
      public var m_byRolePosition:int;
      
      public var m_byIsConstraBattle:int;
      
      public var m_iCurrentWave:int;
      
      public var m_nGradeScore:int;
      
      public var m_nGrade:int;
      
      public var m_nDestroyOppBuildingCount:int;
      
      public var m_nDestroyByEnemyBuildingCount:int;
      
      public var m_iPickUpCoinCount:int;
      
      public var m_iExpericeCount:int;
      
      public var m_iAwardCoinCount:int;
      
      public var m_iHonourCount:int;
      
      public var m_iVSExpericeCount:int;
      
      public var m_iConstraScore:int;
      
      public var m_iPrestigeCount:int;
      
      public var m_nUseCardCount:int;
      
      public var m_arrUseCardInfos:Array;
      
      public var m_nKilledMiceInfoCount:int;
      
      public var m_arrKilledMiceInfos:Array;
      
      public var m_nServiceCount:int;
      
      public var m_arriServerID:Array;
      
      public var m_nPickUpItemCount:int;
      
      public var m_arrPickUpItemInfos:Array;
      
      private var m_stUseCard:CUseCard;
      
      private var a_852:CKilledMouseInfo;
      
      private var a_853:CPickUpItem;
      
      public var m_szPlayeRoleName:String;
      
      public var m_iLevelNum:int;
      
      public function CGameResult()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_byTeamID","int8"],["m_byRolePosition","int8"],["m_byIsConstraBattle","int8"],["m_iCurrentWave","int32"],["m_nGradeScore","int16"],["m_nGrade","int16"],["m_nDestroyOppBuildingCount","int16"],["m_nDestroyByEnemyBuildingCount","int16"],["m_iPickUpCoinCount","int32"],["m_iExpericeCount","int32"],["m_iAwardCoinCount","int32"],["m_iHonourCount","int32"],["m_iVSExpericeCount","int32"],["m_iConstraScore","int32"],["m_iPrestigeCount","int32"],["m_nUseCardCount","int16"],["m_arrUseCardInfos",["object","com.aurora.protocol.game.maogoutd.CUseCard"]],["m_nKilledMiceInfoCount","int16"],["m_arrKilledMiceInfos",["object","com.aurora.protocol.game.maogoutd.CKilledMouseInfo"]],["m_nServiceCount","int16"],["m_arriServerID",["int32"]],["m_nPickUpItemCount","int16"],["m_arrPickUpItemInfos",["object","com.aurora.protocol.game.maogoutd.CPickUpItem","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_byTeamID","int8"],["m_byRolePosition","int8"],["m_byIsConstraBattle","int8"],["m_iCurrentWave","int32"],["m_nGradeScore","int16"],["m_nGrade","int16"],["m_nDestroyOppBuildingCount","int16"],["m_nDestroyByEnemyBuildingCount","int16"],["m_iPickUpCoinCount","int32"],["m_iExpericeCount","int32"],["m_iAwardCoinCount","int32"],["m_iHonourCount","int32"],["m_iVSExpericeCount","int32"],["m_iConstraScore","int32"],["m_iPrestigeCount","int32"],["m_nUseCardCount","int16"],["m_arrUseCardInfos",["object","com.aurora.protocol.game.maogoutd.CUseCard"]],["m_nKilledMiceInfoCount","int16"],["m_arrKilledMiceInfos",["object","com.aurora.protocol.game.maogoutd.CKilledMouseInfo"]],["m_nServiceCount","int16"],["m_arriServerID",["int32"]],["m_nPickUpItemCount","int16"],["m_arrPickUpItemInfos",["object","com.aurora.protocol.game.maogoutd.CPickUpItem","nosize"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

