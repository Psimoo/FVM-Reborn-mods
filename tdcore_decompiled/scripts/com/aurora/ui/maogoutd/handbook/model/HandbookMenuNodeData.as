package com.aurora.ui.maogoutd.handbook.model
{
   public class HandbookMenuNodeData
   {
      
      public var id:int;
      
      public var classifyType:int;
      
      public var name:String = "";
      
      public var enable:int;
      
      public var children:Array;
      
      public function HandbookMenuNodeData()
      {
         super();
         this.children = [];
      }
   }
}

