package com.aurora.ui.maogoutd.ClientLog
{
   import a_4715.EncrypBooleanEx;
   import a_4752.a_2036;
   import a_4752.a_2037;
   import a_4754.a_2161;
   import com.adobe.crypto.MD5;
   import com.adobe.images.JPGEncoder;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.Stage;
   import flash.errors.IOError;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class a_4814
   {
      
      private static const a_4815:String = "stat/screenshot.php";
      
      public static var m_bOpen:EncrypBooleanEx = new EncrypBooleanEx(true);
      
      private static var m_pInstance:a_4814 = new a_4814();
      
      private var m_pStage:Stage;
      
      public function a_4814()
      {
         super();
      }
      
      public static function Get() : a_4814
      {
         return m_pInstance;
      }
      
      private function get URL() : String
      {
         var siteType:String = this.m_pStage.loaderInfo.parameters.platform_id;
         var strUrl:String = "";
         switch(siteType)
         {
            case "4399":
               strUrl = "https://miscbg-4399.123u.com/";
               break;
            case "7k7k":
               strUrl = "http://miscbg-7k7k.123u.com/";
               break;
            case "360":
               strUrl = "http://misc.360.123u.com/";
               break;
            case "3366":
               strUrl = "http://3366load-gz-qq.123u.com/misc/";
               break;
            case "qq":
               strUrl = "http://misc-gz-qq.123u.com/";
               break;
            case "123u":
               strUrl = "http://td.preview.123u.com/";
               break;
            case "pps":
               strUrl = "http://misc.pps.123u.com/";
         }
         return strUrl + a_4815;
      }
      
      public function a_3014(stage:Stage) : void
      {
         if(this.m_pStage)
         {
            return;
         }
         this.m_pStage = stage;
      }
      
      public function a_2201(iMapID:int, iGradeScore:int) : void
      {
         if(!m_bOpen.Value)
         {
            return;
         }
         if(!this.m_pStage)
         {
            return;
         }
         if(!this.Check(iMapID,iGradeScore))
         {
            return;
         }
         var iGroupID:int = int(a_2161.e.getEnterRoom().m_iGroupID);
         var uURLRequest:URLRequest = new URLRequest();
         var bmpd:BitmapData = new BitmapData(this.m_pStage.stageWidth,this.m_pStage.stageHeight,false);
         bmpd.draw(this.m_pStage,new Matrix(1,0,0,1));
         var bmpd2:BitmapData = new BitmapData(bmpd.width,bmpd.height,false,0);
         bmpd2.copyChannel(bmpd,new Rectangle(0,0,bmpd.width,bmpd.height),new Point(),BitmapDataChannel.BLUE,BitmapDataChannel.BLUE);
         bmpd2.copyChannel(bmpd,new Rectangle(0,0,bmpd.width,bmpd.height),new Point(),BitmapDataChannel.GREEN,BitmapDataChannel.GREEN);
         bmpd2.copyChannel(bmpd,new Rectangle(0,0,bmpd.width,bmpd.height),new Point(),BitmapDataChannel.RED,BitmapDataChannel.RED);
         var bytes:ByteArray = new JPGEncoder().encode(bmpd2);
         var role:Object = a_2161.e.GetCurrentRole();
         var iTime:int = new Date().getTime();
         var siteType:String = this.m_pStage.loaderInfo.parameters.sitetype;
         var p:String = "?role_uin=" + role.m_iRoleUin + "&group_id=" + iGroupID + "&map_id=" + iMapID + "&grade_score=" + iGradeScore + "&time=" + iTime + "&site_type=" + siteType + "&signture=" + a_2036.getInstance().a_783 + "&src_uin=" + a_2036.getInstance().m_iUin + "&sign=" + MD5.hash(iGroupID.toString() + role.m_iRoleUin.toString() + iMapID.toString() + iGradeScore.toString() + iTime.toString());
         uURLRequest.url = this.URL + p;
         uURLRequest.data = bytes;
         uURLRequest.method = URLRequestMethod.POST;
         uURLRequest.contentType = "application/octet-stream";
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         try
         {
            loader.load(uURLRequest);
         }
         catch(error:IOError)
         {
         }
      }
      
      private function Check(iMapID:int, iGradeScore:int) : Boolean
      {
         var mapInfo:Object = null;
         var dictMapMouse:Dictionary = null;
         if(iMapID == 0 && iGradeScore == 0)
         {
            return true;
         }
         var arrMapMouse:Array = a_2037.getInstance().m_arrMapMouse;
         for each(mapInfo in arrMapMouse)
         {
            if(iMapID == mapInfo.iGameMapID && mapInfo.iGradeScore < iGradeScore && mapInfo.iGradeScore != 0)
            {
               return true;
            }
         }
         dictMapMouse = a_2037.getInstance().m_dictMapMouse;
         for each(mapInfo in dictMapMouse)
         {
            if(iMapID == mapInfo.iGameMapID && mapInfo.iGradeScore < iGradeScore && mapInfo.iGradeScore != 0)
            {
               return true;
            }
         }
         return false;
      }
   }
}

