package com.aurora.ui.maogoutd.task
{
   import a_4752.GameStringManager;
   
   public class a_4501
   {
      
      public var taskID:int;
      
      public var level:int;
      
      public var iHideLevel:int;
      
      public var taskName:String;
      
      public var taskAcquire:String;
      
      public var taskTarget:String;
      
      public var exp:int;
      
      public var gold:int;
      
      public var medal:int;
      
      public var consortiaPoint:int;
      
      public var consortiaScore:int;
      
      public var arrGenderAward:Array;
      
      public var arrAward:Array;
      
      public var mouseLevel:String;
      
      public var description:String;
      
      public var modeMapID:int;
      
      public var taskScript:Array;
      
      public var suffixType:String;
      
      public var shortCut:String;
      
      public var mapName:String;
      
      public var sortValue:int;
      
      public var showIcon:int;
      
      public var iVip:int;
      
      public var SiteType:String;
      
      public var strStartTime:String;
      
      public var strEndTime:String;
      
      public function a_4501()
      {
         super();
      }
      
      private function a_2024(fun:String) : Array
      {
         var para:String = null;
         var i:int = 0;
         while(-1 != fun.search(" "))
         {
            fun = fun.replace(" ","");
         }
         var FUN:Array = new Array();
         var splitArr:Array = fun.split("(");
         FUN[0] = splitArr[0];
         var paras:String = splitArr[1];
         paras = paras.replace(")","");
         var paraArr:Array = paras.split(",");
         if((paraArr[0] as String).length > 0)
         {
            for(i = 0; i < paraArr.length; i++)
            {
               para = paraArr[i];
               if(-1 != para.search("0x"))
               {
                  para = para.replace("0x","");
                  paraArr[i] = parseInt(para,16);
               }
               else
               {
                  paraArr[i] = int(para);
               }
            }
            FUN[1] = paraArr;
         }
         return FUN;
      }
      
      private function a_2026(str:String) : void
      {
         this.taskScript = new Array();
         var arrScript:Array = str.split("|");
         for(var i:uint = 0; i < arrScript.length; i++)
         {
            this.taskScript.push(this.a_2024(arrScript[i]));
         }
      }
      
      public function setTaskDesc(taskItem:XML) : void
      {
         var arrTmp:Array = null;
         var arrTmp2:Array = null;
         var strTmp:String = null;
         var str:String = null;
         var strStar:String = null;
         var iStar:int = 0;
         var split:Array = null;
         var i:uint = 0;
         var genderAward:String = taskItem.@genderAward;
         var szYongjiu:String = GameStringManager.getInstance().getString(132448);
         var szTian:String = GameStringManager.getInstance().getString(131854);
         var szXiaoshi:String = GameStringManager.getInstance().getString(132411);
         var szGe:String = GameStringManager.getInstance().getString(131873);
         var szXing:String = GameStringManager.getInstance().getString(133250);
         if(genderAward != null && genderAward.length > 0)
         {
            this.arrGenderAward = [];
            arrTmp = genderAward.split("|");
            for(i = 0; i < arrTmp.length; i++)
            {
               strTmp = arrTmp[i];
               arrTmp2 = strTmp.split("_");
               str = arrTmp2[3];
               if(szYongjiu == str)
               {
                  this.arrGenderAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,-1];
               }
               else if(str.search(szTian) != -1)
               {
                  this.arrGenderAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,24 * 60 * 60 * parseInt(str.replace(szTian,""))];
               }
               else if(str.search(szXiaoshi) != -1)
               {
                  this.arrGenderAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,3600 * parseInt(str.replace(szXiaoshi,""))];
               }
               else
               {
                  this.arrGenderAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,-1];
               }
            }
         }
         var Award:String = taskItem.@award;
         if(Award != null && Award.length > 0)
         {
            this.arrAward = [];
            arrTmp = Award.split("|");
            for(i = 0; i < arrTmp.length; i++)
            {
               strTmp = arrTmp[i];
               arrTmp2 = strTmp.split("_");
               str = arrTmp2[3];
               strStar = arrTmp2[2];
               iStar = 0;
               if(strStar.search(szXing) != -1)
               {
                  iStar = parseInt(strStar.replace(szXing,""));
               }
               if(szYongjiu == str)
               {
                  this.arrAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,-1,iStar];
               }
               else if(str.search(szTian) != -1)
               {
                  this.arrAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,24 * 60 * 60 * parseInt(str.replace(szTian,"")),iStar];
               }
               else if(str.search(szXiaoshi) != -1)
               {
                  this.arrAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],1,3600 * parseInt(str.replace(szXiaoshi,"")),iStar];
               }
               else
               {
                  str = arrTmp2[2];
                  this.arrAward[i] = [parseInt(arrTmp2[1]),arrTmp2[0],parseInt(str.replace(szGe,"")),-1,iStar];
               }
            }
         }
         this.description = "    " + taskItem.@description;
         this.exp = taskItem.@exp;
         this.gold = taskItem.@gold;
         this.consortiaPoint = taskItem.@consortiaPoint;
         this.consortiaScore = taskItem.@consortiaScore;
         this.level = taskItem.@level;
         this.mouseLevel = taskItem.@mouseLevel;
         this.taskAcquire = taskItem.@taskAcquire;
         this.taskName = taskItem.@taskName;
         this.taskTarget = taskItem.@taskTarget;
         this.modeMapID = taskItem.@modeMapID;
         this.medal = taskItem.@medal;
         this.shortCut = taskItem.@taskQuickStart;
         this.suffixType = taskItem.@suffixType;
         this.mapName = taskItem.@mapName;
         this.sortValue = taskItem.@sortValue;
         this.showIcon = taskItem.@showIcon;
         this.iHideLevel = taskItem.@hide_level;
         this.iVip = taskItem.@task_type;
         this.SiteType = taskItem.@site_type;
         this.strStartTime = String(taskItem.@start_date);
         this.strEndTime = String(taskItem.@end_date);
         if(null != this.suffixType && this.suffixType.length > 0)
         {
            split = this.suffixType.split("|");
            switch(int(split[0]))
            {
               case 1:
                  if(null == split[1])
                  {
                     throw new Error("Task_desc.xml Error,suffix 参数不匹配,task name = " + this.taskName);
                  }
                  break;
               case 2:
                  break;
               default:
                  throw new Error("Task_desc.xml Error,unknown suffixType,task name = " + this.taskName);
            }
         }
         var strScript:String = taskItem.@taskRequire;
         if(strScript.length > 0)
         {
            this.a_2026(strScript);
         }
         this.taskTarget = this.taskTarget.replace("fontcolor","font color");
         this.taskTarget = this.taskTarget.replace("fontcolor","font color");
         this.taskTarget = this.taskTarget.replace("fontcolor","font color");
      }
   }
}

