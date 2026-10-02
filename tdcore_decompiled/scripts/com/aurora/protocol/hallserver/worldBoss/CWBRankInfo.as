package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.ui.maogoutd.role.a_4461;
   import flash.utils.ByteArray;
   
   public class CWBRankInfo implements CMessageBody
   {
      
      public var rank:int;
      
      public var uin:int;
      
      public var name:String;
      
      public var sex:int;
      
      public var nAvatarBufferSize:int;
      
      public var m_arrAvatarInfo:Array;
      
      public var exp:Number;
      
      public var platform:int;
      
      public var group:int;
      
      public var level:int;
      
      public var grade:int;
      
      public var bossID:int;
      
      public var bossHP:int;
      
      public var m_ishowcard:int;
      
      public function CWBRankInfo()
      {
         super();
         this.m_ishowcard = 0;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var heroItem:a_4461 = null;
         var list:Array = null;
         var i:int = 0;
         var tmp:String = null;
         var ids:Array = null;
         var id:int = 0;
         var param:int = 0;
         this.rank = a_2664.decode_int16(byte_array);
         this.uin = a_2664.decode_int32(byte_array);
         this.sex = a_2664.decode_int8(byte_array);
         this.m_arrAvatarInfo = [];
         var byteArr:ByteArray = new ByteArray();
         this.nAvatarBufferSize = a_2664.decode_int16(byte_array);
         a_2664.decode_memory(byte_array,byteArr,this.nAvatarBufferSize);
         byteArr.position = 0;
         var msg:String = byteArr.readMultiByte(byteArr.bytesAvailable,"utf-8");
         var tempAry:Array = msg.split(",");
         if(Boolean(tempAry) && tempAry.length > 0)
         {
            this.name = tempAry[0];
            if(tempAry.length > 1)
            {
               list = tempAry[1].split("|");
               for(i = 0; i < list.length; i++)
               {
                  tmp = list[i];
                  ids = tmp.split("-");
                  id = int(ids[0]);
                  if(ids.length > 1)
                  {
                     param = int(ids[1]);
                     if(id > 10000)
                     {
                        heroItem = new a_4461();
                        heroItem.m_iItemID = id;
                        heroItem.m_iTypeValue = param;
                        this.m_arrAvatarInfo.push(heroItem);
                     }
                     else if(id == 0)
                     {
                        this.m_ishowcard = -param;
                     }
                  }
                  else if(id > 10000)
                  {
                     heroItem = new a_4461();
                     heroItem.m_iItemID = id;
                     this.m_arrAvatarInfo.push(heroItem);
                  }
                  else
                  {
                     this.m_ishowcard = id;
                  }
               }
            }
         }
         this.exp = a_2664.decode_uint64(byte_array);
         this.platform = a_2664.decode_int8(byte_array);
         this.group = a_2664.decode_int16(byte_array);
         this.level = a_2664.decode_int8(byte_array);
         this.grade = a_2664.decode_int8(byte_array);
         this.bossID = a_2664.decode_int16(byte_array);
         this.bossHP = a_2664.decode_int32(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

