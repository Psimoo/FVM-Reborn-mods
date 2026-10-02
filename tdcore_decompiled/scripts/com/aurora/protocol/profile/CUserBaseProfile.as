package com.aurora.protocol.profile
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CUserBaseProfile implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_szAccount:String;
      
      public var m_nUserType:int;
      
      public var m_isActivate:int;
      
      public var m_szRealName:String;
      
      public var m_szNickName:String;
      
      public var m_szUserSignature:String;
      
      public var m_sex:int;
      
      public var m_szCardID:String;
      
      public var m_szBirthday:String;
      
      public var m_isLunarbirthday:int;
      
      public var m_szConstellation:String;
      
      public var m_szRegdataTime:String;
      
      public var m_szRegIP:String;
      
      public var m_iFaceVersion:int;
      
      public var m_shFaceID:int;
      
      public var m_szSmallFaceURL:String;
      
      public var m_szMiddleFaceURL:String;
      
      public var m_szLargeFaceURL:String;
      
      public var m_szHomeProv:String;
      
      public var m_szHomeCity:String;
      
      public var m_szHomeTown:String;
      
      public var m_szLiveProv:String;
      
      public var m_szLiveCity:String;
      
      public var m_szLiveTown:String;
      
      public var m_szPhoneNum:String;
      
      public var m_szQQ:String;
      
      public var m_szMSN:String;
      
      public var m_szEmail:String;
      
      public var m_szContactAdr:String;
      
      public var m_szZipCode:String;
      
      public var m_isInboxVoice:int;
      
      public function CUserBaseProfile()
      {
         super();
         this.m_iUin = -1;
         trace("CUserBaseProfile");
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_szAccount","string",32],["m_nUserType","int16"],["m_isActivate","int8"],["m_szRealName","string",64],["m_szNickName","string",64],["m_szUserSignature","string",128],["m_sex","int8"],["m_szCardID","string",19],["m_szBirthday","string",11],["m_isLunarbirthday","int8"],["m_szConstellation","string",10],["m_szRegdataTime","string",30],["m_szRegIP","string",20],["m_iFaceVersion","int32"],["m_shFaceID","int16"],["m_szSmallFaceURL","string",256],["m_szMiddleFaceURL","string",256],["m_szLargeFaceURL","string",256],["m_szHomeProv","string",50],["m_szHomeCity","string",50],["m_szHomeTown","string",50],["m_szLiveProv","string",50],["m_szLiveCity","string",50],["m_szLiveTown","string",50],["m_szPhoneNum","string",20],["m_szQQ","string",20],["m_szMSN","string",50],["m_szEmail","string",100],["m_szContactAdr","string",100],["m_szZipCode","string",20],["m_isInboxVoice","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_szAccount = a_2664.decode_string(byte_array,32);
         this.m_nUserType = a_2664.decode_int16(byte_array);
         this.m_isActivate = a_2664.decode_int8(byte_array);
         this.m_szRealName = a_2664.decode_string(byte_array,64);
         this.m_szNickName = a_2664.decode_string(byte_array,64);
         this.m_szUserSignature = a_2664.decode_string(byte_array,128);
         this.m_sex = a_2664.decode_int8(byte_array);
         this.m_szCardID = a_2664.decode_string(byte_array,19);
         this.m_szBirthday = a_2664.decode_string(byte_array,11);
         this.m_isLunarbirthday = a_2664.decode_int8(byte_array);
         this.m_szConstellation = a_2664.decode_string(byte_array,10);
         this.m_szRegdataTime = a_2664.decode_string(byte_array,30);
         this.m_szRegIP = a_2664.decode_string(byte_array,20);
         this.m_iFaceVersion = a_2664.decode_int32(byte_array);
         this.m_shFaceID = a_2664.decode_int16(byte_array);
         this.m_szSmallFaceURL = a_2664.decode_string(byte_array,256);
         this.m_szMiddleFaceURL = a_2664.decode_string(byte_array,256);
         this.m_szLargeFaceURL = a_2664.decode_string(byte_array,256);
         this.m_szHomeProv = a_2664.decode_string(byte_array,50);
         this.m_szHomeCity = a_2664.decode_string(byte_array,50);
         this.m_szHomeTown = a_2664.decode_string(byte_array,50);
         this.m_szLiveProv = a_2664.decode_string(byte_array,50);
         this.m_szLiveCity = a_2664.decode_string(byte_array,50);
         this.m_szLiveTown = a_2664.decode_string(byte_array,50);
         this.m_szPhoneNum = a_2664.decode_string(byte_array,20);
         this.m_szQQ = a_2664.decode_string(byte_array,20);
         this.m_szMSN = a_2664.decode_string(byte_array,50);
         this.m_szEmail = a_2664.decode_string(byte_array,100);
         this.m_szContactAdr = a_2664.decode_string(byte_array,100);
         this.m_szZipCode = a_2664.decode_string(byte_array,20);
         this.m_isInboxVoice = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

