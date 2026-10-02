package com.aurora.ui.maogoutd.game
{
   import a_4724.PlayerDetailInfo;
   import com.aurora.ui.maogoutd.bluediamond.BlueDiamondInfo;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class UserInfoPanelView extends Sprite
   {
      
      public var m_stMyUserInfo:MyUserInfoView;
      
      public var m_stTeammateUserInfo:TeammateUserInfoView;
      
      public var m_stEnemyUserInfo1:EnemyUserInfoView;
      
      public var m_stEnemyUserInfo2:EnemyUserInfoView;
      
      public var m_stSmallMapDetailInfo:Sprite;
      
      public var m_stSmallGameDetailInfoMap:a_3574;
      
      public var m_stSwitchBattleButton:SimpleButton;
      
      public var m_stSwitchBattleButtonMovie:MovieClip;
      
      public var m_stPosSwitchLine:Sprite;
      
      public var m_stSwitchIntoButton:SimpleButton;
      
      public var m_stSwitchOutButton:SimpleButton;
      
      public function UserInfoPanelView()
      {
         super();
         cacheAsBitmap = true;
         this.m_stMyUserInfo.m_stLevelMovie.gotoAndStop(1);
         this.m_stMyUserInfo.m_stUserNameText.text = "测试1";
         this.m_stTeammateUserInfo.m_stLevelMovie.gotoAndStop(1);
         this.m_stTeammateUserInfo.m_stUserNameText.text = "测试2";
         this.m_stEnemyUserInfo1.m_stLevelMovie.gotoAndStop(1);
         this.m_stEnemyUserInfo1.m_stUserNameText.text = "测试3";
         this.m_stEnemyUserInfo2.m_stLevelMovie.gotoAndStop(1);
         this.m_stEnemyUserInfo2.m_stUserNameText.text = "测试4";
         this.m_stSmallGameDetailInfoMap = new a_3574();
         this.m_stSmallGameDetailInfoMap.x = 6;
         this.m_stSmallGameDetailInfoMap.y = 20;
         this.m_stPosSwitchLine.visible = false;
         this.m_stSwitchIntoButton.visible = false;
         this.m_stSwitchOutButton.visible = false;
         this.m_stSwitchIntoButton.addEventListener(MouseEvent.CLICK,this.a_3586);
         this.m_stSwitchOutButton.addEventListener(MouseEvent.CLICK,this.a_3587);
      }
      
      private function updateInfo(backArr:Array) : void
      {
         if(Boolean(backArr) && Boolean(backArr.length > 0) && backArr[0].is_blue_vip != "0")
         {
            if(backArr[0].uin == this.m_stMyUserInfo.m_iUin)
            {
               if(backArr[0].is_blue_year_vip != "0")
               {
                  if(backArr[0].is_super_blue_vip != "0")
                  {
                     this.m_stMyUserInfo.showBlueDiamond(2,backArr[0].blue_vip_level,true);
                  }
                  else
                  {
                     this.m_stMyUserInfo.showBlueDiamond(1,backArr[0].blue_vip_level,true);
                  }
                  this.m_stMyUserInfo.m_stUserNameText.x = 17;
               }
               else
               {
                  if(backArr[0].is_super_blue_vip != "0")
                  {
                     this.m_stMyUserInfo.showBlueDiamond(2,backArr[0].blue_vip_level,false);
                  }
                  else
                  {
                     this.m_stMyUserInfo.showBlueDiamond(1,backArr[0].blue_vip_level,false);
                  }
                  this.m_stMyUserInfo.m_stUserNameText.x = 10;
               }
            }
            else if(backArr[0].uin == this.m_stTeammateUserInfo.m_iUin)
            {
               if(backArr[0].is_blue_year_vip != "0")
               {
                  if(backArr[0].is_super_blue_vip != "0")
                  {
                     this.m_stTeammateUserInfo.showBlueDiamond(2,backArr[0].blue_vip_level,true);
                  }
                  else
                  {
                     this.m_stTeammateUserInfo.showBlueDiamond(1,backArr[0].blue_vip_level,true);
                  }
                  this.m_stTeammateUserInfo.m_stUserNameText.x = 17;
               }
               else
               {
                  if(backArr[0].is_super_blue_vip != "0")
                  {
                     this.m_stTeammateUserInfo.showBlueDiamond(2,backArr[0].blue_vip_level,false);
                  }
                  else
                  {
                     this.m_stTeammateUserInfo.showBlueDiamond(1,backArr[0].blue_vip_level,false);
                  }
                  this.m_stTeammateUserInfo.m_stUserNameText.x = 10;
               }
            }
         }
         else
         {
            this.m_stMyUserInfo.m_stUserNameText.x = 0;
            this.m_stTeammateUserInfo.m_stUserNameText.x = 0;
            this.m_stMyUserInfo.showBlueDiamond(0);
            this.m_stTeammateUserInfo.showBlueDiamond(0);
         }
      }
      
      public function a_3585(arrPlayerDetails:Array) : Boolean
      {
         var iPlayerCount:int = 0;
         this.m_stSmallGameDetailInfoMap.x = 6;
         this.m_stSmallGameDetailInfoMap.y = 20;
         iPlayerCount = 0;
         var stPlayerDetail:PlayerDetailInfo = arrPlayerDetails[0] as PlayerDetailInfo;
         var iLevel:int = 0;
         var szPlayerName:String = "^_^";
         if(stPlayerDetail != null)
         {
            iPlayerCount++;
            iLevel = stPlayerDetail.m_byLevel;
            if(stPlayerDetail.m_szPlayerName)
            {
               szPlayerName = stPlayerDetail.m_szPlayerName;
            }
            this.m_stMyUserInfo.m_iUin = stPlayerDetail.m_iUin;
            this.updateInfo(BlueDiamondInfo.getInstance().GetBlueDiamondInfo([stPlayerDetail.m_iUin],this.updateInfo));
            this.m_stMyUserInfo.visible = true;
         }
         else
         {
            this.m_stMyUserInfo.visible = false;
         }
         this.m_stMyUserInfo.m_stLevelMovie.gotoAndStop(iLevel);
         this.m_stMyUserInfo.m_stUserNameText.text = szPlayerName;
         stPlayerDetail = arrPlayerDetails[1] as PlayerDetailInfo;
         if(stPlayerDetail != null)
         {
            iPlayerCount++;
            iLevel = stPlayerDetail.m_byLevel;
            if(stPlayerDetail.m_szPlayerName)
            {
               szPlayerName = stPlayerDetail.m_szPlayerName;
            }
            this.m_stTeammateUserInfo.m_iUin = stPlayerDetail.m_iUin;
            this.updateInfo(BlueDiamondInfo.getInstance().GetBlueDiamondInfo([stPlayerDetail.m_iUin],this.updateInfo));
            this.m_stTeammateUserInfo.visible = true;
            this.m_stTeammateUserInfo.y = 1 + 90 * (iPlayerCount - 1);
         }
         else
         {
            this.m_stTeammateUserInfo.visible = false;
         }
         this.m_stTeammateUserInfo.m_stLevelMovie.gotoAndStop(iLevel);
         this.m_stTeammateUserInfo.m_stUserNameText.text = szPlayerName;
         this.m_stSwitchBattleButton.visible = false;
         this.m_stSmallMapDetailInfo.visible = false;
         stPlayerDetail = arrPlayerDetails[2] as PlayerDetailInfo;
         if(stPlayerDetail != null)
         {
            iPlayerCount++;
            iLevel = stPlayerDetail.m_byLevel;
            if(stPlayerDetail.m_szPlayerName)
            {
               szPlayerName = stPlayerDetail.m_szPlayerName;
            }
            this.m_stEnemyUserInfo1.visible = true;
            this.m_stEnemyUserInfo1.y = 1 + 90 * (iPlayerCount - 1);
            this.m_stSwitchBattleButton.visible = true;
         }
         else
         {
            this.m_stEnemyUserInfo1.visible = false;
         }
         this.m_stEnemyUserInfo1.m_stLevelMovie.gotoAndStop(iLevel);
         this.m_stEnemyUserInfo1.m_stUserNameText.text = szPlayerName;
         stPlayerDetail = arrPlayerDetails[3] as PlayerDetailInfo;
         if(stPlayerDetail != null)
         {
            iPlayerCount++;
            iLevel = stPlayerDetail.m_byLevel;
            if(stPlayerDetail.m_szPlayerName)
            {
               szPlayerName = stPlayerDetail.m_szPlayerName;
            }
            this.m_stEnemyUserInfo2.visible = true;
            this.m_stEnemyUserInfo2.y = 1 + 90 * (iPlayerCount - 1);
            this.m_stSwitchBattleButton.visible = true;
         }
         else
         {
            this.m_stEnemyUserInfo2.visible = false;
         }
         this.m_stEnemyUserInfo2.m_stLevelMovie.gotoAndStop(iLevel);
         this.m_stEnemyUserInfo2.m_stUserNameText.text = szPlayerName;
         if(null != arrPlayerDetails[1])
         {
         }
         if(null != arrPlayerDetails[2])
         {
            if(null != arrPlayerDetails[3])
            {
               this.m_stSmallMapDetailInfo.y = this.m_stEnemyUserInfo2.y + this.m_stEnemyUserInfo2.height + 0;
               this.m_stSwitchBattleButton.y = this.m_stSmallMapDetailInfo.y;
            }
            else
            {
               this.m_stSmallMapDetailInfo.y = this.m_stEnemyUserInfo1.y + this.m_stEnemyUserInfo1.height + 0;
               this.m_stSwitchBattleButton.y = this.m_stSmallMapDetailInfo.y;
            }
         }
         this.m_stPosSwitchLine.visible = false;
         this.m_stSwitchIntoButton.visible = false;
         this.m_stSwitchOutButton.visible = false;
         this.m_stSwitchBattleButton.visible = false;
         return true;
      }
      
      public function a_3479() : void
      {
         this.m_stPosSwitchLine.visible = true;
         this.m_stSwitchOutButton.visible = true;
         x = -this.m_stMyUserInfo.width;
         y = 100;
      }
      
      private function a_3586(stEvent:Event) : void
      {
         this.m_stSwitchIntoButton.visible = false;
         this.m_stSwitchOutButton.visible = true;
         x = -this.m_stMyUserInfo.width;
      }
      
      private function a_3587(stEvent:Event) : void
      {
         this.m_stSwitchIntoButton.visible = true;
         this.m_stSwitchOutButton.visible = false;
         x = 0;
      }
   }
}

