package a_4790
{
   import a_4781.Tool;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class a_4659 extends Sprite
   {
      
      private var _simpleButton:SimpleButton;
      
      private var _disabledState:DisplayObject;
      
      private var _enabled:Boolean = true;
      
      public function a_4659(simpleButton:SimpleButton, disabledState:DisplayObject = null)
      {
         super();
         if(simpleButton == null)
         {
            throw new Error("simpleButton参数不能为null!");
         }
         this._simpleButton = simpleButton;
         this._disabledState = disabledState;
         this._simpleButton.x = this._simpleButton.y = 0;
         if(this._disabledState != null)
         {
            this._disabledState.x = this._disabledState.y = 0;
         }
         this.enabled = this._enabled;
      }
      
      public function set enabled(b:Boolean) : void
      {
         this._enabled = b;
         Tool.setEnabled(this._simpleButton,this._disabledState,this,b);
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function setSkin(skin:Dictionary) : void
      {
         if(skin.upState != undefined)
         {
            this._simpleButton.upState = skin.upState;
            this._simpleButton.hitTestState = skin.hitTestState;
         }
         if(skin.overState != undefined)
         {
            this._simpleButton.overState = skin.overState;
         }
         if(skin.downState != undefined)
         {
            this._simpleButton.downState = skin.downState;
         }
         if(skin.disabledState != undefined)
         {
            this._disabledState = skin.disabledState;
         }
         this.enabled = this._enabled;
      }
      
      public function get simpleButton() : SimpleButton
      {
         return this._simpleButton;
      }
      
      public function get disabledState() : DisplayObject
      {
         return this._disabledState;
      }
   }
}

