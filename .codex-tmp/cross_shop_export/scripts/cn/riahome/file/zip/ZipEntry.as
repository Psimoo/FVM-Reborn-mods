package cn.riahome.file.zip
{
   import flash.utils.ByteArray;
   
   public class ZipEntry
   {
      
      internal var name:String;
      
      internal var extra:ByteArray;
      
      internal var comment:String;
      
      internal var crc32:uint;
      
      internal var compressedSize:uint;
      
      internal var size:uint;
      
      internal var method:int;
      
      internal var versionMadeBy:int;
      
      internal var version:int;
      
      internal var flag:int;
      
      internal var dostime:uint;
      
      internal var nameLength:int;
      
      internal var extraLength:int;
      
      internal var commentLength:int;
      
      internal var diskNumberStart:int;
      
      internal var intFileAttributes:int;
      
      internal var extFileAttributes:uint;
      
      internal var offsetLOC:uint;
      
      internal var offsetCEN:uint;
      
      public function ZipEntry(name:String)
      {
         super();
         this.name = name;
         this.extra = new ByteArray();
         this.comment = "技术支持：Y.Boy | http://www.riahome.cn";
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function getExtra() : ByteArray
      {
         return this.extra;
      }
      
      public function getComment() : String
      {
         return this.comment;
      }
      
      public function getTime() : Number
      {
         var year:Number = (this.dostime >> 25 & 0x7F) + 1980;
         var month:Number = (this.dostime >> 21 & 0x0F) - 1;
         var date:Number = this.dostime >> 16 & 0x1F;
         var hour:Number = this.dostime >> 11 & 0x1F;
         var minute:Number = this.dostime >> 5 & 0x3F;
         var second:Number = this.dostime << 1 & 0x3E;
         var d:Date = new Date(year,month,date,hour,minute,second);
         return d.time;
      }
      
      public function getCRC32() : uint
      {
         return this.crc32;
      }
      
      public function getCompressedSize() : uint
      {
         return this.compressedSize;
      }
      
      public function getSize() : uint
      {
         return this.size;
      }
      
      public function getMethod() : int
      {
         return this.method;
      }
      
      public function isDirectory() : Boolean
      {
         return this.name.charAt(this.name.length - 1) == "/";
      }
      
      public function toString() : String
      {
         return this.name;
      }
   }
}

