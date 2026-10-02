package com.aurora.ui.maogoutd.component.tip
{
   import a_4718.a_1744;
   import a_4720.a_1748;
   import a_4781.a_4713;
   
   public class a_3291
   {
      
      private static var sign:Boolean;
      
      private static var instance:a_3291;
      
      private var arrTips:Array;
      
      private var tipTotal:int;
      
      private var arrVSGameTips:Array;
      
      private var arrVCGameTips:Array;
      
      private var arrPrimaryFusionTips:Array;
      
      private var arrDeepFusionTips:Array;
      
      private var arrSoulFusionTips:Array;
      
      private var arrUPGradeTips:Array;
      
      public function a_3291()
      {
         super();
         if(!sign)
         {
            throw new Error("ConvenienceTip不能实例化，只能通过getInstance()获取！");
         }
         this.init();
      }
      
      public static function getInstance() : a_3291
      {
         if(instance == null)
         {
            sign = true;
            instance = new a_3291();
            sign = false;
         }
         return instance;
      }
      
      public function setData(xmlData:XML) : void
      {
         var len:int = 0;
         var i:int = 0;
         this.arrTips.length = 0;
         this.arrVSGameTips.length = 0;
         this.arrVCGameTips.length = 0;
         this.arrPrimaryFusionTips.length = 0;
         this.arrDeepFusionTips.length = 0;
         this.arrSoulFusionTips.length = 0;
         this.arrUPGradeTips.length = 0;
         this.tipTotal = 0;
         var messageList:XMLList = xmlData..message;
         if(messageList != null)
         {
            len = messageList.length();
            for(i = 0; i < len; i++)
            {
               this.parseMessage(messageList[i]);
            }
         }
      }
      
      public function getTipTotal() : int
      {
         return this.tipTotal;
      }
      
      public function getTipByIndex(id:int) : Object
      {
         if(id < 0)
         {
            return null;
         }
         if(id > this.tipTotal - 1)
         {
            return null;
         }
         return this.arrTips[id];
      }
      
      public function getTipGroup(type:String) : Array
      {
         var msg:Object = null;
         var arr:Array = new Array();
         if(!a_1744.isAvailableType(type))
         {
            return arr;
         }
         for(var i:int = 0; i < this.tipTotal; i++)
         {
            msg = this.arrTips[i];
            if(msg.type == type)
            {
               arr.push(msg);
            }
         }
         return arr;
      }
      
      public function getTipContentByGameMode(mode:int) : Array
      {
         if(mode == a_1748.enmGameMode_vs)
         {
            return this.arrVSGameTips;
         }
         return this.arrVCGameTips;
      }
      
      public function getTipContentByFusionType(type:int) : Array
      {
         if(type == 13)
         {
            return this.arrPrimaryFusionTips;
         }
         if(type == 14)
         {
            return this.arrDeepFusionTips;
         }
         if(type == 15)
         {
            return this.arrSoulFusionTips;
         }
         if(type == 16)
         {
            return this.arrUPGradeTips;
         }
         return this.arrPrimaryFusionTips;
      }
      
      private function parseMessage(xmlNode:XML) : void
      {
         var msg:Object = null;
         var obj:Object = a_4713.getNodeAttributes(xmlNode);
         var childrenList:XMLList = xmlNode.children();
         var len:int = childrenList.length();
         for(var i:int = 0; i < len; i++)
         {
            msg = {};
            msg.type = obj.type;
            msg.msg = childrenList[i].toString();
            this.arrTips.push(msg);
            ++this.tipTotal;
            if(msg.type == a_1744.VS_TIP)
            {
               this.arrVSGameTips.push(msg);
            }
            else if(msg.type == a_1744.VC_TIP)
            {
               this.arrVCGameTips.push(msg);
            }
            else if(msg.type == a_1744.PRIMARYFUSION_TIP)
            {
               this.arrPrimaryFusionTips.push(msg);
            }
            else if(msg.type == a_1744.DEEPFUSION_TIP)
            {
               this.arrDeepFusionTips.push(msg);
            }
            else if(msg.type == a_1744.SOULFUSION_TIP)
            {
               this.arrSoulFusionTips.push(msg);
            }
            else if(msg.type == a_1744.UPGRADE_TIP)
            {
               this.arrUPGradeTips.push(msg);
            }
            else
            {
               this.arrVSGameTips.push(msg);
               this.arrVCGameTips.push(msg);
            }
         }
      }
      
      private function init() : void
      {
         this.arrTips = new Array();
         this.arrVSGameTips = new Array();
         this.arrVCGameTips = new Array();
         this.arrPrimaryFusionTips = new Array();
         this.arrDeepFusionTips = new Array();
         this.arrSoulFusionTips = new Array();
         this.arrUPGradeTips = new Array();
      }
   }
}

