package a_4754
{
   import a_4739.a_1828;
   import com.aurora.ui.maogoutd.component.DefCard;
   import com.aurora.ui.maogoutd.component.PropsCard;
   import flash.display.Sprite;
   
   public class a_2142 extends a_1828
   {
      
      public static var e:a_2142 = new a_2142();
      
      public function a_2142()
      {
         super();
      }
      
      public function onClickPropsCardMoveOut(propsCard:PropsCard) : void
      {
         notify("onClickPropsCardMoveOut",propsCard);
      }
      
      public function onClickPropsCardMoveIn(propsCard:PropsCard) : void
      {
         notify("onClickPropsCardMoveIn",propsCard);
      }
      
      public function onClickDefCardMoveOut(defCard:DefCard) : void
      {
         notify("onClickDefCardMoveOut",defCard);
      }
      
      public function onClickDefCardMoveIn(defCard:DefCard) : void
      {
         notify("onClickDefCardMoveIn",defCard);
      }
      
      public function onClickEquipmentCardMoveOut(propsCard:PropsCard) : void
      {
         notify("onClickEquipmentCardMoveOut",propsCard);
      }
      
      public function onClickEquipmentCardMoveIn(propsCard:PropsCard) : void
      {
         notify("onClickEquipmentCardMoveIn",propsCard);
      }
      
      public function onCardMoveInPackage(card:Sprite) : void
      {
         notify("onCardMoveInPackage",card);
      }
      
      public function onShowPropsCardMoveTip(propsCard:PropsCard) : void
      {
         notify("onShowPropsCardMoveTip",propsCard);
      }
      
      public function onHidePropsCardMoveTip(propsCard:PropsCard) : void
      {
         notify("onHidePropsCardMoveTip",propsCard);
      }
      
      public function onUsePropsCard(propsCard:PropsCard) : void
      {
         notify("onUsePropsCard",propsCard);
      }
   }
}

