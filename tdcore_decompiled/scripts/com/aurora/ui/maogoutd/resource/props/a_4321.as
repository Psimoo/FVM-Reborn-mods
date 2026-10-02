package com.aurora.ui.maogoutd.resource.props
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   
   public class a_4321 extends Sprite implements IBaseProp
   {
      
      protected var effectClass:Class;
      
      protected var buttonClass:Class;
      
      protected var m_iGamePropID:int;
      
      protected var a_1557:int;
      
      protected var a_1558:EffectObjectValue;
      
      protected var a_1559:Array = [];
      
      protected var a_1560:Array = [];
      
      public function a_4321()
      {
         super();
      }
      
      public function a_4322() : int
      {
         return this.m_iGamePropID;
      }
      
      public function a_4323(iGamePropID:int) : void
      {
         this.m_iGamePropID = iGamePropID;
      }
      
      public function a_4324() : int
      {
         return this.a_1557;
      }
      
      public function a_4325(iGamePropSequence:int) : void
      {
         this.a_1557 = iGamePropSequence;
      }
      
      public function a_4326() : Sprite
      {
         var stDispButton:PropDisplayButton = null;
         stDispButton = this.a_1559.pop();
         if(null == stDispButton)
         {
            if(this.buttonClass != null)
            {
               stDispButton = new this.buttonClass();
            }
            else
            {
               stDispButton = new PropDisplayButton();
            }
            stDispButton.m_stBaseProp = this;
         }
         stDispButton.visible = true;
         return stDispButton;
      }
      
      public function a_4327() : MovieClip
      {
         var stPropUseDisplayEffect:MovieClip = this.a_1560.pop();
         if(null == stPropUseDisplayEffect)
         {
            if(this.effectClass != null)
            {
               stPropUseDisplayEffect = new this.effectClass();
            }
            else
            {
               stPropUseDisplayEffect = new a_4341();
            }
         }
         setTimeout(this.a_4330,4000,stPropUseDisplayEffect);
         return stPropUseDisplayEffect;
      }
      
      public function a_4328() : EffectObjectValue
      {
         return this.a_1558;
      }
      
      public function a_4329(stPropDisplayButton:Sprite) : void
      {
         if(Boolean(stPropDisplayButton) && -1 == this.a_1559.indexOf(stPropDisplayButton))
         {
            this.a_1559.push(stPropDisplayButton);
            stPropDisplayButton.visible = false;
            if(Boolean(stPropDisplayButton.parent) && stPropDisplayButton.parent.contains(stPropDisplayButton))
            {
               stPropDisplayButton.parent.removeChild(stPropDisplayButton);
            }
         }
      }
      
      private function a_4330(stMovieClip:MovieClip) : void
      {
         stMovieClip.stop();
         if(Boolean(stMovieClip.parent) && stMovieClip.parent.contains(stMovieClip))
         {
            stMovieClip.parent.removeChild(stMovieClip);
         }
         if(-1 == this.a_1560.indexOf(stMovieClip))
         {
            this.a_1560.push(stMovieClip);
         }
      }
   }
}

