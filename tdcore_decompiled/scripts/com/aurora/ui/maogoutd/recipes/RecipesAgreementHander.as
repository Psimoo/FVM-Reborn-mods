package com.aurora.ui.maogoutd.recipes
{
   import a_4754.a_2161;
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesMenuListItemStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesOpenRuleStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructAvtiveResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructComposeInfo;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructComposeResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructGetInfoResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructRecipesActive;
   import com.aurora.ui.maogoutd.role.a_4463;
   
   public class RecipesAgreementHander
   {
      
      private static var m_Instacne:RecipesAgreementHander = new RecipesAgreementHander();
      
      public function RecipesAgreementHander()
      {
         super();
         if(m_Instacne)
         {
            return;
         }
         a_4657.getInstance().addListener(this);
      }
      
      public static function GetInstance() : RecipesAgreementHander
      {
         return m_Instacne;
      }
      
      public function RecipesCompose(stComposeInfo:RecipesStructComposeInfo) : void
      {
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         stComposeInfo.m_iUIN = role.m_iRoleUin;
         a_2161.e.RequestRecipesCompose(stComposeInfo);
      }
      
      public function ResponseRecipesCompose(stRecipesCompose:RecipesStructComposeResponse) : void
      {
         if(0 != stRecipesCompose.m_nResult)
         {
            RecipesData.GetInstance().ShowMsgTip(stRecipesCompose.m_strMessage);
            return;
         }
         RecipesData.GetInstance().RecipesCompose(stRecipesCompose);
      }
      
      public function RecipesGetInfo() : void
      {
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.RequestRecipesGetInfo(role.m_iRoleUin);
      }
      
      public function ResponseRecipesGetInfo(stRecipesInfo:RecipesStructGetInfoResponse) : void
      {
         if(0 != stRecipesInfo.m_nResult)
         {
            RecipesData.GetInstance().ShowMsgTip(stRecipesInfo.strMessage);
            return;
         }
         RecipesData.GetInstance().GetPlayerRecipesInfo(stRecipesInfo);
      }
      
      public function RecipesActive(stRecipesActive:RecipesStructRecipesActive) : void
      {
         var iMax:int = 0;
         var openRule:RecipesOpenRuleStruct = null;
         var i:int = 0;
         var aryOpenRule:Array = RecipesData.GetInstance().m_aryOpenRule;
         var stRecipesInfo:RecipesStructGetInfoResponse = RecipesData.GetInstance().m_stRecipesInfo;
         var iActive:int = RecipesData.GetInstance().m_iActiveNum;
         if(RecipesMenuListItemStruct.RECIPES_LISTITEM_ACTIVE == stRecipesActive.m_iStatus)
         {
            iMax = 0;
            for(i = 0; i < aryOpenRule.length; i++)
            {
               openRule = aryOpenRule[i];
               if(stRecipesInfo.m_iValue >= openRule.m_iFoodPoint)
               {
                  iMax = iMax < openRule.m_iMaxOpen ? openRule.m_iMaxOpen : iMax;
               }
            }
            if(iMax <= iActive)
            {
               RecipesData.GetInstance().ShowMsgTip("当前食神点数只能开启" + iMax + "张食神谱");
               return;
            }
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         stRecipesActive.m_iUIN = role.m_iRoleUin;
         a_2161.e.RequestRecipesActive(stRecipesActive);
      }
      
      public function ResponseRecipesActive(stRecipesActive:RecipesStructAvtiveResponse) : void
      {
         if(0 != stRecipesActive.m_nResult)
         {
            RecipesData.GetInstance().ShowMsgTip(stRecipesActive.m_strMessage);
            return;
         }
         RecipesData.GetInstance().RecipesActive(stRecipesActive);
      }
   }
}

