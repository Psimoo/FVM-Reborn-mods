package com.aurora.ui.maogoutd.marriage
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   
   public class DefineMarriageCertificateOperation
   {
      
      public static const REPLY_AGREE:uint = 0;
      
      public static const REPLY_REFUSE:uint = 1;
      
      public static const NONE:uint = 0;
      
      public static const CS_INVITE:uint = 1;
      
      public static const CS_REPLY_INVITE:uint = 2;
      
      public static const CS_LEAVE_ROOM:uint = 3;
      
      public static const CS_CHANGE_CERTIFICATE:uint = 4;
      
      public static const CS_CHANGE_DECLARATION:uint = 5;
      
      public static const CS_AGREE_MARRIAGE:uint = 6;
      
      public static const CS_CREATE_MARRIAGE_ROOM:uint = 7;
      
      public static const CS_NEGOTIATION_DIVORCE:uint = 8;
      
      public static const CS_ANSWER_NEGOTIATION:uint = 9;
      
      public static const CS_FORCE_DIVORCE:uint = 16;
      
      public static const SC_BE_INVITED:uint = 129;
      
      public static const SC_ROOM_INFO:uint = 130;
      
      public static const SC_LEAVE_ROOM:uint = 131;
      
      public static const SC_CHANGE_CERTIFICATE:uint = 132;
      
      public static const SC_CHANGE_DECLARATION:uint = 133;
      
      public static const SC_AGREE_MARRIAGE:uint = 134;
      
      public static const SC_MARRIAGE_RESULT:uint = 135;
      
      public static const SC_NEGOTIATION_DIVORCE:uint = 136;
      
      public static const SC_ANSWER_NEGOTIATION:uint = 137;
      
      public static const SC_FORCE_DIVORCE:uint = 144;
      
      public static const SC_REFUSE_INVITE:uint = 145;
      
      public static const SC_CREATER_MARRIED:uint = 146;
      
      public static const SC_INVITED_MARRIED:uint = 147;
      
      public static const SC_CERTIFICATE_NOT_FOUND:uint = 148;
      
      public static const DECLARATION_MAX_CHAR:int = 32;
      
      public static const DECLARATION_RESTRICT:String = "^[\\\\]";
      
      public static const PASSWORD_MAX_CHAR:int = 12;
      
      public static const PASSWORD_RESTRICT:String = "a-zA-Z0-9";
      
      public function DefineMarriageCertificateOperation()
      {
         super();
      }
      
      public static function RequestMarriageCertificateOperation(iOperateType:int, arrValue:Array = null, strInfo:String = "", iUin:int = -1) : void
      {
         if(-1 == iUin)
         {
            iUin = (a_2161.e.GetCurrentRole() as a_4463).m_iRoleUin;
         }
         a_2161.e.notify("onRequestMarriageCertificateOperation",iUin,iOperateType,arrValue,strInfo);
      }
      
      public static function FormatItems(avatarItemsContent:String) : Array
      {
         var arrItemContent:Array = null;
         var itemContent:String = null;
         var heroItem:a_4461 = null;
         var arrHeroItemID:Array = [];
         if(avatarItemsContent != null)
         {
            arrItemContent = avatarItemsContent.split("|");
            for each(itemContent in arrItemContent)
            {
               if(itemContent != null && itemContent.length > 0)
               {
                  heroItem = new a_4461();
                  heroItem.format(itemContent);
                  arrHeroItemID.push(heroItem);
               }
            }
         }
         return arrHeroItemID;
      }
   }
}

