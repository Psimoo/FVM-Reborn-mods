package com.aurora.ui.maogoutd.component.dialog.explain
{
   import flash.events.Event;
   
   public class LiziDialogEvent extends Event
   {
      
      public static const MS_DIALOG_OPEN:String = "ms_dialog_open";
      
      public static const MS_DIALOG_CLOSE:String = "ms_dialog_close";
      
      public static const MS_DIALOG_SURE:String = "ms_dialog_sure";
      
      public static const MS_DIALOG_CANCEL:String = "ms_dialog_cancel";
      
      public var dialogData:Object;
      
      public function LiziDialogEvent(type:String, data:Object, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         var key:String = null;
         super(type,bubbles,cancelable);
         this.dialogData = {};
         for(key in data)
         {
            this.dialogData[key] = data[key];
         }
      }
      
      override public function clone() : Event
      {
         return new LiziDialogEvent(this.type,this.dialogData,this.bubbles,this.cancelable);
      }
      
      override public function toString() : String
      {
         var key:String = null;
         var str:String = "";
         for(key in this.dialogData)
         {
            str += key + ":" + this.dialogData[key] + "\n";
         }
         return str + super.toString();
      }
   }
}

