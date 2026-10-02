package a_4793
{
   import a_4790.a_4659;
   import flash.display.SimpleButton;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class DragTarget extends a_4659
   {
      
      public function DragTarget(skin:Dictionary)
      {
         super(skin.simpleButton,skin.disabledState);
         super.disabledState.x = super.simpleButton.x = -this.width / 2;
         super.disabledState.y = super.simpleButton.y = -this.height / 2;
      }
      
      public function setSize(w:uint, h:uint) : void
      {
         super.disabledState.x = super.simpleButton.x = -this.width / 2;
         super.disabledState.y = super.simpleButton.y = -this.height / 2;
      }
      
      public function getSize() : Rectangle
      {
         var rect:Rectangle = new Rectangle();
         rect.x = super.simpleButton.x;
         rect.y = super.simpleButton.y;
         rect.width = super.simpleButton.width;
         rect.height = super.simpleButton.height;
         return rect;
      }
      
      public function getSkin() : Dictionary
      {
         var skin:Dictionary = new Dictionary(true);
         skin.simpleButton = super.simpleButton;
         skin.disabledState = super.disabledState;
         return skin;
      }
      
      public function getMouseHotTarget() : SimpleButton
      {
         return super.simpleButton;
      }
   }
}

