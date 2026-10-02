package com.aurora.ui.maogoutd.ClientLog
{
   import a_4752.a_2027;
   import a_4752.a_2036;
   import a_4754.a_2155;
   import com.aurora.ui.maogoutd.component.a_3306;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Keyboard;
   
   public class a_4807
   {
      
      private static var m_pInstance:a_4807 = new a_4807();
      
      private var m_pStage:Stage;
      
      private var m_stTip:ITDMessageTip;
      
      private var m_strItemList:String;
      
      private var m_stTextLog:TextField;
      
      private var m_index:int;
      
      private var fps:Fps;
      
      public function a_4807()
      {
         super();
         this.m_strItemList = "";
      }
      
      public static function Get() : a_4807
      {
         return m_pInstance;
      }
      
      public function RegisterStage(pStage:Stage) : void
      {
         var siteType:String = null;
         if(!this.m_pStage)
         {
            this.m_pStage = pStage;
            siteType = this.m_pStage.loaderInfo.parameters.sitetype;
            if(siteType == "pps" || siteType == "xiaowu" || siteType == "joyyou")
            {
               this.m_pStage.addEventListener(KeyboardEvent.KEY_UP,this.OnOpenTextLogHandler);
            }
            this.m_stTextLog = new TextField();
            this.m_stTextLog.width = 300;
            this.m_stTextLog.height = this.m_pStage.height;
            this.m_stTextLog.autoSize = TextFieldAutoSize.LEFT;
            this.m_stTextLog.border = true;
            this.m_stTextLog.borderColor = 10066329;
            this.m_stTextLog.background = true;
            this.m_stTextLog.backgroundColor = 13421772;
            this.m_stTextLog.alpha = 0.9;
            this.m_stTextLog.mouseEnabled = false;
            this.m_stTextLog.multiline = true;
            this.m_stTextLog.wordWrap = true;
            this.m_stTip = a_2155.e.GetMessageTip() as ITDMessageTip;
            this.fps = new Fps();
            this.fps.name = "fbs";
            this.fps.x = 62;
            this.fps.y = 0;
         }
      }
      
      private function OnOpenTextLogHandler(e:KeyboardEvent) : void
      {
         if(e.keyCode == Keyboard.NUMPAD_6 && e.ctrlKey)
         {
            CDebugPane.Get().visible = !CDebugPane.Get().visible;
         }
         else if(e.keyCode == Keyboard.NUMPAD_7 && e.ctrlKey)
         {
            a_2036.getInstance().isShowGrowTimes = !a_2036.getInstance().isShowGrowTimes;
         }
         else if(e.keyCode == Keyboard.NUMPAD_8 && e.ctrlKey)
         {
            a_2036.getInstance().isShowIntruderLife = !a_2036.getInstance().isShowIntruderLife;
         }
         else if(e.keyCode == Keyboard.NUMPAD_9 && e.ctrlKey)
         {
            if(this.fps.parent)
            {
               this.fps.parent.removeChild(this.fps);
            }
            else
            {
               this.m_pStage.addChild(this.fps);
            }
         }
      }
      
      public function startGame() : void
      {
         if(this.fps.parent)
         {
            this.fps.parent.removeChild(this.fps);
            this.m_pStage.addChild(this.fps);
         }
      }
      
      public function AppendText(strMsg:String) : void
      {
         this.m_stTextLog.appendText("\n" + this.m_index++ + ":" + strMsg);
      }
      
      public function ShowLog(strMsg:String) : void
      {
      }
      
      public function AddItem(id:int) : void
      {
         var stTipDesc:a_3306 = a_2027.getInstance().m_dictDesc[id];
         this.m_strItemList += stTipDesc.Name;
      }
      
      public function ShowItemList() : void
      {
         var stRect:Rectangle = new Rectangle();
         this.m_stTip.showTextTip(this.m_pStage,this.m_strItemList,new Rectangle());
         this.m_strItemList = "";
      }
   }
}

