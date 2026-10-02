package a_4715
{
   public class EncrypBooleanEx
   {
      
      private var m_iBoolean:EncrypIntEx;
      
      public function EncrypBooleanEx(value:Boolean = false)
      {
         super();
         this.m_iBoolean = new EncrypIntEx();
         this.Value = value;
      }
      
      public function get Value() : Boolean
      {
         return Boolean(0 != this.m_iBoolean.Value);
      }
      
      public function set Value(value:Boolean) : void
      {
         if(value)
         {
            this.m_iBoolean.Value = Math.random() * 100000 + 1;
         }
         else
         {
            this.m_iBoolean.Value = 0;
         }
      }
   }
}

