package com.aurora.ui.maogoutd.weddingRoom
{
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.BaseWeddingAvatar;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatar2026Cloth1BoyMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatar2026Cloth1GirlMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyDropLoveMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyEternalNightDanceMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyLilacRomancMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyLoveFlowerMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyNezhaMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyRetroLolitaMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarBoyStarDreamsMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlDropLoveMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlEternalNightDanceMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlLilacRomancMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlLoveFlowerMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlNezhaMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlRetroLolitaMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.NewAvater.WeddingAvatarGirlStarDreamsMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyBirdMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyDateDreamMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyDuYanMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyFairyTalesMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyFuguMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyGeminiLoverMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyHuaJiaMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyHuaTianMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyHuaYuMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyJinDianMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyQiangweiMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyShiYanMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyWolfSheepMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyXiShiMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyZanGeMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyZhongShiMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarBoyZiJinMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlDateDreamMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlDuYanMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlFairyTalesMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlFishMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlFuguMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlGeminiLoverMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlHuaJiaMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlHuaTianMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlHuaYuMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlJinDianMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlQiangweiMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlShiYanMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlWolfSheepMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlXiShiMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlZanGeMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlZhongShiMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarGirlZiJinMovie;
   import com.aurora.ui.maogoutd.weddingRoom.avatar.WeddingAvatarPriestMovie;
   
   public class TDweddingAnimationUI
   {
      
      public function TDweddingAnimationUI()
      {
         super();
         a_4657.getInstance().addListener(this);
      }
      
      private function a_3920(gameMovieClip:Class) : BaseWeddingAvatar
      {
         return PoolManager.getInstance().CheckOutOne(BaseWeddingAvatar,gameMovieClip) as BaseWeddingAvatar;
      }
      
      public function geWeddingAvatarPriest() : BaseWeddingAvatar
      {
         return this.a_3920(WeddingAvatarPriestMovie);
      }
      
      public function getWeddingAnimationByDressType(iDressType:int, sex:int) : BaseWeddingAvatar
      {
         var m_stBoyAvatar:BaseWeddingAvatar = null;
         var m_stGirlAvatar:BaseWeddingAvatar = null;
         switch(iDressType)
         {
            case 1:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyZiJinMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlZiJinMovie);
               break;
            case 2:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyZanGeMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlZanGeMovie);
               break;
            case 3:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyFuguMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlFuguMovie);
               break;
            case 4:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyShiYanMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlShiYanMovie);
               break;
            case 5:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyXiShiMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlXiShiMovie);
               break;
            case 6:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyZhongShiMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlZhongShiMovie);
               break;
            case 7:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyJinDianMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlJinDianMovie);
               break;
            case 8:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyHuaYuMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlHuaYuMovie);
               break;
            case 9:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyDuYanMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlDuYanMovie);
               break;
            case 10:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyQiangweiMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlQiangweiMovie);
               break;
            case 11:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyHuaTianMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlHuaTianMovie);
               break;
            case 12:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyHuaJiaMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlHuaJiaMovie);
               break;
            case 13:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyGeminiLoverMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlGeminiLoverMovie);
               break;
            case 14:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyWolfSheepMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlWolfSheepMovie);
               break;
            case 15:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyBirdMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlFishMovie);
               break;
            case 16:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyFairyTalesMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlFairyTalesMovie);
               break;
            case 17:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyDateDreamMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlDateDreamMovie);
               break;
            case 18:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyRetroLolitaMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlRetroLolitaMovie);
               break;
            case 19:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyLoveFlowerMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlLoveFlowerMovie);
               break;
            case 20:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyLilacRomancMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlLilacRomancMovie);
               break;
            case 21:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyNezhaMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlNezhaMovie);
               break;
            case 22:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyStarDreamsMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlStarDreamsMovie);
               break;
            case 23:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyDropLoveMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlDropLoveMovie);
               break;
            case 24:
               m_stBoyAvatar = this.a_3920(WeddingAvatar2026Cloth1BoyMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatar2026Cloth1GirlMovie);
               break;
            case 25:
               m_stBoyAvatar = this.a_3920(WeddingAvatarBoyEternalNightDanceMovie);
               m_stGirlAvatar = this.a_3920(WeddingAvatarGirlEternalNightDanceMovie);
               break;
            default:
               throw Error("wedding dress type(" + iDressType + ") is not exist！！！");
         }
         if(sex == 1)
         {
            return m_stBoyAvatar;
         }
         if(sex == 2)
         {
            return m_stGirlAvatar;
         }
         return null;
      }
   }
}

