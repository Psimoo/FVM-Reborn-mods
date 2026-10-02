package com.aurora.ui.maogoutd.xiaowu
{
   import a_4752.GameStringManager;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.tip.TipBG;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class SmallRoomCardTip extends Sprite
   {
      
      public var nameText:TextField;
      
      public var TypeText:TextField;
      
      public var DescText0:TextField;
      
      public var DescText1:TextField;
      
      public var TimeText:TextField;
      
      public var tipbg:TipBG;
      
      public var bindmc:MovieClip;
      
      public function SmallRoomCardTip()
      {
         super();
         this.bindmc.gotoAndStop(1);
         this.TimeText.text = GameStringManager.getInstance().getString(132448);
         this.tipbg.setSize(0,0,267,185);
      }
      
      public function showCardTip(CardID:int, attr:a_3228) : void
      {
         var vo:ItemConfigVO = SmallRoomConfig.Get().m_dictDesc[CardID];
         if(vo != null)
         {
            this.nameText.text = vo.m_iItemName;
            this.TypeText.text = this.getType(vo.m_ItemType);
            this.DescText0.text = vo.m_iItemDesc;
            this.DescText1.text = "增加舒适度 " + vo.m_iItemComfort + " 点";
         }
      }
      
      private function getType(type:int) : String
      {
         switch(type)
         {
            case 1:
               return "家具";
            case 2:
               return "墙饰";
            case 3:
               return "主题";
            case 4:
               return "卡片";
            default:
               return "";
         }
      }
   }
}

