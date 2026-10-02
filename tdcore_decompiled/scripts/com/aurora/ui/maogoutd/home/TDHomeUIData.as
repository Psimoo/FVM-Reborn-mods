package com.aurora.ui.maogoutd.home
{
   public class TDHomeUIData
   {
      
      private static var instance:TDHomeUIData = new TDHomeUIData();
      
      public var m_stMyHomeInfo:Object;
      
      public var m_stOtherHomeInfo:Object;
      
      public var m_arrHistory:Array;
      
      public var m_arrStruggleList:Array;
      
      public var m_arrMyPropsCard:Array;
      
      public function TDHomeUIData()
      {
         super();
         if(null != instance)
         {
            return;
         }
      }
      
      public static function getInstance() : TDHomeUIData
      {
         return instance;
      }
   }
}

