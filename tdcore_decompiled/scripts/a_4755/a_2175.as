package a_4755
{
   public class a_2175 implements ITDGamePay
   {
      
      private static var _instance:ITDGamePay;
      
      private static var sign:Boolean;
      
      private var qqPayHandler:ITDGamePay;
      
      private var defaultPayHandler:a_2174;
      
      public function a_2175()
      {
         super();
         if(!sign)
         {
            throw new Error("PayManager不允许实例化，请通过getInstance()获取！");
         }
      }
      
      public static function getInstance() : ITDGamePay
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new a_2175();
            sign = false;
         }
         return _instance;
      }
      
      public function payRequest(pay_params:Object) : void
      {
         if(pay_params == null || pay_params.sitetype == undefined || pay_params.pay_cgi == undefined)
         {
            throw new Error("必须在pay_params中提供sitetype和pay_cgi参数值！");
         }
         switch(pay_params.sitetype)
         {
            case "qq":
               this.qqPayHandle(pay_params);
               break;
            default:
               this.defaultPayHandle(pay_params);
         }
      }
      
      private function qqPayHandle(pay_params:Object) : void
      {
         if(this.qqPayHandler == null)
         {
            this.qqPayHandler = new a_2176();
         }
         this.qqPayHandler.payRequest(pay_params);
      }
      
      private function defaultPayHandle(pay_params:Object) : void
      {
         if(this.defaultPayHandler == null)
         {
            this.defaultPayHandler = new a_2174();
         }
         this.defaultPayHandler.payRequest(pay_params);
      }
   }
}

