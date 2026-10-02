package a_4727
{
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class b_164
   {
      
      public static const a_542:int = 7;
      
      public static const a_543:int = 32;
      
      public static const a_544:int = -32;
      
      public static const a_545:int = 8;
      
      public static const a_546:int = 32767;
      
      public function b_164()
      {
         super();
      }
      
      public static function b_165(v:ByteArray, o:ByteArray, k:ByteArray, N:int) : void
      {
         var sum:uint = 0;
         var limit:uint = 0;
         v.endian = Endian.LITTLE_ENDIAN;
         o.endian = Endian.LITTLE_ENDIAN;
         k.endian = Endian.LITTLE_ENDIAN;
         var y:uint = v.readUnsignedInt();
         var z:uint = v.readUnsignedInt();
         var DELTA:uint = 2654435769;
         if(N > 0)
         {
            limit = DELTA * N;
            sum = 0;
            while(sum != limit)
            {
               k.position = (sum & 3) * 4;
               y += (z << 4 ^ z >>> 5) + z ^ sum + k.readInt();
               sum += DELTA;
               k.position = (sum >>> 11 & 3) * 4;
               z += (y << 4 ^ y >>> 5) + y ^ sum + k.readInt();
            }
         }
         else
         {
            sum = DELTA * -N;
            while(sum)
            {
               k.position = (sum >>> 11 & 3) * 4;
               z -= (y << 4 ^ y >>> 5) + y ^ sum + k.readInt();
               sum -= DELTA;
               k.position = (sum & 3) * 4;
               y -= (z << 4 ^ z >>> 5) + z ^ sum + k.readInt();
            }
         }
         o.writeUnsignedInt(y);
         o.writeUnsignedInt(z);
      }
      
      public static function a_1772(pbyInBuffer:ByteArray, pbyOutBuffer:ByteArray, keyByteArray:ByteArray) : uint
      {
         return a_1774(pbyInBuffer,pbyOutBuffer,keyByteArray,a_543);
      }
      
      public static function a_1773(pbyInBuffer:ByteArray, pbyOutBuffer:ByteArray, keyByteArray:ByteArray) : uint
      {
         return a_1775(pbyInBuffer,pbyOutBuffer,keyByteArray,a_544);
      }
      
      public static function a_1774(pbyInBuffer:ByteArray, pbyOutBuffer:ByteArray, keyByteArray:ByteArray, nRound:uint) : uint
      {
         var i:int = 0;
         var outValue:int = 0;
         pbyInBuffer.endian = Endian.LITTLE_ENDIAN;
         pbyOutBuffer.endian = Endian.LITTLE_ENDIAN;
         keyByteArray.endian = Endian.LITTLE_ENDIAN;
         if(pbyInBuffer == null || pbyInBuffer.length <= 0)
         {
            return 0;
         }
         pbyInBuffer.position = 0;
         if(pbyOutBuffer == null)
         {
            return 0;
         }
         pbyOutBuffer.position = 0;
         keyByteArray.position = 0;
         var nPadDataZero:uint = 1 + pbyInBuffer.length + a_542;
         var nPadLength:uint = nPadDataZero % a_545;
         if(nPadLength != 0)
         {
            nPadLength = a_545 - nPadLength;
         }
         var nTotalLength:uint = nPadDataZero + nPadLength;
         var pbyInCursor:uint = 0;
         var pbyOutCurosr:uint = 0;
         var arrbyFirst8Bytes:ByteArray = new ByteArray();
         arrbyFirst8Bytes.length = a_545;
         arrbyFirst8Bytes.writeByte(uint(Math.random() * a_546) & 0xF8 | nPadLength);
         for(i = 1; i <= nPadLength; i++)
         {
            arrbyFirst8Bytes.writeByte(uint(Math.random() * a_546));
         }
         if(a_545 - (1 + nPadLength) > 0)
         {
            arrbyFirst8Bytes.writeBytes(pbyInBuffer,0,a_545 - (1 + nPadLength));
         }
         pbyInBuffer.position = a_545 - (1 + nPadLength);
         pbyInCursor += a_545 - (1 + nPadLength);
         arrbyFirst8Bytes.position = 0;
         pbyOutBuffer.position = 0;
         b_165(arrbyFirst8Bytes,pbyOutBuffer,keyByteArray,nRound);
         pbyOutCurosr += a_545;
         var pbyLast8BytesPlainData:ByteArray = arrbyFirst8Bytes;
         pbyLast8BytesPlainData.position = 0;
         var arrbySrcBuffer:ByteArray = new ByteArray();
         while(pbyInBuffer.bytesAvailable > 1)
         {
            pbyInBuffer.position = pbyInCursor;
            pbyOutBuffer.position = pbyOutCurosr - a_545;
            arrbySrcBuffer.position = 0;
            for(i = 0; i < a_545; i++)
            {
               arrbySrcBuffer.writeByte(pbyInBuffer.readByte() ^ pbyOutBuffer.readByte());
            }
            arrbySrcBuffer.position = 0;
            pbyOutBuffer.position = pbyOutCurosr;
            b_165(arrbySrcBuffer,pbyOutBuffer,keyByteArray,nRound);
            pbyOutBuffer.position = pbyOutCurosr;
            pbyInBuffer.position = pbyInCursor - a_545;
            for(i = 0; i < a_545; i++)
            {
               outValue = pbyOutBuffer.readByte() ^ pbyLast8BytesPlainData.readByte();
               --pbyOutBuffer.position;
               pbyOutBuffer.writeByte(outValue);
            }
            pbyLast8BytesPlainData = pbyInBuffer;
            pbyOutCurosr += a_545;
            pbyInCursor += a_545;
            pbyInBuffer.position = pbyInCursor;
         }
         pbyInBuffer.position = pbyInCursor;
         var arrbyLast8Bytes:ByteArray = new ByteArray();
         arrbyLast8Bytes.writeByte(pbyInBuffer.readByte());
         arrbyLast8Bytes.length = a_545;
         pbyInBuffer.length += 7;
         pbyInBuffer.position = pbyInCursor;
         pbyOutBuffer.position = pbyOutCurosr - a_545;
         arrbyLast8Bytes.position = 0;
         for(i = 0; i < a_545; i++)
         {
            arrbyLast8Bytes.writeByte(pbyInBuffer.readByte() ^ pbyOutBuffer.readByte());
         }
         arrbyLast8Bytes.position = 0;
         pbyOutBuffer.position = pbyOutCurosr;
         b_165(arrbyLast8Bytes,pbyOutBuffer,keyByteArray,nRound);
         pbyOutBuffer.position = pbyOutCurosr;
         pbyInBuffer.position = pbyInCursor - a_545;
         for(i = 0; i < a_545; i++)
         {
            outValue = pbyOutBuffer.readByte() ^ pbyLast8BytesPlainData.readByte();
            --pbyOutBuffer.position;
            pbyOutBuffer.writeByte(outValue);
         }
         pbyInBuffer.length -= 7;
         pbyInBuffer.endian = Endian.BIG_ENDIAN;
         pbyOutBuffer.endian = Endian.BIG_ENDIAN;
         keyByteArray.endian = Endian.BIG_ENDIAN;
         return nTotalLength;
      }
      
      public static function a_1775(pbyInBuffer:ByteArray, pbyOutBuffer:ByteArray, keyByteArray:ByteArray, nRound:uint) : uint
      {
         var i:int = 0;
         var outValue:int = 0;
         pbyInBuffer.endian = Endian.LITTLE_ENDIAN;
         pbyOutBuffer.endian = Endian.LITTLE_ENDIAN;
         keyByteArray.endian = Endian.LITTLE_ENDIAN;
         if(pbyInBuffer == null || pbyInBuffer.length <= 0)
         {
            return 0;
         }
         pbyInBuffer.position = 0;
         if(pbyInBuffer.length <= 8 || Boolean(pbyInBuffer.length % a_545))
         {
            return 0;
         }
         var pbyInCursor:uint = 0;
         var pbyOutCursor:uint = 0;
         var arrbyFirst8Bytes:ByteArray = new ByteArray();
         b_165(pbyInBuffer,arrbyFirst8Bytes,keyByteArray,nRound);
         pbyInCursor += a_545;
         arrbyFirst8Bytes.position = 0;
         var nPadLength:int = arrbyFirst8Bytes.readByte() & 7;
         var nPlainDataLength:uint = pbyInBuffer.length - 1 - nPadLength - a_542;
         if(nPlainDataLength <= 0 || pbyOutBuffer == null)
         {
            return 0;
         }
         pbyOutBuffer.position = 0;
         arrbyFirst8Bytes.position = 1 + nPadLength;
         for(i = 0; i < a_545 - 1 - nPadLength; i++)
         {
            pbyOutBuffer.writeByte(arrbyFirst8Bytes.readByte());
         }
         pbyOutCursor += a_545 - 1 - nPadLength;
         var pbyLast8BytesPlainData:ByteArray = arrbyFirst8Bytes;
         pbyLast8BytesPlainData.position = 0;
         var arrbySrcBuffer:ByteArray = new ByteArray();
         while(pbyInCursor < pbyInBuffer.length - 8)
         {
            pbyOutBuffer.position = pbyOutCursor - a_545;
            pbyInBuffer.position = pbyInCursor;
            arrbySrcBuffer.position = 0;
            for(i = 0; i < a_545; i++)
            {
               arrbySrcBuffer.writeByte(pbyInBuffer.readByte() ^ pbyLast8BytesPlainData.readByte());
            }
            arrbySrcBuffer.position = 0;
            pbyOutBuffer.position = pbyOutCursor;
            b_165(arrbySrcBuffer,pbyOutBuffer,keyByteArray,nRound);
            pbyInBuffer.position = pbyInCursor - a_545;
            pbyOutBuffer.position = pbyOutCursor;
            for(i = 0; i < a_545; i++)
            {
               outValue = pbyOutBuffer.readByte() ^ pbyInBuffer.readByte();
               --pbyOutBuffer.position;
               pbyOutBuffer.writeByte(outValue);
            }
            pbyLast8BytesPlainData = pbyOutBuffer;
            pbyInCursor += a_545;
            pbyOutCursor += a_545;
         }
         var arrbyLast8Bytes:ByteArray = new ByteArray();
         pbyOutBuffer.position = pbyOutCursor - a_545;
         pbyInBuffer.position = pbyInCursor;
         arrbySrcBuffer.position = 0;
         for(i = 0; i < a_545; i++)
         {
            arrbySrcBuffer.writeByte(pbyInBuffer.readByte() ^ pbyLast8BytesPlainData.readByte());
         }
         arrbySrcBuffer.position = 0;
         arrbyLast8Bytes.position = 0;
         b_165(arrbySrcBuffer,arrbyLast8Bytes,keyByteArray,nRound);
         pbyInBuffer.position = pbyInCursor - a_545;
         arrbyLast8Bytes.position = 0;
         for(i = 0; i < a_545; i++)
         {
            outValue = arrbyLast8Bytes.readByte() ^ pbyInBuffer.readByte();
            --arrbyLast8Bytes.position;
            arrbyLast8Bytes.writeByte(outValue);
         }
         arrbyLast8Bytes.position = 1;
         while(arrbyLast8Bytes.bytesAvailable > 0)
         {
            if(arrbyLast8Bytes.readByte() != 0)
            {
               return 0;
            }
         }
         pbyOutBuffer.position = pbyOutCursor;
         arrbyLast8Bytes.position = 0;
         pbyOutBuffer.writeByte(arrbyLast8Bytes.readByte());
         pbyInBuffer.endian = Endian.BIG_ENDIAN;
         pbyOutBuffer.endian = Endian.BIG_ENDIAN;
         keyByteArray.endian = Endian.BIG_ENDIAN;
         return nPlainDataLength;
      }
      
      public static function a_1776(nInBufferLength:uint) : uint
      {
         return nInBufferLength + 16;
      }
      
      public static function a_1777(nInBufferLength:uint) : uint
      {
         return nInBufferLength;
      }
   }
}

