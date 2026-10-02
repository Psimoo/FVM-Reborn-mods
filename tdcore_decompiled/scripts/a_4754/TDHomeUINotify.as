package a_4754
{
   import a_4739.a_1828;
   
   public class TDHomeUINotify extends a_1828
   {
      
      public static var e:TDHomeUINotify = new TDHomeUINotify();
      
      public function TDHomeUINotify()
      {
         super();
      }
      
      public function requestHomeInfoByUin(uin:int) : void
      {
         notify("RequestHomeInfoByUin",uin);
      }
      
      public function responseInfoByUin(data:Object) : void
      {
         notify("responseInfoByUin",data);
      }
      
      public function requestStruggleCat(uin:int, name:String) : void
      {
         notify("RequestStruggleCat",uin,name);
      }
      
      public function responseStruggleCat(data:Object) : void
      {
         notify("responseStruggleCat",data);
      }
      
      public function requestStealOven(iHisUin:int, name:String, iOvenId:int) : void
      {
         notify("RequestStealOven",iHisUin,name,iOvenId);
      }
      
      public function responseStealOven(data:Object) : void
      {
         notify("responseStealOven",data);
      }
      
      public function requestCook(iOvenId:int, propId:int, formulaId:int, iCont:int) : void
      {
         notify("RequestCook",iOvenId,propId,formulaId,iCont);
      }
      
      public function responseCook(data:Object) : void
      {
         notify("responseCook",data);
      }
      
      public function requestHarvest(iOvenId:int) : void
      {
         notify("RequestHarvest",iOvenId);
      }
      
      public function responseHarvest(data:Object) : void
      {
         notify("responseHarvest",data);
      }
      
      public function requestGetAward(iAwardId:int) : void
      {
         notify("RequestGetAward",iAwardId);
      }
      
      public function responseGetAward(data:Object) : void
      {
         notify("responseGetAward",data);
      }
      
      public function requestFunnyCat() : void
      {
         notify("RequestFunnyCat");
      }
      
      public function responseFunnyCat(data:Object) : void
      {
         notify("responseFunnyCat",data);
      }
      
      public function requestHistory() : void
      {
         notify("RequestHistory");
      }
      
      public function responseHistory(data:Object) : void
      {
         notify("responseHistory",data);
      }
      
      public function homeNotify(data:Object) : void
      {
         notify("homeNotify",data);
      }
      
      public function requestRefrushStar(ovenId:int) : void
      {
         notify("RequestRefrushStar",ovenId);
      }
      
      public function responseRefrushStar(data:Object) : void
      {
         notify("responseRefrushStar",data);
      }
      
      public function requestBuyCount(flag:int) : void
      {
         notify("RequestBuyCount",flag);
      }
      
      public function responseBuyCount(data:Object) : void
      {
         notify("responseBuyCount",data);
      }
      
      public function requestClearTime() : void
      {
         notify("RequestClearTime");
      }
      
      public function responseClearTime(data:Object) : void
      {
         notify("responseClearTime",data);
      }
      
      public function requestFriendHomeInfo(arrUin:Array) : void
      {
         notify("RequestFriendHomeInfo",arrUin);
      }
      
      public function responseFriendHomeInfo(data:Object) : void
      {
         notify("responseFriendHomeInfo",data);
      }
   }
}

