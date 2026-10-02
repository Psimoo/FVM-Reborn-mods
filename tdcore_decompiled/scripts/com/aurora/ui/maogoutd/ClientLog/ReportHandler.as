package com.aurora.ui.maogoutd.ClientLog
{
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.CommonEvent;
   import a_4752.GameStringManager;
   import a_4752.a_2036;
   import a_4754.a_2161;
   import a_4788.a_4648;
   import com.adobe.crypto.MD5;
   import com.adobe.images.JPGEncoder;
   import com.aurora.protocol.hallserver.report.CCSResponseReportPlayer;
   import com.aurora.ui.maogoutd.role.a_4463;
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
   
   public class ReportHandler
   {
      
      public static const REPORT_STATE_REQUEST:int = 0;
      
      public static const REPORT_STATE_ALLOW:int = 1;
      
      public static const REPORT_STATE_NOT_ALLOWED:int = 2;
      
      private static const a_4815:String = "stat/report.php";
      
      private static var m_pInstance:ReportHandler = new ReportHandler();
      
      public var m_iReportState:int;
      
      private var m_pStage:Stage;
      
      private var m_stLoader:URLLoader;
      
      public var m_iOpponentUin:int;
      
      public var m_bIsVs:Boolean;
      
      public var m_strInfo:String;
      
      public function ReportHandler()
      {
         super();
         this.m_stLoader = new URLLoader();
         this.m_iReportState = REPORT_STATE_REQUEST;
         a_1789.getInstance().addEventListener(EventType.REPORT_PLAYER,this.OnCCSResponseReportPlayer);
      }
      
      public static function Get() : ReportHandler
      {
         return m_pInstance;
      }
      
      private function OnCCSResponseReportPlayer(e:CommonEvent) : void
      {
         var stRole:a_4463 = null;
         var stResonse:CCSResponseReportPlayer = e.Data as CCSResponseReportPlayer;
         a_4648.a_4649("CCSResponseReportPlayer .m_nResultID:" + stResonse.m_nResultID + ",type:" + stResonse.m_iType + ",Uin:" + stResonse.m_iUin + ",op_uin:" + stResonse.m_iOpponentUin);
         if(0 == stResonse.m_nResultID)
         {
            stRole = a_2161.e.GetCurrentRole() as a_4463;
            if(stResonse.m_iUin == stRole.m_iRoleUin && stResonse.m_iType == 1)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139924));
            }
            if(stResonse.m_iType == 1)
            {
               this.a_2201(stResonse);
               if(stResonse.m_iUin == stRole.m_iRoleUin)
               {
                  this.m_iReportState = REPORT_STATE_NOT_ALLOWED;
               }
            }
            else
            {
               this.m_iReportState = REPORT_STATE_ALLOW;
            }
         }
         else
         {
            this.m_iReportState = REPORT_STATE_NOT_ALLOWED;
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139923));
         }
      }
      
      public function OnRequestReportTime() : void
      {
         this.m_iReportState = REPORT_STATE_NOT_ALLOWED;
         var stRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("OnCCSRequestReportPlayer",stRole.m_iRoleUin,0,0);
      }
      
      public function OnCCSRequestReportPlayer() : void
      {
         var stRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("OnCCSRequestReportPlayer",stRole.m_iRoleUin,this.m_iOpponentUin,1);
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
               break;
            case "joyyou":
               strUrl = "http://miscbg-joyyou.123u.com/";
               break;
            case "aipai":
               strUrl = "http://miscbg.aipai.123u.com/";
               break;
            case "qqgame":
               strUrl = "http://misc-qqgame-ms.123u.com/";
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
      
      public function a_2201(stResonse:CCSResponseReportPlayer) : void
      {
         if(!this.m_pStage)
         {
            return;
         }
         if(a_4815 == this.URL)
         {
            return;
         }
         var iGroupID:int = int(a_2161.e.getEnterRoom().m_iGroupID);
         var uURLRequest:URLRequest = new URLRequest();
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var iTime:int = stResonse.m_iTime;
         var siteType:String = this.m_pStage.loaderInfo.parameters.platform_id;
         var p:String = "?role_uin=" + role.m_iRoleUin + "&uin=" + stResonse.m_iUin + "&opponent_uin=" + stResonse.m_iOpponentUin + "&group_id=" + iGroupID + "&report_info=" + this.m_strInfo + "|group_id:" + iGroupID + "|uin:" + role.m_iRoleUin + "|name:" + role.m_szRoleName + "&time=" + iTime + "&site_type=" + siteType + "&signture=" + a_2036.getInstance().a_783 + "&src_uin=" + a_2036.getInstance().m_iUin + "&verify=" + stResonse.m_iVerify + "&sign=" + MD5.hash(iGroupID.toString() + role.m_iRoleUin.toString() + iTime.toString());
         uURLRequest.url = this.URL + p;
         uURLRequest.data = this.GetScreenCapData();
         uURLRequest.method = URLRequestMethod.POST;
         uURLRequest.contentType = "application/octet-stream";
         this.m_stLoader.dataFormat = URLLoaderDataFormat.BINARY;
         try
         {
            this.m_stLoader.load(uURLRequest);
         }
         catch(error:IOError)
         {
         }
      }
      
      public function GetScreenCapData() : ByteArray
      {
         var bmpd:BitmapData = new BitmapData(this.m_pStage.stageWidth,this.m_pStage.stageHeight,false);
         bmpd.draw(this.m_pStage,new Matrix(1,0,0,1));
         var bmpd2:BitmapData = new BitmapData(bmpd.width,bmpd.height,false,0);
         bmpd2.copyChannel(bmpd,new Rectangle(0,0,bmpd.width,bmpd.height),new Point(),BitmapDataChannel.BLUE,BitmapDataChannel.BLUE);
         bmpd2.copyChannel(bmpd,new Rectangle(0,0,bmpd.width,bmpd.height),new Point(),BitmapDataChannel.GREEN,BitmapDataChannel.GREEN);
         bmpd2.copyChannel(bmpd,new Rectangle(0,0,bmpd.width,bmpd.height),new Point(),BitmapDataChannel.RED,BitmapDataChannel.RED);
         return new JPGEncoder().encode(bmpd2);
      }
   }
}

