package com.aurora.ui.maogoutd.pag
{
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_2142;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.component.PropsCard;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class UseSkillBook extends Sprite
   {
      
      private static var usedCard:PropsCard;
      
      private static var _num:int;
      
      public var SureBtn:SimpleButton;
      
      public var CancleBtn:SimpleButton;
      
      public var MaxBtn:SimpleButton;
      
      public var inputNum:TextField;
      
      public var bookName:TextField;
      
      public var maxNumText:TextField;
      
      private var maxNum:int;
      
      private var cardId:int;
      
      private var usedCardArray:Array;
      
      public function UseSkillBook()
      {
         super();
         this.usedCardArray = null;
         this.maxNum = 0;
         this.cardId = 0;
         this.inputNum.text = "0";
         this.bookName.text = "";
         this.SureBtn.addEventListener(MouseEvent.CLICK,this.onSure);
         this.CancleBtn.addEventListener(MouseEvent.CLICK,this.onCancle);
         this.MaxBtn.addEventListener(MouseEvent.CLICK,this.onMax);
         this.inputNum.restrict = "0-9";
         this.inputNum.addEventListener(Event.CHANGE,this.onInput);
      }
      
      private function onInput(e:Event) : void
      {
         if(this.inputNum.text == null || this.inputNum.text == "")
         {
            this.inputNum.text = "0";
         }
         if(int(this.inputNum.text) > this.maxNum)
         {
            this.inputNum.text = this.maxNum.toString();
            MessageTipHandler.Get().a_3146("使用数量超出限制");
         }
      }
      
      private function onMax(e:Event) : void
      {
         this.inputNum.text = this.maxNum.toString();
      }
      
      private function onSure(e:Event) : void
      {
         var tipText:ITDMessageTip = null;
         var text:String = this.inputNum.text;
         var num:int = int(text);
         if(num > 0)
         {
            if(num > 50)
            {
               tipText = a_2155.e.GetMessageTip() as ITDMessageTip;
               tipText.showTextTip(stage,"技能书一次最多使用50本",new Rectangle());
            }
            else
            {
               removeChild(usedCard);
               if((usedCard.cardAttr.CardID & 0xFFF00000) == 304087040)
               {
                  _num = num - 1;
                  a_2142.e.onUsePropsCard(usedCard);
                  a_1789.getInstance().addEventListener(EventType.UseSkillBook,this.OnUseCard);
               }
               else
               {
                  _num = num - 1;
                  usedCard = new PropsCard(this.usedCardArray[_num] as a_3228);
                  a_2142.e.onUsePropsCard(usedCard);
                  a_1789.getInstance().addEventListener(EventType.OnceKeyOpen,this.OnUseCard);
               }
            }
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      private function onCancle(e:Event) : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
         removeChild(usedCard);
         usedCard = null;
      }
      
      public function setSkillBook(card:PropsCard) : void
      {
         this.inputNum.text = "1";
         this.cardId = card.cardAttr.CardID;
         this.maxNum = 0;
         this.usedCardArray = this.getUsedCardArray(this.cardId);
         this.maxNumText.text = this.maxNum.toString();
         if(this.maxNum > 50)
         {
            this.maxNum = 50;
         }
         this.bookName.text = card.cardAttr.Name;
         var tmpAttr:a_3228 = card.cardAttr.clone();
         tmpAttr.CardCount = 1;
         usedCard = new PropsCard(tmpAttr);
         usedCard.Image = card.cloneImage();
         usedCard.x = 96.2;
         usedCard.y = 171.2;
         addChild(usedCard);
      }
      
      private function OnUseCard(e:a_1778) : void
      {
         if(e == null)
         {
            return;
         }
         if(e.dataObject.m_nResultID == 0)
         {
            if(_num > 0)
            {
               --_num;
               usedCard = new PropsCard(this.usedCardArray[_num] as a_3228);
               if(usedCard != null)
               {
                  a_2142.e.onUsePropsCard(usedCard);
               }
               else
               {
                  this.removeLoopListener();
               }
            }
            else
            {
               MessageTipHandler.Get().a_3146("使用完成");
               this.removeLoopListener();
            }
         }
         else
         {
            this.removeLoopListener();
         }
      }
      
      private function removeLoopListener() : void
      {
         this.usedCardArray = null;
         usedCard = null;
         this.maxNum = 0;
         _num = 0;
         if(a_1789.getInstance().hasEventListener(EventType.UseSkillBook))
         {
            a_1789.getInstance().removeEventListener(EventType.UseSkillBook,this.OnUseCard);
         }
         if(a_1789.getInstance().hasEventListener(EventType.a_605))
         {
            a_1789.getInstance().removeEventListener(EventType.OnceKeyOpen,this.OnUseCard);
         }
      }
      
      private function getUsedCardArray(cardId:int) : Array
      {
         var i:int = 0;
         var attr:a_3228 = null;
         var j:int = 0;
         var resArray:Array = new Array();
         var vTDCard:Array = a_2161.e.GetTDCardsInfo() as Array;
         for(var type:int = 0; type < 3; type++)
         {
            for(i = 0; i < vTDCard[type].length; i++)
            {
               attr = vTDCard[type][i] as a_3228;
               if(attr.CardID == cardId)
               {
                  for(j = 0; j < attr.CardCount; j++)
                  {
                     if(resArray.length < 55)
                     {
                        resArray.push(attr);
                     }
                     ++this.maxNum;
                  }
               }
            }
         }
         return resArray;
      }
   }
}

