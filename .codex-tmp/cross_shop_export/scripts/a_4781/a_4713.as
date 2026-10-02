package a_4781
{
   public class a_4713
   {
      
      public function a_4713()
      {
         super();
      }
      
      public static function getNodeAttributes(node:XML) : Object
      {
         var o:Object = null;
         var i:uint = 0;
         var n:String = null;
         var len:int = node.attributes().length();
         if(len > 0)
         {
            o = {};
            for(i = 0; i < len; i++)
            {
               n = a_4654.trim(node.attributes()[i].name().toString());
               o[n] = a_4654.trim(String(node.attributes()[i]));
            }
         }
         return o;
      }
      
      public static function getNodeValue(node:XML) : Object
      {
         var obj:Object = {};
         obj.nodeAttribute = getNodeAttributes(node);
         obj.nodeValue = parseNodeValue(node);
         obj.nodeName = node.name().toString();
         return obj;
      }
      
      public static function xmlStringFormat(strXML:String) : String
      {
         return strXML.substring(strXML.indexOf("<"),strXML.lastIndexOf(">") + 1);
      }
      
      private static function parseNodeValue(node:XML) : *
      {
         var v:* = undefined;
         var children:XMLList = null;
         var n:int = 0;
         var a:Array = null;
         var i:int = 0;
         if(node.hasSimpleContent())
         {
            v = node.toString();
            if(v != "" && !isNaN(v * 1))
            {
               v *= 1;
            }
            return v;
         }
         children = node.children();
         n = children.length();
         a = new Array(n);
         for(i = 0; i < n; i++)
         {
            a[i] = parseNodeValue(children[i]);
         }
         return a;
      }
   }
}

