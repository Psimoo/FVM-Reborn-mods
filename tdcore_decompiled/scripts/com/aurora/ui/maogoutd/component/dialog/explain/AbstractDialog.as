package com.aurora.ui.maogoutd.component.dialog.explain
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class AbstractDialog extends Sprite
   {
      
      protected var _dialog_data:Object;
      
      protected var _dialog_id:int;
      
      protected var _container:DisplayObjectContainer;
      
      public function AbstractDialog(container:DisplayObjectContainer, id:int, data:Object)
      {
         super();
         this._dialog_id = id;
         this._dialog_data = data;
         this._container = container;
      }
      
      public function open(container:DisplayObjectContainer) : void
      {
         this._container = container;
         dispatchEvent(new LiziDialogEvent(LiziDialogEvent.MS_DIALOG_OPEN,{"dialog_id":this._dialog_id}));
      }
      
      public function close() : void
      {
         if(this._container.getChildByName(this.name) != null)
         {
            this._container.removeChild(this);
         }
         dispatchEvent(new LiziDialogEvent(LiziDialogEvent.MS_DIALOG_CLOSE,{"dialog_id":this._dialog_id}));
      }
      
      public function sure() : void
      {
         dispatchEvent(new LiziDialogEvent(LiziDialogEvent.MS_DIALOG_SURE,{"dialog_id":this._dialog_id}));
      }
      
      public function cancel() : void
      {
         dispatchEvent(new LiziDialogEvent(LiziDialogEvent.MS_DIALOG_CANCEL,{"dialog_id":this._dialog_id}));
      }
      
      public function get container() : DisplayObjectContainer
      {
         return this._container;
      }
   }
}

