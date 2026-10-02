package a_4755
{
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class a_2174 implements ITDGamePay
   {
      
      private const holder:String = "/./";
      
      public function a_2174()
      {
         super();
      }
      
      public function payRequest(pay_params:Object) : void
      {
         var url:String = this.setParamsToURL(pay_params.pay_cgi,pay_params.replaceValues);
         navigateToURL(new URLRequest(url),"_blank");
      }
      
      private function setParamsToURL(url:String, params:Array) : String
      {
         if(params == null || params.length == 0)
         {
            return url;
         }
         var reg:RegExp = new RegExp(this.holder);
         var i:int = 0;
         var n:int = int(params.length);
         while(i < n)
         {
            url = url.replace(reg,params[i]);
            i++;
         }
         return url;
      }
   }
}

