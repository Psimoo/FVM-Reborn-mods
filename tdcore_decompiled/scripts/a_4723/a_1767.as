package a_4723
{
   public class a_1767
   {
      
      private static var instance:a_1767;
      
      private var a_540:int;
      
      private var m_iOffsetMs:Number;
      
      public function a_1767()
      {
         super();
      }
      
      public static function getInstance() : a_1767
      {
         if(instance == null)
         {
            instance = new a_1767();
         }
         return instance;
      }
      
      public function set SystemTime(iSystemTime:int) : void
      {
         this.a_540 = iSystemTime;
         var tm:Number = new Date().time;
         this.m_iOffsetMs = iSystemTime * 1000 - tm;
      }
      
      public function get SystemTime() : int
      {
         return this.a_540;
      }
      
      public function get TimeMs() : Number
      {
         return new Date().time + this.m_iOffsetMs;
      }
      
      public function get TimeSeconds() : Number
      {
         return Math.floor(this.TimeMs / 1000);
      }
   }
}

