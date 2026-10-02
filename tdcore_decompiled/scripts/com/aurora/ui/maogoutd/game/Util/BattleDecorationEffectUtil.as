package com.aurora.ui.maogoutd.game.Util
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel10AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel11AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel12AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel13AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel14AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel15AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel16AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel1Animation;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel1AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel2AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel3AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel4AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel5AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel6AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel7AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel8AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel9AnimationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre10DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre11DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre12DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre13DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre14DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre15DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre16DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre18DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre19DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre20DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre4DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre5DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre6DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre7DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre8DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegre9DecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.StarDegreMaxDecorationMovie;
   import com.aurora.ui.maogoutd.resource.effect.a_4110;
   
   public class BattleDecorationEffectUtil
   {
      
      public function BattleDecorationEffectUtil()
      {
         super();
      }
      
      public static function GetStarDegreDecoration(a_1094:int) : a_4110
      {
         var movieClass:Class = GetStarDegreDecorationClass(a_1094);
         if(movieClass == null)
         {
            return null;
         }
         return PoolManager.getInstance().CheckOutOne(a_4110,movieClass) as a_4110;
      }
      
      private static function GetStarDegreDecorationClass(a_1094:int) : Class
      {
         switch(a_1094)
         {
            case 4:
               return StarDegre4DecorationMovie;
            case 5:
               return StarDegre5DecorationMovie;
            case 6:
               return StarDegre6DecorationMovie;
            case 7:
               return StarDegre7DecorationMovie;
            case 8:
               return StarDegre8DecorationMovie;
            case 9:
               return StarDegre9DecorationMovie;
            case 10:
               return StarDegre10DecorationMovie;
            case 11:
               return StarDegre11DecorationMovie;
            case 12:
               return StarDegre12DecorationMovie;
            case 13:
               return StarDegre13DecorationMovie;
            case 14:
               return StarDegre14DecorationMovie;
            case 15:
               return StarDegre15DecorationMovie;
            case 16:
               return StarDegre16DecorationMovie;
            case 17:
               return StarDegreMaxDecorationMovie;
            case 18:
               return StarDegre18DecorationMovie;
            case 19:
               return StarDegre19DecorationMovie;
            case 20:
               return StarDegre20DecorationMovie;
            default:
               return null;
         }
      }
      
      private static function GetGradeLevelDecorationClass(m_iGradeDegree:int) : Class
      {
         switch(m_iGradeDegree)
         {
            case 1:
               return GradeLevel1AnimationMovie;
            case 2:
               return GradeLevel2AnimationMovie;
            case 3:
               return GradeLevel3AnimationMovie;
            case 4:
               return GradeLevel4AnimationMovie;
            case 5:
               return GradeLevel5AnimationMovie;
            case 6:
               return GradeLevel6AnimationMovie;
            case 7:
               return GradeLevel7AnimationMovie;
            case 8:
               return GradeLevel8AnimationMovie;
            case 9:
               return GradeLevel9AnimationMovie;
            case 10:
               return GradeLevel10AnimationMovie;
            case 11:
               return GradeLevel11AnimationMovie;
            case 12:
               return GradeLevel12AnimationMovie;
            case 13:
               return GradeLevel13AnimationMovie;
            case 14:
               return GradeLevel14AnimationMovie;
            case 15:
               return GradeLevel15AnimationMovie;
            case 16:
               return GradeLevel16AnimationMovie;
            default:
               return null;
         }
      }
      
      public static function GetGradeLevelDecoration(m_iGradeDegree:int) : GradeLevel1Animation
      {
         var movieClass:Class = GetGradeLevelDecorationClass(m_iGradeDegree);
         if(movieClass == null)
         {
            return null;
         }
         return PoolManager.getInstance().CheckOutOne(GradeLevel1Animation,movieClass) as GradeLevel1Animation;
      }
   }
}

