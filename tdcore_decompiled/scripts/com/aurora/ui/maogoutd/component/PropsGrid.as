package com.aurora.ui.maogoutd.component
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class PropsGrid extends Sprite
   {
      
      private var m_isOpen:Boolean;
      
      private var m_isFull:Boolean;
      
      public var closeGridBg:MovieClip;
      
      public var alreadymc:MovieClip;
      
      public function PropsGrid()
      {
         super();
         this.m_isOpen = false;
         this.m_isFull = false;
         this.alreadymc.visible = false;
         this.closeGridBg.visible = false;
         this.doubleClickEnabled = true;
      }
      
      public function get isOpen() : Boolean
      {
         return this.m_isOpen;
      }
      
      public function set isOpen(isOpen:Boolean) : void
      {
         this.m_isOpen = isOpen;
      }
      
      public function get isFull() : Boolean
      {
         return this.m_isFull;
      }
      
      public function set isFull(isFull:Boolean) : void
      {
         this.m_isFull = isFull;
      }
      
      public function showPropsGridBg(image:Bitmap) : void
      {
         var bitmap:Bitmap = null;
         if(image != null && image.bitmapData != null)
         {
            this.m_isOpen = false;
            bitmap = new Bitmap(image.bitmapData.clone());
            if(bitmap.width > 50)
            {
               bitmap.scaleX = 0.6;
               bitmap.scaleY = 0.6;
            }
            this.closeGridBg.addChild(bitmap);
            this.closeGridBg.visible = true;
            bitmap.alpha = 0.4;
            this.alreadymc.visible = true;
         }
         else
         {
            this.alreadymc.visible = false;
            this.m_isOpen = true;
            this.closeGridBg.visible = false;
            while(this.closeGridBg.numChildren > 0)
            {
               this.closeGridBg.removeChildAt(0);
            }
         }
      }
   }
}

