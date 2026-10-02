package cn.riahome.file.zip
{
   import cn.riahome.file.CRC32;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class ZipFile
   {
      
      private var _data:ByteArray;
      
      private var _entries:Array;
      
      private var _comment:String = "技术支持：Y.Boy\n---------------------\nhttp://www.riahome.cn";
      
      public function ZipFile(data:ByteArray = null)
      {
         var commentBytes:ByteArray = null;
         super();
         this._data = new ByteArray();
         this._data.endian = Endian.LITTLE_ENDIAN;
         if(data)
         {
            this._data.writeBytes(data);
            this.parse();
         }
         else
         {
            this._entries = [];
            commentBytes = new ByteArray();
            commentBytes.writeMultiByte(this._comment,"gb2312");
            this._data.writeUnsignedInt(ZipFormat.ENDSIG);
            this._data.writeShort(0);
            this._data.writeShort(0);
            this._data.writeShort(0);
            this._data.writeShort(0);
            this._data.writeUnsignedInt(0);
            this._data.writeUnsignedInt(0);
            this._data.writeShort(commentBytes.length);
            this._data.writeBytes(commentBytes);
         }
      }
      
      public function get data() : ByteArray
      {
         return this._data;
      }
      
      public function set data(value:ByteArray) : void
      {
         value.endian = Endian.LITTLE_ENDIAN;
         this._data.clear();
         this._data.writeBytes(value);
         value.clear();
         this.parse();
      }
      
      public function get entries() : Array
      {
         return this._entries;
      }
      
      public function get comment() : String
      {
         return this._comment;
      }
      
      public function set comment(value:String) : void
      {
         var commentBytes:ByteArray = new ByteArray();
         commentBytes.endian = Endian.LITTLE_ENDIAN;
         commentBytes.writeMultiByte(value,"gb2312");
         var endSig:uint = this.getPositionENDSIG();
         this._data.position = endSig + ZipFormat.ENDCOM;
         this._data.writeShort(commentBytes.length);
         this._data.length = this._data.position + commentBytes.length;
         this._data.writeBytes(commentBytes);
         commentBytes.clear();
      }
      
      public function get numEntries() : int
      {
         return this._entries.length;
      }
      
      public function get size() : uint
      {
         return this._data.length;
      }
      
      public function getEntry(name:String) : ZipEntry
      {
         var e:ZipEntry = null;
         for each(e in this._entries)
         {
            if(name == e.name)
            {
               return e;
            }
         }
         return null;
      }
      
      public function getEntryData(entry:ZipEntry) : ByteArray
      {
         var bytes:ByteArray = new ByteArray();
         if(Boolean(entry) && entry.compressedSize > 0)
         {
            this._data.position = entry.offsetLOC + ZipFormat.LOCHDR + entry.nameLength + entry.extraLength;
            this._data.readBytes(bytes,0,entry.compressedSize);
            switch(entry.method)
            {
               case ZipFormat.DEFLATED:
                  bytes.inflate();
                  break;
               case ZipFormat.STORED:
                  break;
               default:
                  throw new ZipError(ZipError.COMPRESSION_METHOD_INVALID);
            }
         }
         return bytes;
      }
      
      public function addEntry(entry:ZipEntry, entryData:ByteArray = null) : void
      {
         var ze:ZipEntry = null;
         var crc32:CRC32 = null;
         var e:ZipEntry = null;
         if(!entry.name)
         {
            throw new ZipError(ZipError.FILE_NAME_IS_NULL);
         }
         if(this.getEntry(entry.name))
         {
            throw new ZipError(ZipError.FILE_EXISTED);
         }
         if(!entryData)
         {
            entryData = new ByteArray();
         }
         var newData:ByteArray = new ByteArray();
         var bytesLOC:ByteArray = new ByteArray();
         var bytesCEN:ByteArray = new ByteArray();
         var nameBytes:ByteArray = new ByteArray();
         var commentBytes:ByteArray = new ByteArray();
         var oldEndSig:uint = this.getPositionENDSIG();
         var isDirectory:Boolean = entry.name.charAt(entry.name.length - 1) == "/";
         newData.endian = Endian.LITTLE_ENDIAN;
         bytesLOC.endian = Endian.LITTLE_ENDIAN;
         bytesCEN.endian = Endian.LITTLE_ENDIAN;
         nameBytes.endian = Endian.LITTLE_ENDIAN;
         commentBytes.endian = Endian.LITTLE_ENDIAN;
         entryData.endian = Endian.LITTLE_ENDIAN;
         nameBytes.writeMultiByte(entry.name,"gb2312");
         commentBytes.writeMultiByte(entry.comment,"gb2312");
         entry.versionMadeBy = 20;
         entry.flag = 0;
         entry.dostime = this.getDosTime(new Date().time);
         if(isDirectory)
         {
            entry.version = 10;
            entry.method = 0;
            entry.extFileAttributes = 16;
            entry.compressedSize = 0;
            entry.size = 0;
            entry.crc32 = 0;
         }
         else
         {
            crc32 = new CRC32();
            crc32.update(entryData);
            entry.crc32 = crc32.getValue();
            entry.size = entryData.length;
            entryData.deflate();
            entry.compressedSize = entryData.length;
            entry.version = 20;
            entry.method = 8;
            entry.extFileAttributes = 32;
         }
         entry.nameLength = nameBytes.length;
         entry.extraLength = entry.extra.length;
         entry.commentLength = commentBytes.length;
         entry.diskNumberStart = 0;
         entry.intFileAttributes = 0;
         if(this._entries.length)
         {
            entry.offsetLOC = (this._entries[0] as ZipEntry).offsetCEN;
            for each(e in this._entries)
            {
               if(e.offsetCEN < entry.offsetLOC)
               {
                  entry.offsetLOC = e.offsetCEN;
               }
            }
         }
         else
         {
            entry.offsetLOC = 0;
         }
         entry.offsetCEN = oldEndSig;
         this._entries.push(entry);
         bytesLOC.position = 0;
         bytesLOC.writeUnsignedInt(ZipFormat.LOCSIG);
         bytesLOC.writeShort(entry.version);
         bytesLOC.writeShort(entry.flag);
         bytesLOC.writeShort(entry.method);
         bytesLOC.writeUnsignedInt(entry.dostime);
         bytesLOC.writeUnsignedInt(entry.crc32);
         bytesLOC.writeUnsignedInt(entry.compressedSize);
         bytesLOC.writeUnsignedInt(entry.size);
         bytesLOC.writeShort(entry.nameLength);
         bytesLOC.writeShort(entry.extraLength);
         bytesLOC.writeBytes(nameBytes);
         bytesLOC.writeBytes(entry.extra);
         bytesLOC.writeBytes(entryData);
         bytesCEN.position = 0;
         bytesCEN.writeUnsignedInt(ZipFormat.CENSIG);
         bytesCEN.writeShort(entry.versionMadeBy);
         bytesCEN.writeShort(entry.version);
         bytesCEN.writeShort(entry.flag);
         bytesCEN.writeShort(entry.method);
         bytesCEN.writeUnsignedInt(entry.dostime);
         bytesCEN.writeUnsignedInt(entry.crc32);
         bytesCEN.writeUnsignedInt(entry.compressedSize);
         bytesCEN.writeUnsignedInt(entry.size);
         bytesCEN.writeShort(entry.nameLength);
         bytesCEN.writeShort(entry.extraLength);
         bytesCEN.writeShort(entry.commentLength);
         bytesCEN.writeShort(entry.diskNumberStart);
         bytesCEN.writeShort(entry.intFileAttributes);
         bytesCEN.writeUnsignedInt(entry.extFileAttributes);
         bytesCEN.writeUnsignedInt(entry.offsetLOC);
         bytesCEN.writeBytes(nameBytes);
         bytesCEN.writeBytes(entry.extra);
         bytesCEN.writeBytes(commentBytes);
         for each(ze in this._entries)
         {
            ze.offsetCEN += bytesLOC.length;
         }
         newData.position = 0;
         if(entry.offsetLOC)
         {
            newData.writeBytes(this._data,0,entry.offsetLOC);
         }
         newData.writeBytes(bytesLOC);
         if(entry.offsetLOC)
         {
            newData.writeBytes(this._data,entry.offsetLOC,oldEndSig - entry.offsetLOC);
         }
         newData.writeBytes(bytesCEN);
         newData.writeBytes(this._data,oldEndSig,this._data.length - oldEndSig);
         this._data.clear();
         this._data.writeBytes(newData);
         this.updateValueOfENDOFF();
         this.updateValueOfENDSIZ(bytesCEN.length);
         this.updateValueOfENDSUB();
         this.updateValueOfENDTOT();
         newData.clear();
         bytesLOC.clear();
         bytesCEN.clear();
         nameBytes.clear();
         commentBytes.clear();
      }
      
      public function removeEntry(entry:ZipEntry) : ByteArray
      {
         var ze:ZipEntry = null;
         var newData:ByteArray = null;
         var e:ZipEntry = null;
         var removedData:ByteArray = this.getEntryData(entry);
         for(var i:int = 0; i < this._entries.length; i++)
         {
            e = this._entries[i] as ZipEntry;
            if(entry.name == e.name)
            {
               this._entries.splice(i,1);
               break;
            }
         }
         var locLength:uint = entry.compressedSize + ZipFormat.LOCHDR + entry.nameLength + entry.extraLength;
         var cenLength:uint = ZipFormat.CENHDR + entry.nameLength + entry.extraLength + entry.commentLength;
         for each(ze in this._entries)
         {
            if(ze.offsetLOC > entry.offsetLOC)
            {
               ze.offsetLOC -= locLength;
               this.updateValueOfCENDOFF(ze,ze.offsetLOC);
            }
            ze.offsetCEN -= locLength;
            if(ze.offsetCEN > entry.offsetCEN)
            {
               ze.offsetCEN -= cenLength;
            }
         }
         newData = new ByteArray();
         newData.endian = Endian.LITTLE_ENDIAN;
         newData.position = 0;
         if(entry.offsetLOC)
         {
            newData.writeBytes(this._data,0,entry.offsetLOC);
         }
         newData.writeBytes(this._data,entry.offsetLOC + locLength,entry.offsetCEN - entry.offsetLOC - locLength);
         newData.writeBytes(this._data,entry.offsetCEN + cenLength,this._data.length - entry.offsetCEN - cenLength);
         this._data.clear();
         this._data.writeBytes(newData);
         newData.clear();
         this.updateValueOfENDOFF();
         this.updateValueOfENDSIZ(-cenLength);
         this.updateValueOfENDSUB();
         this.updateValueOfENDTOT();
         this.parse();
         return removedData;
      }
      
      public function setEntryName(entry:ZipEntry, name:String) : void
      {
         var e:ZipEntry = null;
         var divideLOC:uint = 0;
         var divideCEN:uint = 0;
         var newData:ByteArray = null;
         var ze:ZipEntry = null;
         var nameBytes:ByteArray = new ByteArray();
         nameBytes.endian = Endian.LITTLE_ENDIAN;
         nameBytes.writeMultiByte(name,"gb2312");
         var lengthOffset:uint = nameBytes.length - entry.nameLength;
         this._data.position = entry.offsetLOC + ZipFormat.LOCNAM;
         this._data.writeShort(nameBytes.length);
         this._data.position = entry.offsetCEN + ZipFormat.CENNAM;
         this._data.writeShort(nameBytes.length);
         for each(e in this._entries)
         {
            if(e.offsetLOC > entry.offsetLOC)
            {
               this._data.position = e.offsetCEN + ZipFormat.CENOFF;
               this._data.writeUnsignedInt(e.offsetLOC + lengthOffset);
            }
         }
         divideLOC = entry.offsetLOC + ZipFormat.LOCHDR;
         divideCEN = entry.offsetCEN + ZipFormat.CENHDR;
         newData = new ByteArray();
         newData.endian = Endian.LITTLE_ENDIAN;
         newData.writeBytes(this._data,0,divideLOC);
         newData.writeBytes(nameBytes);
         newData.writeBytes(this._data,divideLOC + entry.nameLength,divideCEN - divideLOC - entry.nameLength);
         newData.writeBytes(nameBytes);
         newData.writeBytes(this._data,divideCEN + entry.nameLength,this._data.length - divideCEN - entry.nameLength);
         this._data.clear();
         this._data.writeBytes(newData);
         entry.name = name;
         entry.nameLength = nameBytes.length;
         for each(ze in this._entries)
         {
            if(ze.offsetLOC > entry.offsetLOC)
            {
               ze.offsetLOC += lengthOffset;
            }
            ze.offsetCEN += lengthOffset;
            if(ze.offsetCEN > entry.offsetCEN)
            {
               ze.offsetCEN += lengthOffset;
            }
         }
         this.updateValueOfENDSIZ(lengthOffset);
         this.updateValueOfENDOFF();
         newData.clear();
         nameBytes.clear();
      }
      
      public function setEntryExtra(entry:ZipEntry, extra:ByteArray) : void
      {
         var e:ZipEntry = null;
         var divideLOC:uint = 0;
         var divideCEN:uint = 0;
         var newData:ByteArray = null;
         var ze:ZipEntry = null;
         extra.endian = Endian.LITTLE_ENDIAN;
         var lengthOffset:uint = extra.length - entry.extraLength;
         this._data.position = entry.offsetLOC + ZipFormat.LOCEXT;
         this._data.writeShort(extra.length);
         this._data.position = entry.offsetCEN + ZipFormat.CENEXT;
         this._data.writeShort(extra.length);
         for each(e in this._entries)
         {
            if(e.offsetLOC > entry.offsetLOC)
            {
               this._data.position = e.offsetCEN + ZipFormat.CENOFF;
               this._data.writeUnsignedInt(e.offsetLOC + lengthOffset);
            }
         }
         divideLOC = entry.offsetLOC + ZipFormat.LOCHDR + entry.nameLength;
         divideCEN = entry.offsetCEN + ZipFormat.CENHDR + entry.nameLength;
         newData = new ByteArray();
         newData.endian = Endian.LITTLE_ENDIAN;
         newData.writeBytes(this._data,0,divideLOC);
         newData.writeBytes(extra);
         newData.writeBytes(this._data,divideLOC + entry.extraLength,divideCEN - divideLOC - entry.extraLength);
         newData.writeBytes(extra);
         newData.writeBytes(this._data,divideCEN + entry.extraLength,this._data.length - divideCEN - entry.extraLength);
         this._data.clear();
         this._data.writeBytes(newData);
         newData.clear();
         entry.extraLength = extra.length;
         entry.extra = extra;
         for each(ze in this._entries)
         {
            if(ze.offsetLOC > entry.offsetLOC)
            {
               ze.offsetLOC += lengthOffset;
            }
            ze.offsetCEN += lengthOffset;
            if(ze.offsetCEN > entry.offsetCEN)
            {
               ze.offsetCEN += lengthOffset;
            }
         }
         this.updateValueOfENDSIZ(lengthOffset);
         this.updateValueOfENDOFF();
      }
      
      public function setEntryComment(entry:ZipEntry, comment:String) : void
      {
         var e:ZipEntry = null;
         var commentBytes:ByteArray = new ByteArray();
         commentBytes.endian = Endian.LITTLE_ENDIAN;
         commentBytes.writeMultiByte(comment,"gb2312");
         this._data.position = entry.offsetCEN + ZipFormat.CENCOM;
         this._data.writeShort(commentBytes.length);
         var divide:uint = entry.offsetCEN + ZipFormat.CENHDR + entry.nameLength + entry.extraLength;
         var newData:ByteArray = new ByteArray();
         newData.endian = Endian.LITTLE_ENDIAN;
         newData.writeBytes(this._data,0,divide);
         newData.writeBytes(commentBytes);
         newData.writeBytes(this._data,divide + entry.commentLength,this._data.length - divide - entry.commentLength);
         this._data.clear();
         this._data.writeBytes(newData);
         var lengthOffset:uint = commentBytes.length - entry.commentLength;
         entry.comment = comment;
         entry.commentLength = commentBytes.length;
         for each(e in this._entries)
         {
            if(e.offsetCEN > entry.offsetCEN)
            {
               e.offsetCEN += lengthOffset;
            }
         }
         this.updateValueOfENDSIZ(lengthOffset);
         this.updateValueOfENDOFF();
         newData.clear();
         commentBytes.clear();
      }
      
      public function setEntryTime(entry:ZipEntry, time:Number) : void
      {
         entry.dostime = this.getDosTime(time);
         this._data.position = entry.offsetLOC + ZipFormat.LOCTIM;
         this._data.writeUnsignedInt(entry.dostime);
         this._data.position = entry.offsetCEN + ZipFormat.CENTIM;
         this._data.writeUnsignedInt(entry.dostime);
      }
      
      private function getPositionENDSIG() : uint
      {
         this._data.position = 0;
         if(this._data.readUnsignedInt() == ZipFormat.ENDSIG)
         {
            return this._data.position - ZipFormat.ENDSIG_LENGTH;
         }
         this._data.position = this._data.length - ZipFormat.ENDSIG_LENGTH;
         while(this._data.position > ZipFormat.ENDSIG_LENGTH)
         {
            if(this._data.readInt() == ZipFormat.ENDSIG)
            {
               return this._data.position - ZipFormat.ENDSIG_LENGTH;
            }
            this._data.position -= ZipFormat.ENDSIG_LENGTH + 1;
         }
         throw new ZipError(ZipError.ZIP_INVALID);
      }
      
      private function getPositionCENSIG() : uint
      {
         var endSig:uint = this.getPositionENDSIG();
         this._data.position = endSig + ZipFormat.ENDOFF;
         return this._data.readUnsignedInt();
      }
      
      private function getDosTime(time:Number) : uint
      {
         var d:Date = new Date(time);
         return uint((d.fullYear - 1980 & 0x7F) << 25 | d.month + 1 << 21 | d.date << 16 | d.hours << 11 | d.minutes << 5 | d.seconds >> 1);
      }
      
      private function parse() : void
      {
         var entry:ZipEntry = null;
         var endSig:uint = this.getPositionENDSIG();
         this._data.position = endSig + ZipFormat.ENDTOT;
         this._entries = new Array(this._data.readShort());
         this._data.position = endSig + ZipFormat.ENDCOM;
         this._comment = this._data.readMultiByte(this._data.readShort(),"gb2312");
         this._data.position = this.getPositionCENSIG();
         for(var i:int = 0; i < this._entries.length; i++)
         {
            entry = new ZipEntry("");
            entry.offsetCEN = this._data.position;
            this._data.readUnsignedInt().toString(16);
            entry.versionMadeBy = this._data.readShort();
            entry.version = this._data.readShort();
            entry.flag = this._data.readShort();
            entry.method = this._data.readShort();
            entry.dostime = this._data.readUnsignedInt();
            entry.crc32 = this._data.readUnsignedInt();
            entry.compressedSize = this._data.readUnsignedInt();
            entry.size = this._data.readUnsignedInt();
            entry.nameLength = this._data.readShort();
            entry.extraLength = this._data.readShort();
            entry.commentLength = this._data.readShort();
            entry.diskNumberStart = this._data.readShort();
            entry.intFileAttributes = this._data.readShort();
            entry.extFileAttributes = this._data.readUnsignedInt();
            entry.offsetLOC = this._data.readUnsignedInt();
            entry.name = this._data.readMultiByte(entry.nameLength,"gb2312");
            if(entry.extraLength)
            {
               this._data.readBytes(entry.extra,0,entry.extraLength);
            }
            entry.comment = this._data.readMultiByte(entry.commentLength,"gb2312");
            this._entries[i] = entry;
         }
      }
      
      private function updateValueOfCENDOFF(entry:ZipEntry, value:uint) : void
      {
         this._data.position = entry.offsetCEN + ZipFormat.CENOFF;
         this._data.writeUnsignedInt(value);
      }
      
      private function updateValueOfENDSIZ(lengthOffset:uint) : void
      {
         var endSig:uint = this.getPositionENDSIG();
         this._data.position = endSig + ZipFormat.ENDSIZ;
         var newEndSize:uint = this._data.readUnsignedInt() + lengthOffset;
         this._data.position = endSig + ZipFormat.ENDSIZ;
         this._data.writeUnsignedInt(newEndSize);
      }
      
      private function updateValueOfENDOFF() : void
      {
         var newEndOffset:uint = 0;
         var entry:ZipEntry = null;
         var endSig:uint = this.getPositionENDSIG();
         if(this._entries.length)
         {
            newEndOffset = (this._entries[0] as ZipEntry).offsetCEN;
            for each(entry in this._entries)
            {
               if(entry.offsetCEN < newEndOffset)
               {
                  newEndOffset = entry.offsetCEN;
               }
            }
         }
         else
         {
            newEndOffset = 0;
         }
         this._data.position = endSig + ZipFormat.ENDOFF;
         this._data.writeUnsignedInt(newEndOffset);
      }
      
      private function updateValueOfENDSUB() : void
      {
         var endSig:uint = this.getPositionENDSIG();
         this._data.position = endSig + ZipFormat.ENDSUB;
         this._data.writeShort(this._entries.length);
      }
      
      private function updateValueOfENDTOT() : void
      {
         var endSig:uint = this.getPositionENDSIG();
         this._data.position = endSig + ZipFormat.ENDTOT;
         this._data.writeShort(this._entries.length);
      }
   }
}

