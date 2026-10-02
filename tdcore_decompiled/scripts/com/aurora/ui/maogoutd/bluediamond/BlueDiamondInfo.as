package com.aurora.ui.maogoutd.bluediamond
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.actions.a_3191;
   import flash.utils.Dictionary;
   
   public class BlueDiamondInfo
   {
      
      private static var instance:BlueDiamondInfo;
      
      private static var m_RoleBlueInfoDic:Dictionary;
      
      private static var m_HasRequest:Dictionary;
      
      private var m_stCallback:Function;
      
      public var stageInfo:Object;
      
      public function BlueDiamondInfo()
      {
         super();
         m_RoleBlueInfoDic = new Dictionary();
         m_HasRequest = new Dictionary();
      }
      
      public static function getInstance() : BlueDiamondInfo
      {
         if(instance == null)
         {
            instance = new BlueDiamondInfo();
         }
         return instance;
      }
      
      public function GetBlueDiamondInfo(uinArr:Array, callBack:Function) : Array
      {
         var retArr:Array = [];
         var requestArr:Array = [];
         for(var i:int = 0; i < uinArr.length; i++)
         {
            if(!(Boolean(uinArr[i]) && uinArr[i] == 0))
            {
               if(m_RoleBlueInfoDic[uinArr[i]])
               {
                  retArr.push(m_RoleBlueInfoDic[uinArr[i]]);
               }
               else if(m_HasRequest[uinArr[i]] != 1)
               {
                  requestArr.push(uinArr[i]);
               }
               m_HasRequest[uinArr[i]] = 1;
            }
         }
         if(requestArr.length > 0)
         {
            this.requestInfo(requestArr);
            this.m_stCallback = callBack;
         }
         return retArr;
      }
      
      private function requestInfo(uinArr:Array) : void
      {
         var enterRoom:Object = null;
         var params:Object = null;
         var i:int = 0;
         if(!uinArr || uinArr.length == 0)
         {
            return;
         }
         if(this.stageInfo.sitetype == "qqgame")
         {
            enterRoom = a_2161.e.getEnterRoom();
            params = {};
            params.role_uin = "";
            for(i = 0; i < uinArr.length; i++)
            {
               params.role_uin += uinArr[i].toString();
               if(i != uinArr.length - 1)
               {
                  params.role_uin += ",";
               }
            }
            params.group_id = enterRoom.m_iGroupID;
            params.URLType = 24;
            a_3191.getInstance().sendRequest(this,params,this.updateInfo);
         }
      }
      
      private function updateInfo(back_obj:Object) : void
      {
         var i:int = 0;
         var obj:Object = back_obj.data;
         var retArr:Array = [];
         if(obj.result_id == 0)
         {
            for(i = 0; i < obj.data.length; i++)
            {
               m_RoleBlueInfoDic[obj.data[i].uin] = obj.data[i];
               retArr.push(m_RoleBlueInfoDic[obj.data[i].uin]);
            }
         }
         if(null != this.m_stCallback)
         {
            this.m_stCallback.apply(null,[retArr]);
         }
      }
   }
}

