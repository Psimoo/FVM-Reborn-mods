package com.aurora.ui.maogoutd.compose
{
   import a_4781.Tool;
   import com.aurora.ui.maogoutd.component.PropsCard;
   import com.aurora.ui.maogoutd.pag.a_3871;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class PopPropsCardPackage extends Sprite
   {
      
      public var prev_btn:SimpleButton;
      
      public var next_btn:SimpleButton;
      
      public var ref_mc:MovieClip;
      
      public var mask_mc:MovieClip;
      
      private var propsPackage:a_3871;
      
      private const PAGE_SIZE:int = 10;
      
      private const MAX_NUM_GRID:int = 150;
      
      private var startIndex:int = 0;
      
      private var gridSize:Number = 49;
      
      private var maxStartIndex:int;
      
      public function PopPropsCardPackage()
      {
         super();
         this.init();
      }
      
      public function getPackage() : a_3871
      {
         return this.propsPackage;
      }
      
      public function getUniqueCards() : Array
      {
         var propsCard:PropsCard = null;
         var card:PropsCard = null;
         var srcArray:Array = this.propsPackage.getAllPropsCard();
         var arrCards:Array = [];
         var dictCards:Dictionary = new Dictionary();
         for each(propsCard in srcArray)
         {
            if(dictCards[propsCard.cardAttr.CardID] == null)
            {
               dictCards[propsCard.cardAttr.CardID] = propsCard;
            }
         }
         for each(card in dictCards)
         {
            arrCards.push(card);
         }
         return arrCards;
      }
      
      public function GetCrystalRecipes() : Array
      {
         return [];
      }
      
      private function init() : void
      {
         this.ref_mc.width = this.gridSize * this.MAX_NUM_GRID;
         this.propsPackage = new a_3871();
         this.addChildAt(this.propsPackage,1);
         this.propsPackage.showCardPackage(this.ref_mc);
         this.propsPackage.setSize(this.MAX_NUM_GRID,this.MAX_NUM_GRID,1);
         this.propsPackage.mask = this.mask_mc;
         this.removeChild(this.ref_mc);
      }
      
      public function updateData() : void
      {
         this.propsPackage.x = this.ref_mc.x;
         this.startIndex = 0;
         Tool.setEnabled(this.prev_btn,null,this,false);
         if(this.prev_btn.hasEventListener(MouseEvent.CLICK))
         {
            this.prev_btn.removeEventListener(MouseEvent.CLICK,this.prevHandler);
         }
         this.maxStartIndex = this.propsPackage.getAllPropsCard().length - this.PAGE_SIZE;
         if(this.maxStartIndex > 0)
         {
            Tool.setEnabled(this.next_btn,null,this,true);
            this.next_btn.addEventListener(MouseEvent.CLICK,this.nextHandler);
         }
         else
         {
            Tool.setEnabled(this.next_btn,null,this,false);
            this.next_btn.removeEventListener(MouseEvent.CLICK,this.nextHandler);
         }
      }
      
      private function prevHandler(a_4730:MouseEvent) : void
      {
         if(this.startIndex > 0)
         {
            --this.startIndex;
            if(this.startIndex == 0)
            {
               Tool.setEnabled(this.prev_btn,null,this,false);
               this.prev_btn.removeEventListener(MouseEvent.CLICK,this.prevHandler);
            }
            if(this.startIndex == this.maxStartIndex - 1)
            {
               Tool.setEnabled(this.next_btn,null,this,true);
               this.next_btn.addEventListener(MouseEvent.CLICK,this.nextHandler);
            }
            this.propsPackage.x += this.gridSize;
         }
      }
      
      private function nextHandler(a_4730:MouseEvent) : void
      {
         if(this.startIndex < this.maxStartIndex)
         {
            ++this.startIndex;
            if(this.startIndex == this.maxStartIndex)
            {
               Tool.setEnabled(this.next_btn,null,this,false);
               this.next_btn.removeEventListener(MouseEvent.CLICK,this.nextHandler);
            }
            if(this.startIndex == 1)
            {
               Tool.setEnabled(this.prev_btn,null,this,true);
               this.prev_btn.addEventListener(MouseEvent.CLICK,this.prevHandler);
            }
            this.propsPackage.x -= this.gridSize;
         }
      }
   }
}

