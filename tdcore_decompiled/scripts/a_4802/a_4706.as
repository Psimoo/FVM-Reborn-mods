package a_4802
{
   import a_4790.*;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class a_4706 extends Sprite
   {
      
      private var _value:Number;
      
      private var _skin:Dictionary;
      
      public function a_4706(ArrowDown:Dictionary, ArrowUp:Dictionary, Thumb:Dictionary, Track:Dictionary)
      {
         super();
         this._skin = new Dictionary(true);
         this.scrollTrackSkin = Track;
         this.scrollArrowDownSkin = ArrowDown;
         this.scrollArrowUpSkin = ArrowUp;
         this.scrollThumbSkin = Thumb;
         this.init();
      }
      
      public function set scrollArrowDownSkin(sk:Dictionary) : void
      {
         if(this._skin.scrollArrowDown == undefined)
         {
            this._skin.scrollArrowDown = a_4660.create(sk.upState,sk.overState,sk.downState,sk.disabledState);
            addChild(this._skin.scrollArrowDown);
         }
         else
         {
            this._skin.scrollArrowDown.setSkin(sk);
         }
      }
      
      public function get scrollArrowDown() : a_4659
      {
         return this._skin.scrollArrowDown;
      }
      
      public function set scrollArrowUpSkin(sk:Dictionary) : void
      {
         if(this._skin.scrollArrowUp == undefined)
         {
            this._skin.scrollArrowUp = a_4660.create(sk.upState,sk.overState,sk.downState,sk.disabledState);
            addChild(this._skin.scrollArrowUp);
         }
         else
         {
            this._skin.scrollArrowUp.setSkin(sk);
         }
      }
      
      public function get scrollArrowUp() : a_4659
      {
         return this._skin.scrollArrowUp;
      }
      
      public function set scrollThumbSkin(sk:Dictionary) : void
      {
         if(this._skin.scrollThumb == undefined)
         {
            this._skin.scrollThumb = new a_4707(sk);
            addChild(this._skin.scrollThumb.thumb);
         }
         else
         {
            this._skin.scrollThumb.thumbSkin = sk;
         }
      }
      
      public function get scrollThumb() : a_4707
      {
         return this._skin.scrollThumb;
      }
      
      public function set scrollTrackSkin(sk:Dictionary) : void
      {
         if(this._skin.scrollTrack == undefined)
         {
            this._skin.scrollTrack = a_4660.create(sk.upState,sk.overState,sk.downState,sk.disabledState);
            addChild(this._skin.scrollTrack);
         }
         else
         {
            this._skin.scrollTrack.setSkin(sk);
         }
      }
      
      public function get scrollTrack() : a_4659
      {
         return this._skin.scrollTrack;
      }
      
      public function get whValue() : Number
      {
         return this._value;
      }
      
      public function set whValue(v:Number) : void
      {
         this._value = v;
      }
      
      protected function init() : void
      {
      }
   }
}

