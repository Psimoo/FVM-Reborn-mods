package a_4715
{
   public class EncrypNumber
   {
      
      private static const CONST_NUMBER:int = 10000;
      
      private var m_iEncrypIntEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_fNumber:Number = 0;
      
      private var m_strNumber:String;
      
      public function EncrypNumber(value:Number = 0)
      {
         super();
         this.Value = value;
      }
      
      public function get Value() : Number
      {
         if(null != this.m_strNumber)
         {
            return Number(this.m_strNumber);
         }
         return Math.floor(this.m_iEncrypIntEx.Value / CONST_NUMBER * CONST_NUMBER) / CONST_NUMBER;
      }
      
      public function set Value(value:Number) : void
      {
         value += 1e-7;
         if(value * CONST_NUMBER > int.MAX_VALUE)
         {
            this.m_strNumber = value.toString();
            this.m_iEncrypIntEx.Value = 0;
            return;
         }
         this.m_iEncrypIntEx.Value = Math.floor(value * CONST_NUMBER);
         this.m_strNumber = null;
      }
   }
}

