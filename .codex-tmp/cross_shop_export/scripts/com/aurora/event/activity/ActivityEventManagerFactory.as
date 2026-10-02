package com.aurora.event.activity
{
   import flash.events.EventDispatcher;
   
   public class ActivityEventManagerFactory extends EventDispatcher
   {
      
      private static var m_pInstance:ActivityEventManagerFactory;
      
      public function ActivityEventManagerFactory()
      {
         super();
      }
      
      public static function getInstance() : ActivityEventManagerFactory
      {
         if(null == m_pInstance)
         {
            m_pInstance = new ActivityEventManagerFactory();
         }
         return m_pInstance;
      }
   }
}

