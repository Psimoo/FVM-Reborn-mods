package com.aurora.ui.maogoutd.resource.avatar
{
   import a_4724.AvatarDetailInfo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class GirlAvatarDefenseMovie extends MovieClip
   {
      
      public static var a_1288:Array = [];
      
      public var m_stCoverallMovie:MovieClip;
      
      public var m_stGunMovie:MovieClip;
      
      public var m_stSuperGunMovie:MovieClip;
      
      public var m_stShieldMovie:MovieClip;
      
      public var m_stFaceMovie:MovieClip;
      
      public var m_stFaceDecorationMovie:MovieClip;
      
      public var m_stEyeMovie:MovieClip;
      
      public var m_stEyeGlassesMovie:MovieClip;
      
      public var m_stHairMovie:MovieClip;
      
      public var m_stBodyMovie:MovieClip;
      
      public var m_stHatMovie:MovieClip;
      
      public var m_stAureolaMovie:MovieClip;
      
      public var m_stWingMovie:MovieClip;
      
      public function GirlAvatarDefenseMovie()
      {
         super();
      }
      
      public function a_3925(stAvatarDetailInfo:AvatarDetailInfo) : Boolean
      {
         var sourceClass:Class = null;
         if(this.m_stCoverallMovie)
         {
            if(contains(this.m_stCoverallMovie))
            {
               removeChild(this.m_stCoverallMovie);
            }
            this.m_stCoverallMovie = null;
         }
         if(this.m_stGunMovie)
         {
            if(contains(this.m_stGunMovie))
            {
               removeChild(this.m_stGunMovie);
            }
            this.m_stGunMovie = null;
         }
         if(this.m_stSuperGunMovie)
         {
            if(contains(this.m_stSuperGunMovie))
            {
               removeChild(this.m_stSuperGunMovie);
            }
            this.m_stSuperGunMovie = null;
         }
         if(this.m_stShieldMovie)
         {
            if(contains(this.m_stShieldMovie))
            {
               removeChild(this.m_stShieldMovie);
            }
            this.m_stShieldMovie = null;
         }
         if(this.m_stFaceMovie)
         {
            if(contains(this.m_stFaceMovie))
            {
               removeChild(this.m_stFaceMovie);
            }
            this.m_stFaceMovie = null;
         }
         if(this.m_stFaceDecorationMovie)
         {
            if(contains(this.m_stFaceDecorationMovie))
            {
               removeChild(this.m_stFaceDecorationMovie);
            }
            this.m_stFaceDecorationMovie = null;
         }
         if(this.m_stEyeMovie)
         {
            if(contains(this.m_stEyeMovie))
            {
               removeChild(this.m_stEyeMovie);
            }
            this.m_stEyeMovie = null;
         }
         if(this.m_stHairMovie)
         {
            if(contains(this.m_stHairMovie))
            {
               removeChild(this.m_stHairMovie);
            }
            this.m_stHairMovie = null;
         }
         if(this.m_stEyeGlassesMovie)
         {
            if(contains(this.m_stEyeGlassesMovie))
            {
               removeChild(this.m_stEyeGlassesMovie);
            }
            this.m_stEyeGlassesMovie = null;
         }
         if(this.m_stBodyMovie)
         {
            if(contains(this.m_stBodyMovie))
            {
               removeChild(this.m_stBodyMovie);
            }
            this.m_stBodyMovie = null;
         }
         if(this.m_stHatMovie)
         {
            if(contains(this.m_stHatMovie))
            {
               removeChild(this.m_stHatMovie);
            }
            this.m_stHatMovie = null;
         }
         if(this.m_stAureolaMovie)
         {
            if(contains(this.m_stAureolaMovie))
            {
               removeChild(this.m_stAureolaMovie);
            }
            this.m_stAureolaMovie = null;
         }
         if(this.m_stWingMovie)
         {
            if(contains(this.m_stWingMovie))
            {
               removeChild(this.m_stWingMovie);
            }
            this.m_stWingMovie = null;
         }
         if(stAvatarDetailInfo.m_iAureolaType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iAureolaType]))
         {
            this.m_stAureolaMovie = a_1288[stAvatarDetailInfo.m_iAureolaType];
            addChild(this.m_stAureolaMovie);
         }
         if(stAvatarDetailInfo.m_iSuperGunType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iSuperGunType]))
         {
            this.m_stSuperGunMovie = a_1288[stAvatarDetailInfo.m_iSuperGunType];
            addChild(this.m_stSuperGunMovie);
         }
         if(stAvatarDetailInfo.m_iCoverallType > 0)
         {
            if(stAvatarDetailInfo.m_iWingType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iWingType]))
            {
               this.m_stWingMovie = a_1288[stAvatarDetailInfo.m_iWingType];
               addChild(this.m_stWingMovie);
            }
            if(a_1288[stAvatarDetailInfo.m_iCoverallType])
            {
               this.m_stCoverallMovie = a_1288[stAvatarDetailInfo.m_iCoverallType];
            }
            this.m_stCoverallMovie.gotoAndStop(1);
            addChild(this.m_stCoverallMovie);
         }
         else
         {
            if(stAvatarDetailInfo.m_iWingType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iWingType]))
            {
               this.m_stWingMovie = a_1288[stAvatarDetailInfo.m_iWingType];
               addChild(this.m_stWingMovie);
            }
            if(stAvatarDetailInfo.m_iFaceType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iFaceType]))
            {
               this.m_stFaceMovie = a_1288[stAvatarDetailInfo.m_iFaceType];
               addChild(this.m_stFaceMovie);
            }
            if(stAvatarDetailInfo.m_iFaceDecorationType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iFaceDecorationType]))
            {
               this.m_stFaceDecorationMovie = a_1288[stAvatarDetailInfo.m_iFaceDecorationType];
               addChild(this.m_stFaceDecorationMovie);
            }
            if(stAvatarDetailInfo.m_iEyeType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iEyeType]))
            {
               this.m_stEyeMovie = a_1288[stAvatarDetailInfo.m_iEyeType];
               addChild(this.m_stEyeMovie);
            }
            if(stAvatarDetailInfo.m_iHairType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iHairType]))
            {
               this.m_stHairMovie = a_1288[stAvatarDetailInfo.m_iHairType];
               addChild(this.m_stHairMovie);
            }
            if(stAvatarDetailInfo.m_iEyeGlassesType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iEyeGlassesType]))
            {
               this.m_stEyeGlassesMovie = a_1288[stAvatarDetailInfo.m_iEyeGlassesType];
               addChild(this.m_stEyeGlassesMovie);
            }
            if(stAvatarDetailInfo.m_iHatType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iHatType]))
            {
               this.m_stHatMovie = a_1288[stAvatarDetailInfo.m_iHatType];
               addChild(this.m_stHatMovie);
            }
            if(stAvatarDetailInfo.m_iBodyType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iBodyType]))
            {
               this.m_stBodyMovie = a_1288[stAvatarDetailInfo.m_iBodyType];
               addChild(this.m_stBodyMovie);
            }
         }
         if(stAvatarDetailInfo.m_iShieldType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iShieldType]))
         {
            this.m_stShieldMovie = a_1288[stAvatarDetailInfo.m_iShieldType];
            addChild(this.m_stShieldMovie);
         }
         if(stAvatarDetailInfo.m_iGunType > 0 && Boolean(a_1288[stAvatarDetailInfo.m_iGunType]))
         {
            this.m_stGunMovie = a_1288[stAvatarDetailInfo.m_iGunType];
            addChild(this.m_stGunMovie);
         }
         return true;
      }
      
      override public function nextFrame() : void
      {
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         var stDisplayObj:DisplayObject = null;
         for each(stDisplayObj in this)
         {
            removeChild(stDisplayObj);
         }
         if(this.m_stAureolaMovie)
         {
            addChild(this.m_stAureolaMovie);
            this.m_stAureolaMovie.gotoAndStop(frame,scene);
         }
         if(this.m_stSuperGunMovie)
         {
            addChild(this.m_stSuperGunMovie);
            this.m_stSuperGunMovie.gotoAndStop(frame,scene);
         }
         if(this.m_stCoverallMovie)
         {
            if(this.m_stWingMovie)
            {
               addChild(this.m_stWingMovie);
               this.m_stWingMovie.gotoAndStop(frame,scene);
            }
            addChild(this.m_stCoverallMovie);
            this.m_stCoverallMovie.gotoAndStop(frame,scene);
         }
         else
         {
            if(this.m_stWingMovie)
            {
               addChild(this.m_stWingMovie);
               this.m_stWingMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stFaceMovie)
            {
               addChild(this.m_stFaceMovie);
               this.m_stFaceMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stFaceDecorationMovie)
            {
               addChild(this.m_stFaceDecorationMovie);
               this.m_stFaceDecorationMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stEyeMovie)
            {
               addChild(this.m_stEyeMovie);
               this.m_stEyeMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stHairMovie)
            {
               addChild(this.m_stHairMovie);
               this.m_stHairMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stEyeGlassesMovie)
            {
               addChild(this.m_stEyeGlassesMovie);
               this.m_stEyeGlassesMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stHatMovie)
            {
               addChild(this.m_stHatMovie);
               this.m_stHatMovie.gotoAndStop(frame,scene);
            }
            if(this.m_stBodyMovie)
            {
               addChild(this.m_stBodyMovie);
               this.m_stBodyMovie.gotoAndStop(frame,scene);
            }
         }
         if(this.m_stShieldMovie)
         {
            addChild(this.m_stShieldMovie);
            this.m_stShieldMovie.gotoAndStop(frame,scene);
         }
         if(this.m_stGunMovie)
         {
            addChild(this.m_stGunMovie);
            this.m_stGunMovie.gotoAndStop(frame,scene);
         }
      }
   }
}

