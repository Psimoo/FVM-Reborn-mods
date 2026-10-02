package com.aurora.ui.maogoutd.verifyInGame
{
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   
   public class TDNumericVerifyInput
   {
      
      private var _inputField:TextField;
      
      private var _reporter:Function;
      
      private var _lastInputTime:Number = 0;
      
      private var _inputIntervals:Array = [];
      
      private var _pasteAttempted:Boolean = false;
      
      private var _lastTextValue:String = "";
      
      private var _textChangeNum:int = 0;
      
      private var _isDebug:Boolean;
      
      public function TDNumericVerifyInput(inputTxt:TextField, maxChar:int, isDebug:Boolean)
      {
         super();
         this._isDebug = isDebug;
         this._inputField = inputTxt;
         this._inputField.maxChars = maxChar;
         this._inputField.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this._inputField.addEventListener(Event.CHANGE,this.onTextChange);
      }
      
      private function onKeyDown(e:KeyboardEvent) : void
      {
         if(e.ctrlKey && e.keyCode == 86)
         {
            e.preventDefault();
            this._pasteAttempted = true;
            this._inputField.text = "";
            if(this._isDebug)
            {
               MessageTipHandler.Get().a_3146("粘贴快捷键被阻止");
            }
            if(this._reporter != null)
            {
               this._reporter({
                  "type":"pasteAttempt",
                  "pasteAttempt":true
               });
            }
            return;
         }
      }
      
      private function onTextChange(e:Event) : void
      {
         if(this._inputField.text.length > this._lastTextValue.length)
         {
            ++this._textChangeNum;
         }
         else if(this._inputField.text.length < this._lastTextValue.length)
         {
            this._textChangeNum -= this._lastTextValue.length - this._inputField.text.length;
         }
         this._lastTextValue = this._inputField.text;
      }
      
      public function checkInputResult() : void
      {
         if(this._textChangeNum != 4 || this._inputField.text.length != 4 || this._lastTextValue.length != 4 || this._inputField.text != this._lastTextValue)
         {
            this._reporter({
               "type":"oneKeyValue",
               "oneKeyValue":true
            });
         }
      }
      
      public function getTextChangeNum() : int
      {
         return this._textChangeNum;
      }
      
      public function getValue() : String
      {
         return this._inputField.text;
      }
      
      public function setValue(v:String) : void
      {
         this._inputField.text = v;
      }
      
      public function clear() : void
      {
         this._inputField.text = "";
         this._lastTextValue = "";
         this._textChangeNum = 0;
      }
      
      public function destroy() : void
      {
         this.clear();
         this._inputField.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this._inputField.removeEventListener(Event.CHANGE,this.onTextChange);
      }
      
      public function getTextField() : TextField
      {
         return this._inputField;
      }
      
      public function setReporter(fn:Function) : void
      {
         this._reporter = fn;
      }
      
      public function getInputIntervals() : Array
      {
         return this._inputIntervals.slice();
      }
      
      public function hasPasteAttempted() : Boolean
      {
         return this._pasteAttempted;
      }
   }
}

