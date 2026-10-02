package com.aurora.ui.maogoutd.component.scrollBar
{
   import a_4802.ScrollBar;
   import a_4802.a_4706;
   
   public class a_3281 extends ScrollBar
   {
      
      public function a_3281(id:String = "default", ScrollThumb_A:String = null, ScrollThumb_B:String = null, ScrollThumb_C:String = null, ScrollThumb_D:String = null, ScrollTrack:String = null, ScrollArrowDown:String = null, ScrollArrowUp:String = null)
      {
         var scrollBarSkin:a_4706 = a_3282.create();
         super(scrollBarSkin,"v");
         this.hidden = false;
      }
   }
}

