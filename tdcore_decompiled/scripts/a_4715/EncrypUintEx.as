package a_4715
{
   public class EncrypUintEx
   {
      
      private static const PRIME_ADDTION:uint = 1007;
      
      private var m_iEncryptInt:uint;
      
      private var m_iIndex:uint;
      
      public function EncrypUintEx(iValue:uint = 0)
      {
         super();
         this.m_iIndex = 11579568 + Math.random() * 1061109567;
         this.Value = iValue;
      }
      
      public function set Value(iValue:uint) : void
      {
         this.m_iEncryptInt = this.EncrytOperate(iValue);
      }
      
      public function get Value() : uint
      {
         return this.EncrytOperate(this.m_iEncryptInt);
      }
      
      protected function EncrytOperate(iValue:uint) : uint
      {
         iValue ^= this.m_iIndex;
         return uint(iValue ^ this.m_iIndex + PRIME_ADDTION);
      }
   }
}

