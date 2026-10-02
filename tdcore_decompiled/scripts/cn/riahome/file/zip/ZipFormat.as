package cn.riahome.file.zip
{
   internal final class ZipFormat
   {
      
      internal static const LOCHDR:uint = 30;
      
      internal static const LOCSIG:uint = 67324752;
      
      internal static const LOCVER:uint = 4;
      
      internal static const LOCFLG:uint = 6;
      
      internal static const LOCHOW:uint = 8;
      
      internal static const LOCTIM:uint = 10;
      
      internal static const LOCCRC:uint = 14;
      
      internal static const LOCSIZ:uint = 18;
      
      internal static const LOCLEN:uint = 22;
      
      internal static const LOCNAM:uint = 26;
      
      internal static const LOCEXT:uint = 28;
      
      internal static const EXTHDR:uint = 12;
      
      internal static const EXTSIG:uint = 134695760;
      
      internal static const EXTCRC:uint = 0;
      
      internal static const EXTSIZ:uint = 4;
      
      internal static const EXTLEN:uint = 8;
      
      internal static const CENHDR:uint = 46;
      
      internal static const CENSIG:uint = 33639248;
      
      internal static const CENVEM:uint = 4;
      
      internal static const CENVER:uint = 6;
      
      internal static const CENFLG:uint = 8;
      
      internal static const CENHOW:uint = 10;
      
      internal static const CENTIM:uint = 12;
      
      internal static const CENCRC:uint = 16;
      
      internal static const CENSIZ:uint = 20;
      
      internal static const CENLEN:uint = 24;
      
      internal static const CENNAM:uint = 28;
      
      internal static const CENEXT:uint = 30;
      
      internal static const CENCOM:uint = 32;
      
      internal static const CENDSK:uint = 34;
      
      internal static const CENATT:uint = 36;
      
      internal static const CENATX:uint = 38;
      
      internal static const CENOFF:uint = 42;
      
      internal static const ENDHDR:uint = 22;
      
      internal static const ENDSIG_LENGTH:uint = 4;
      
      internal static const ENDSIG:uint = 101010256;
      
      internal static const ENDSUB:uint = 8;
      
      internal static const ENDTOT:uint = 10;
      
      internal static const ENDSIZ:uint = 12;
      
      internal static const ENDOFF:uint = 16;
      
      internal static const ENDCOM:uint = 20;
      
      internal static const STORED:uint = 0;
      
      internal static const DEFLATED:uint = 8;
      
      public function ZipFormat()
      {
         super();
      }
   }
}

