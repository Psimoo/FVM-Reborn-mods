package com.aurora.ui.maogoutd.game.Util
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.GameCardView;
   
   public class BattleCardUtil
   {
      
      private static var arrLineCards:Array = [286402672,286402686,286402687];
      
      public function BattleCardUtil()
      {
         super();
      }
      
      public static function LockCard(stGameCardView:GameCardView) : void
      {
         if(stGameCardView == null)
         {
            return;
         }
         a_2036.getInstance().tagCom.AddTag(300 + stGameCardView.cardIndex);
         stGameCardView.stGrowTimer.stop();
         stGameCardView.a_3513();
         stGameCardView.iGrowTimes = 1;
         stGameCardView.a_3517();
      }
      
      public static function UnLockLeftestCard(battleView:BattleFieldView, num:int = 3) : void
      {
         var count:int = 0;
         for(var i:int = 0; i < BattleCardDefine.MAX_HAND_CARD_NUM; i++)
         {
            if(UnLockCard(battleView.GetGameCardViewByIndex(i)))
            {
               count++;
            }
            if(count >= num)
            {
               break;
            }
         }
      }
      
      public static function UnLockAllCard(battleView:BattleFieldView) : void
      {
         for(var i:int = 0; i < BattleCardDefine.MAX_HAND_CARD_NUM; i++)
         {
            UnLockCard(battleView.GetGameCardViewByIndex(i));
         }
      }
      
      public static function UnLockCard(stGameCardView:GameCardView) : Boolean
      {
         if(stGameCardView == null)
         {
            return false;
         }
         if(a_2036.getInstance().tagCom.HasTag(300 + stGameCardView.cardIndex))
         {
            a_2036.getInstance().tagCom.RemoveTag(300 + stGameCardView.cardIndex);
            stGameCardView.iGrowTimes = 0;
            stGameCardView.a_3514();
            return true;
         }
         return false;
      }
      
      public static function IsQiaotouRiceNoodles(cardId:uint) : Boolean
      {
         return false;
      }
   }
}

