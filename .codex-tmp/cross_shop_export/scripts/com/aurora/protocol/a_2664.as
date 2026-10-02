package com.aurora.protocol
{
   import a_4715.AurUtility;
   import com.aurora.protocol.common.CMessageBody;
   import flash.errors.EOFError;
   import flash.utils.ByteArray;
   
   public class a_2664
   {
      
      public function a_2664()
      {
         super();
      }
      
      public static function encode_int8(byte_array:ByteArray, src_value:int) : int
      {
         byte_array.writeByte(src_value);
         return 1;
      }
      
      public static function decode_int8(byte_array:ByteArray) : int
      {
         return byte_array.readByte();
      }
      
      public static function encode_uint8(byte_array:ByteArray, src_value:int) : int
      {
         byte_array.writeByte(src_value);
         return 1;
      }
      
      public static function decode_uint8(byte_array:ByteArray) : uint
      {
         return byte_array.readUnsignedByte();
      }
      
      public static function encode_int16(byte_array:ByteArray, src_value:uint) : int
      {
         byte_array.writeShort(src_value);
         return 2;
      }
      
      public static function decode_int16(byte_array:ByteArray) : int
      {
         return byte_array.readShort();
      }
      
      public static function encode_uint16(byte_array:ByteArray, src_value:uint) : int
      {
         byte_array.writeShort(src_value);
         return 2;
      }
      
      public static function decode_uint16(byte_array:ByteArray) : uint
      {
         return byte_array.readUnsignedShort();
      }
      
      public static function encode_int32(byte_array:ByteArray, src_value:int) : int
      {
         byte_array.writeInt(src_value);
         return 4;
      }
      
      public static function decode_int32(byte_array:ByteArray) : int
      {
         return byte_array.readInt();
      }
      
      public static function encode_uint32(byte_array:ByteArray, src_value:int) : int
      {
         byte_array.writeUnsignedInt(src_value);
         return 4;
      }
      
      public static function decode_uint32(byte_array:ByteArray) : uint
      {
         return byte_array.readUnsignedInt();
      }
      
      public static function encode_int64(byte_array:ByteArray, src_value:int) : int
      {
         var high:int = 0;
         var low:int = 0;
         if(src_value < 0)
         {
            high = 4294967295;
         }
         low = src_value < 0 ? int(4294967295 - Math.abs(src_value) + 1) : src_value;
         encode_int32(byte_array,high);
         encode_int32(byte_array,low);
         return 8;
      }
      
      public static function decode_int64(byte_array:ByteArray) : int
      {
         var high:int = 0;
         var low:int = 0;
         high = decode_int32(byte_array);
         return decode_int32(byte_array);
      }
      
      public static function encode_string(byte_array:ByteArray, src_str:String, max_length:int) : int
      {
         var temp_str_length:int = 0;
         if(null == src_str)
         {
            src_str = "";
         }
         else if(src_str.length >= max_length)
         {
            temp_str_length = max_length;
            src_str = src_str.substr(0,temp_str_length - 1).concat("\x00");
         }
         else
         {
            temp_str_length = src_str.length + 1;
            src_str = src_str.concat("\x00");
         }
         byte_array.writeUTF(src_str);
         return temp_str_length;
      }
      
      public static function decode_string(byte_array:ByteArray, max_length:int) : String
      {
         var dest_str:String = null;
         if(null == byte_array || 0 >= max_length)
         {
            return null;
         }
         var string_length:int = 0;
         string_length = decode_int16(byte_array);
         var tmp_length:int = 2;
         if(string_length <= 0)
         {
            dest_str = "\x00";
            return null;
         }
         var realLength:int = string_length;
         if(string_length > max_length)
         {
            realLength = max_length;
         }
         return byte_array.readUTFBytes(realLength);
      }
      
      public static function encode_memory(byte_array:ByteArray, src_bytes:ByteArray, iMemorySize:uint) : int
      {
         if(!(byte_array is ByteArray) || !(src_bytes is ByteArray) || 0 >= iMemorySize)
         {
            return -1;
         }
         var tmp_memory_length:int = int(src_bytes.length);
         if(tmp_memory_length > iMemorySize)
         {
            tmp_memory_length = int(iMemorySize);
         }
         byte_array.writeBytes(src_bytes,0,tmp_memory_length);
         return tmp_memory_length;
      }
      
      public static function decode_memory(byte_array:ByteArray, dest_bytes:ByteArray, iMemorySize:uint) : int
      {
         if(!(byte_array is ByteArray) || 0 >= iMemorySize)
         {
            return -1;
         }
         if(!(dest_bytes is ByteArray))
         {
            dest_bytes = new ByteArray();
         }
         if(iMemorySize > byte_array.bytesAvailable)
         {
            iMemorySize = byte_array.bytesAvailable;
         }
         dest_bytes.writeBytes(byte_array,byte_array.position,iMemorySize);
         byte_array.position += iMemorySize;
         return iMemorySize;
      }
      
      public static function a_2665(obj:CMessageBody, property_array:Object, byte_array:ByteArray, out_length:int) : Boolean
      {
         var item:Array = null;
         var current:uint = 0;
         var last:uint = 0;
         var body_size:uint = 0;
         var encode_length:uint = 0;
         var innerMessageBody:CMessageBody = null;
         var ReferClass:Class = null;
         var inner:* = undefined;
         var size:int = 0;
         trace("Encode " + obj);
         var preValue:* = 0;
         for each(item in property_array)
         {
            trace(item + "[" + preValue + "]");
            if(item[1] is Array)
            {
               if(null != item[1][3] && item[1][3] as int > 0)
               {
                  preValue = item[1][3] as int;
               }
               if("object" == item[1][0])
               {
                  for each(innerMessageBody in obj[item[0]])
                  {
                     if(preValue-- <= 0)
                     {
                        break;
                     }
                     if("nosize" == item[1][2])
                     {
                        innerMessageBody.encode(byte_array,body_size);
                     }
                     else
                     {
                        current = byte_array.position;
                        byte_array.writeShort(0);
                        innerMessageBody.encode(byte_array,body_size);
                        last = byte_array.position;
                        body_size = last - current - 2;
                        byte_array.position = current;
                        encode_length = uint(a_2664.encode_int16(byte_array,body_size));
                        byte_array.position = last;
                     }
                  }
                  if(preValue > 0)
                  {
                     trace("no enough CMessageBody object in object array");
                     ReferClass = AurUtility.a_1727(item[1][1]);
                     if(ReferClass == null)
                     {
                        return false;
                     }
                     innerMessageBody = new ReferClass();
                     if("nosize" == item[1][2])
                     {
                        innerMessageBody.encode(byte_array,body_size);
                     }
                     else
                     {
                        current = byte_array.position;
                        byte_array.writeShort(0);
                        innerMessageBody.encode(byte_array,body_size);
                        last = byte_array.position;
                        body_size = last - current - 2;
                        byte_array.position = current;
                        encode_length = uint(a_2664.encode_int16(byte_array,body_size));
                        byte_array.position = last;
                     }
                  }
               }
               else
               {
                  if("string" == item[1][0] || "memory" == item[1][0])
                  {
                     trace("encode array should not contain string or memory");
                     return false;
                  }
                  for each(inner in obj[item[0]])
                  {
                     if(preValue-- <= 0)
                     {
                        break;
                     }
                     a_2664["encode_" + item[1][0]](byte_array,inner);
                  }
                  while(preValue-- > 0)
                  {
                     a_2664["encode_" + item[1][0]](byte_array,0);
                  }
               }
            }
            else if("object" == item[1])
            {
               if(!(obj[item[0]] is CMessageBody))
               {
                  trace("obj[" + item[0] + "] is not subclass of CMessageBody");
                  return false;
               }
               if("nosize" == item[3])
               {
                  obj[item[0]].encode(byte_array,body_size);
               }
               else
               {
                  current = byte_array.position;
                  byte_array.writeShort(0);
                  obj[item[0]].encode(byte_array,body_size);
                  last = byte_array.position;
                  body_size = last - current - 2;
                  byte_array.position = current;
                  encode_length = uint(a_2664.encode_int16(byte_array,body_size));
                  byte_array.position = last;
               }
            }
            else if("string" == item[1])
            {
               a_2664.encode_string(byte_array,obj[item[0]],item[2]);
            }
            else if("memory" == item[1])
            {
               size = undefined !== item[3] && "nosize" == item[3] || preValue > item[2] ? int(item[2]) : int(preValue);
               a_2664.encode_memory(byte_array,obj[item[0]],size);
            }
            else
            {
               a_2664["encode_" + item[1]](byte_array,obj[item[0]]);
               preValue = int(obj[item[0]]);
            }
         }
         return true;
      }
      
      public static function a_2666(obj:CMessageBody, property_array:Object, byte_array:ByteArray, out_length:int) : Boolean
      {
         var preValue:int;
         var item:Array = null;
         var ReferClass:Class = null;
         var newObj:CMessageBody = null;
         var body_size:uint = 0;
         var startPos:int = 0;
         var tmpBody:* = undefined;
         var size:int = 0;
         trace("Decode " + obj);
         preValue = 0;
         try
         {
            for each(item in property_array)
            {
               trace(item + "[" + preValue + "]");
               if(item[1] is Array)
               {
                  if(null != item[1][3] && item[1][3] as int > 0)
                  {
                     preValue = item[1][3] as int;
                  }
                  if(obj[item[0]] == null || !(obj[item[0]] is Array))
                  {
                     obj[item[0]] = new Array();
                  }
                  if("object" == item[1][0])
                  {
                     ReferClass = AurUtility.a_1727(item[1][1]);
                     if(ReferClass == null)
                     {
                        trace("Class Not exist:" + item[1][1]);
                        return false;
                     }
                     while(preValue-- > 0)
                     {
                        newObj = new ReferClass();
                        if("nosize" == item[1][2])
                        {
                           newObj.decode(byte_array,body_size);
                        }
                        else
                        {
                           body_size = uint(a_2664.decode_int16(byte_array));
                           startPos = int(byte_array.position);
                           newObj.decode(byte_array,body_size);
                           if(byte_array.position - startPos > body_size)
                           {
                              return false;
                           }
                           byte_array.position = startPos + body_size;
                        }
                        (obj[item[0]] as Array).push(newObj);
                     }
                  }
                  else
                  {
                     if("string" == item[1][0] || "memory" == item[1][0])
                     {
                        trace("decode array should not contain string or memory");
                        return false;
                     }
                     while(preValue-- > 0)
                     {
                        tmpBody = a_2664["decode_" + item[1][0]](byte_array);
                        (obj[item[0]] as Array).push(tmpBody);
                     }
                  }
               }
               else if("object" == item[1])
               {
                  ReferClass = AurUtility.a_1727(item[2]);
                  if(ReferClass == null)
                  {
                     trace("Class Not exist:" + item[2]);
                     return false;
                  }
                  newObj = new ReferClass();
                  if("nosize" == item[3])
                  {
                     newObj.decode(byte_array,body_size);
                  }
                  else
                  {
                     body_size = uint(a_2664.decode_int16(byte_array));
                     startPos = int(byte_array.position);
                     newObj.decode(byte_array,body_size);
                     if(byte_array.position - startPos > body_size)
                     {
                        trace("Error messageBody decode too mach bytes:" + item[2]);
                        return false;
                     }
                     byte_array.position = startPos + body_size;
                  }
                  obj[item[0]] = newObj;
               }
               else if("string" == item[1])
               {
                  obj[item[0]] = a_2664.decode_string(byte_array,item[2]);
               }
               else if("memory" == item[1])
               {
                  size = undefined !== item[3] && "nosize" == item[3] || preValue > item[2] ? int(item[2]) : preValue;
                  obj[item[0]] = new ByteArray();
                  a_2664.decode_memory(byte_array,obj[item[0]],size);
               }
               else
               {
                  obj[item[0]] = a_2664["decode_" + item[1]](byte_array);
                  preValue = int(obj[item[0]]);
               }
            }
         }
         catch(error:EOFError)
         {
            trace("遇到文件尾错误:" + error);
            return false;
         }
         return true;
      }
   }
}

