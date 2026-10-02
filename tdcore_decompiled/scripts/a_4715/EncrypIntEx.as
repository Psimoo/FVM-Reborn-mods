package a_4715
{
   public class EncrypIntEx
   {
      
      private var m_iEncryptInt:int;
      
      private var m_nIndex:int;
      
      public function EncrypIntEx(value:int = 0)
      {
         super();
         this.m_nIndex = 5 + Math.random() * 1000000 % 11;
         this.Value = value;
      }
      
      public function set Value(value:int) : void
      {
         value ^= 1 << 16 + this.m_nIndex % 9;
         value ^= 52942;
         value ^= 1 << this.m_nIndex;
         this.m_iEncryptInt = value;
      }
      
      public function get Value() : int
      {
         var value:int = this.m_iEncryptInt;
         value ^= 1 << 16 + this.m_nIndex % 9;
         value ^= 52942;
         return value ^ 1 << this.m_nIndex;
      }
   }
}

