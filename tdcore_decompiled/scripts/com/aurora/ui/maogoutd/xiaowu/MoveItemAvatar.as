package com.aurora.ui.maogoutd.xiaowu
{
   import com.aurora.ui.maogoutd.component.UserSmallAvatar;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   
   public class MoveItemAvatar extends MoveItem
   {
      
      private var m_stPlayerAvatar:UserSmallAvatar;
      
      public function MoveItemAvatar()
      {
         super();
         m_RoleNameText.visible = true;
         m_RoleNameText.width = 110.5;
         m_RoleNameText.mouseEnabled = false;
         this.m_stPlayerAvatar = new UserSmallAvatar();
         this.m_CardDemo.addChild(this.m_stPlayerAvatar);
         m_RectMask.y = m_CardDemo.height - m_RectMask.height + 30;
         m_RectMask.x = (m_CardDemo.width - m_RectMask.width) / 2;
         m_Shadow.visible = true;
         m_Shadow.scaleX = m_Shadow.scaleY = 1.3;
         m_Shadow.y = m_CardDemo.y + m_CardDemo.height - 25;
         m_Shadow.x = (m_CardDemo.width - m_Shadow.width) / 2 + 4;
         this.m_bmpImage.visible = false;
      }
      
      public function a_3898(RoleName:String, arrHeroItemID:Array, iUserSex:int, iSuitShowType:int) : void
      {
         var display:DisplayObject = null;
         m_RoleNameText.text = RoleName;
         this.m_stPlayerAvatar.visible = true;
         this.m_stPlayerAvatar.m_iUserSex = iUserSex;
         this.m_stPlayerAvatar.showUserAvatar(arrHeroItemID,0,iSuitShowType);
         var num:int = this.m_stPlayerAvatar.numChildren;
         for(var index:int = 0; index < num; index++)
         {
            display = this.m_stPlayerAvatar.getChildAt(index);
            if(display as Bitmap)
            {
               (display as Bitmap).smoothing = true;
            }
         }
      }
   }
}

