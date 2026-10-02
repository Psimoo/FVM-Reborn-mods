package cn.riahome.file.zip
{
   public class ZipError extends Error
   {
      
      public static const COMPRESSION_METHOD_INVALID:String = "不支持或无效的压缩方法，只支持 DEFLATE 压缩算法。";
      
      public static const ZIP_INVALID:String = "已损坏或无效的 zip 文件。";
      
      public static const FILE_NAME_IS_NULL:String = "文件名不能为空。";
      
      public static const FILE_EXISTED:String = "文件已存在。";
      
      public function ZipError(message:String = "", id:int = 0)
      {
         super(message,id);
      }
   }
}

