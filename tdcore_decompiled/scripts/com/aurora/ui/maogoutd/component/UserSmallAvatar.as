package com.aurora.ui.maogoutd.component
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4716.a_1743;
   import a_4739.a_1826;
   import com.aurora.ui.maogoutd.component.avatar.BoyBaseBody;
   import com.aurora.ui.maogoutd.component.avatar.BoyBaseClothes;
   import com.aurora.ui.maogoutd.component.avatar.BoyBaseEye;
   import com.aurora.ui.maogoutd.component.avatar.BoyBaseHair;
   import com.aurora.ui.maogoutd.component.avatar.BoyBaseHead;
   import com.aurora.ui.maogoutd.component.avatar.BoyCryEye;
   import com.aurora.ui.maogoutd.component.avatar.BoySmileEye;
   import com.aurora.ui.maogoutd.component.avatar.GirlBaseBody;
   import com.aurora.ui.maogoutd.component.avatar.GirlBaseClothes;
   import com.aurora.ui.maogoutd.component.avatar.GirlBaseEye;
   import com.aurora.ui.maogoutd.component.avatar.GirlBaseHair;
   import com.aurora.ui.maogoutd.component.avatar.GirlBaseHead;
   import com.aurora.ui.maogoutd.component.avatar.GirlCryEye;
   import com.aurora.ui.maogoutd.component.avatar.GirlSmileEye;
   import com.aurora.ui.maogoutd.role.a_4461;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class UserSmallAvatar extends Sprite
   {
      
      private var skin:Bitmap;
      
      private var eye:Bitmap;
      
      private var hair:Bitmap;
      
      private var hair0:Bitmap;
      
      private var clothes:Bitmap;
      
      private var clothes1:Bitmap;
      
      private var clothes2:Bitmap;
      
      private var clothes3:Bitmap;
      
      private var face:Bitmap;
      
      private var wing:Bitmap;
      
      private var hat:Bitmap;
      
      private var eyeGlasses:Bitmap;
      
      private var entirety:Bitmap;
      
      private var anotherentirety:Bitmap;
      
      private var m_GemoSuit:Bitmap;
      
      private var necklace:Bitmap;
      
      private var bracelet:Bitmap;
      
      private var shadow:Bitmap;
      
      private var ring:Bitmap;
      
      private var girlbody:Bitmap;
      
      private var boybody:Bitmap;
      
      private var girlhead:Bitmap;
      
      private var boyhead:Bitmap;
      
      public var bg:MovieClip;
      
      public var m_iUserSex:int;
      
      private var a_952:Dictionary;
      
      private var a_953:a_1826;
      
      private var loader:AssetsLoader;
      
      private var dictNotVisible:Dictionary;
      
      private var m_iFace:int;
      
      private var m_SuitShowType:int;
      
      public function UserSmallAvatar()
      {
         super();
         this.m_SuitShowType = 0;
         this.a_953 = new a_1826(this);
         this.a_952 = new Dictionary();
         this.m_iUserSex = a_1743.sex_female;
         this.mouseChildren = false;
         this.ring = new Bitmap();
         this.shadow = new Bitmap();
         this.bracelet = new Bitmap();
         this.necklace = new Bitmap();
         this.entirety = new Bitmap();
         this.anotherentirety = new Bitmap();
         this.m_GemoSuit = new Bitmap();
         this.eyeGlasses = new Bitmap();
         this.hat = new Bitmap();
         this.wing = new Bitmap();
         this.face = new Bitmap();
         this.clothes = new Bitmap();
         this.clothes1 = new Bitmap();
         this.clothes2 = new Bitmap();
         this.clothes3 = new Bitmap();
         this.hair = new Bitmap();
         this.eye = new Bitmap();
         this.skin = new Bitmap();
         this.boybody = new Bitmap(BoyBaseBody.getInstance());
         this.boybody.visible = false;
         this.boyhead = new Bitmap(BoyBaseHead.getInstance());
         this.boyhead.visible = false;
         this.girlbody = new Bitmap(GirlBaseBody.getInstance());
         this.girlbody.visible = false;
         this.girlhead = new Bitmap(GirlBaseHead.getInstance());
         this.girlhead.visible = false;
         this.hair0 = new Bitmap();
         this.addChild(this.shadow);
         this.addChild(this.hair0);
         this.addChild(this.wing);
         this.addChild(this.skin);
         this.addChild(this.ring);
         this.addChild(this.bracelet);
         this.addChild(this.necklace);
         this.addChild(this.boybody);
         this.addChild(this.girlbody);
         this.addChild(this.clothes);
         this.addChild(this.clothes1);
         this.addChild(this.clothes2);
         this.addChild(this.clothes3);
         this.addChild(this.boyhead);
         this.addChild(this.girlhead);
         this.addChild(this.eye);
         this.addChild(this.face);
         this.addChild(this.hair);
         this.addChild(this.hat);
         this.addChild(this.eyeGlasses);
         this.addChild(this.entirety);
         this.addChild(this.anotherentirety);
         this.addChild(this.m_GemoSuit);
         this.registerUserAvatar();
         this.dictNotVisible = new Dictionary();
         this.dictNotVisible[344981504] = 1;
         this.dictNotVisible[346030080] = 1;
         this.dictNotVisible[350224384] = 1;
         this.dictNotVisible[348127232] = 1;
         this.dictNotVisible[335544320] = 1;
      }
      
      private function registerUserAvatar() : void
      {
         this.a_953.register(0,this.showShadow);
         this.a_953.register(2,this.showHat);
         this.a_953.register(3,this.showEyeGlasses);
         this.a_953.register(4,this.showHair);
         this.a_953.register(5,this.showFace);
         this.a_953.register(6,this.showClothes);
         this.a_953.register(7,this.showEye);
         this.a_953.register(11,this.showWing);
         this.a_953.register(13,this.showEntirety);
         this.a_953.register(8,this.showAnotherEntirety);
         this.a_953.register(15,this.ShowGemoSuit);
      }
      
      private function showShadow(m_shadow:BitmapData, visible:Boolean) : void
      {
         this.shadow.visible = visible;
         if(m_shadow != null)
         {
            this.shadow.bitmapData = m_shadow;
            this.shadow.smoothing = true;
         }
      }
      
      private function showEyeGlasses(m_eyeGlasses:BitmapData, visible:Boolean) : void
      {
         this.eyeGlasses.visible = visible;
         if(m_eyeGlasses != null)
         {
            this.eyeGlasses.bitmapData = m_eyeGlasses;
            this.eyeGlasses.smoothing = true;
         }
      }
      
      private function showWing(m_wing:BitmapData, visible:Boolean) : void
      {
         this.wing.visible = visible;
         if(m_wing != null)
         {
            this.wing.bitmapData = m_wing;
            this.wing.smoothing = true;
         }
      }
      
      private function showSkin(m_skin:BitmapData, visible:Boolean) : void
      {
         this.skin.visible = visible;
         if(this.skin != null)
         {
            this.skin.bitmapData = m_skin;
            this.skin.smoothing = true;
         }
      }
      
      private function showHair(m_hair:BitmapData, visible:Boolean) : void
      {
         if(this.hair.bitmapData != null && this.hair.bitmapData.width > 200)
         {
            this.hair0.visible = true;
         }
         else
         {
            this.hair0.visible = false;
         }
         this.hair.visible = visible;
         if(m_hair != null)
         {
            if(m_hair.width > 200)
            {
               this.hair0.visible = true;
               this.hair0.bitmapData = m_hair;
               this.hair.bitmapData = m_hair;
               this.hair0.scrollRect = new Rectangle(0,0,m_hair.width / 2,m_hair.height);
               this.hair.scrollRect = new Rectangle(m_hair.width / 2,0,m_hair.width / 2,m_hair.height);
            }
            else
            {
               this.hair0.visible = false;
               this.hair.bitmapData = m_hair;
               this.hair.scrollRect = new Rectangle(0,0,m_hair.width,m_hair.height);
            }
         }
         this.hair0.smoothing = true;
         this.hair.smoothing = true;
      }
      
      private function showEye(m_eye:BitmapData, visible:Boolean) : void
      {
         if(this.m_iFace == 1)
         {
            if(this.m_iUserSex == 1)
            {
               m_eye = BoySmileEye.getInstance();
            }
            else
            {
               m_eye = GirlSmileEye.getInstance();
            }
         }
         else if(this.m_iFace == 2)
         {
            if(this.m_iUserSex == 1)
            {
               m_eye = BoyCryEye.getInstance();
            }
            else
            {
               m_eye = GirlCryEye.getInstance();
            }
         }
         this.eye.visible = visible;
         if(m_eye != null)
         {
            this.eye.bitmapData = m_eye;
            this.eye.smoothing = true;
         }
      }
      
      private function showClothes(m_clothes:BitmapData, visible:Boolean) : void
      {
         this.clothes.visible = visible;
         this.clothes1.visible = visible;
         this.clothes2.visible = visible;
         this.clothes3.visible = visible;
         if(m_clothes != null)
         {
            this.clothes.bitmapData = m_clothes;
            this.clothes1.bitmapData = m_clothes;
            this.clothes2.bitmapData = m_clothes;
            this.clothes3.bitmapData = m_clothes;
            this.clothes.scrollRect = new Rectangle(0,0,m_clothes.width / 4,m_clothes.height);
            this.clothes1.scrollRect = new Rectangle(m_clothes.width / 4,0,m_clothes.width / 4,m_clothes.height);
            this.clothes2.scrollRect = new Rectangle(2 * m_clothes.width / 4,0,m_clothes.width / 4,m_clothes.height);
            this.clothes3.scrollRect = new Rectangle(3 * m_clothes.width / 4,0,m_clothes.width / 4,m_clothes.height);
            this.clothes.smoothing = true;
            this.clothes1.smoothing = true;
            this.clothes2.smoothing = true;
            this.clothes3.smoothing = true;
         }
      }
      
      private function showFace(m_face:BitmapData, visible:Boolean) : void
      {
         this.face.visible = visible;
         if(m_face != null)
         {
            this.face.bitmapData = m_face;
            this.face.visible = true;
            this.face.smoothing = true;
         }
      }
      
      private function showHat(m_hat:BitmapData, visible:Boolean) : void
      {
         this.hat.visible = visible;
         if(m_hat != null)
         {
            this.hat.bitmapData = m_hat;
            this.hat.visible = true;
            this.hat.smoothing = true;
         }
      }
      
      private function showEntirety(m_entirety:BitmapData, visible:Boolean) : void
      {
         this.entirety.visible = visible;
         this.anotherentirety.visible = false;
         this.m_GemoSuit.visible = false;
         if(m_entirety != null)
         {
            this.entirety.bitmapData = m_entirety;
            this.entirety.smoothing = true;
            this.entirety.visible = true;
         }
      }
      
      private function showAnotherEntirety(m_entirety:BitmapData, visible:Boolean) : void
      {
         this.anotherentirety.visible = visible;
         this.entirety.visible = false;
         this.m_GemoSuit.visible = false;
         if(m_entirety != null)
         {
            this.anotherentirety.bitmapData = m_entirety;
            this.anotherentirety.smoothing = true;
            this.anotherentirety.visible = true;
         }
      }
      
      private function ShowGemoSuit(m_entirety:BitmapData, visible:Boolean) : void
      {
         this.m_GemoSuit.visible = visible;
         this.entirety.visible = false;
         this.anotherentirety.visible = false;
         if(m_entirety != null)
         {
            this.m_GemoSuit.bitmapData = m_entirety;
            this.m_GemoSuit.smoothing = true;
            this.m_GemoSuit.visible = true;
         }
      }
      
      public function mirrorUserAvatar() : Bitmap
      {
         var target:Bitmap = new Bitmap();
         var w:int = this.width;
         if(w > 200)
         {
            w = this.width / 4;
         }
         var bitmapData:BitmapData = new BitmapData(w,this.height,true,0);
         var matrix:Matrix = new Matrix(-1,0,0,1,w,0);
         bitmapData.draw(this,matrix);
         if(target.bitmapData)
         {
            target.bitmapData.dispose();
         }
         target.bitmapData = bitmapData;
         target.smoothing = true;
         return target;
      }
      
      public function showAvatar(type:int, m_image:Bitmap, isRef:Boolean = true, SuitShowType:int = 0) : void
      {
         this.m_SuitShowType = SuitShowType;
         if(m_image == null)
         {
            return;
         }
         if(type == 1)
         {
            this.a_952[8] = 8;
            this.a_952[15] = 15;
         }
         else
         {
            this.a_952[type] = type;
         }
         if(type == 13 && this.m_SuitShowType != 1)
         {
            delete this.a_952[type];
         }
         if(type == 1)
         {
            if(this.m_SuitShowType != 2)
            {
               delete this.a_952[8];
            }
            if(this.m_SuitShowType != 3)
            {
               delete this.a_952[15];
            }
         }
         if(type == 1)
         {
            if(this.m_SuitShowType == 2)
            {
               this.a_953.excute(8,m_image.bitmapData,true);
            }
            else if(this.m_SuitShowType == 3)
            {
               this.a_953.excute(15,m_image.bitmapData,true);
            }
         }
         else
         {
            this.a_953.excute(type,m_image.bitmapData,true);
         }
         if(isRef)
         {
            this.showAvatarBaseBody();
         }
      }
      
      public function hideAvatar(type:int, isRef:Boolean = true) : void
      {
         if(type == 1)
         {
            if(this.m_SuitShowType == 2)
            {
               delete this.a_952[8];
               this.a_953.excute(8,null,false);
            }
            else if(this.m_SuitShowType == 3)
            {
               delete this.a_952[15];
               this.a_953.excute(15,null,false);
            }
         }
         else
         {
            delete this.a_952[type];
            this.a_953.excute(type,null,false);
         }
         if(isRef)
         {
            this.showAvatarBaseBody();
         }
      }
      
      private function showAvatarBaseBody() : void
      {
         var isGirl:Boolean = false;
         var baseEye:BitmapData = null;
         var baseHair:BitmapData = null;
         var baseClothes:BitmapData = null;
         if(this.a_952[13] == null && this.a_952[8] == null && this.a_952[15] == null)
         {
            isGirl = this.m_iUserSex == a_1743.sex_female ? true : false;
            if(this.a_952[7] == null)
            {
               baseEye = null;
               if(isGirl)
               {
                  baseEye = GirlBaseEye.getInstance();
               }
               else
               {
                  baseEye = BoyBaseEye.getInstance();
               }
               this.showEye(baseEye,true);
            }
            if(this.a_952[4] == null)
            {
               baseHair = null;
               if(isGirl)
               {
                  baseHair = GirlBaseHair.getInstance();
               }
               else
               {
                  baseHair = BoyBaseHair.getInstance();
               }
               this.showHair(baseHair,true);
            }
            if(this.a_952[6] == null)
            {
               baseClothes = null;
               if(isGirl)
               {
                  baseClothes = GirlBaseClothes.getInstance();
               }
               else
               {
                  baseClothes = BoyBaseClothes.getInstance();
               }
               this.showClothes(baseClothes,true);
            }
            this.boybody.visible = !isGirl;
            this.boyhead.visible = !isGirl;
            this.girlbody.visible = isGirl;
            this.girlhead.visible = isGirl;
            this.entirety.visible = false;
            this.anotherentirety.visible = false;
            this.m_GemoSuit.visible = false;
            delete this.a_952[13];
            this.showInAvatarAttr();
         }
         else
         {
            this.hideAvatarAttr();
            if(this.a_952[8] == null)
            {
               this.anotherentirety.visible = false;
            }
            if(this.a_952[13] == null)
            {
               this.entirety.visible = false;
            }
            if(this.a_952[15] == null)
            {
               this.m_GemoSuit.visible = false;
            }
         }
         this.bg.visible = false;
         this.bg.m.gotoAndStop(1);
      }
      
      private function showInAvatarAttr() : void
      {
         var type:int = 0;
         for each(type in this.a_952)
         {
            this.a_953.excute(type,null,true);
         }
      }
      
      private function hideAvatarAttr() : void
      {
         var display:DisplayObject = null;
         var num:int = this.numChildren;
         var index:int = 0;
         while(index < num)
         {
            display = this.getChildAt(index);
            if(display as Bitmap)
            {
               (display as Bitmap).visible = false;
            }
            index++;
         }
         this.entirety.visible = true;
         this.anotherentirety.visible = true;
         this.m_GemoSuit.visible = true;
      }
      
      public function showUserAvatar(arrHeroItemID:Array, iFace:int = 0, SuitShowType:int = 0) : void
      {
         var type:int = 0;
         var m_dictAttr:Dictionary = null;
         var prop:* = undefined;
         var display:DisplayObject = null;
         var heroItem:a_4461 = null;
         var m_iItemID:int = 0;
         var id:int = 0;
         var ID:String = null;
         var url:String = null;
         this.m_iFace = iFace;
         var num:int = this.numChildren;
         var index:int = 0;
         while(index < num)
         {
            display = this.getChildAt(index);
            if(display as Bitmap)
            {
               (display as Bitmap).visible = false;
            }
            index++;
         }
         for each(type in this.a_952)
         {
            delete this.a_952[type];
         }
         m_dictAttr = null;
         if(arrHeroItemID != null && arrHeroItemID.length > 0)
         {
            for each(heroItem in arrHeroItemID)
            {
               m_iItemID = heroItem.m_iItemID;
               id = m_iItemID & 0xFFF00000;
               if(this.dictNotVisible[id] == null || id == 336592896 && heroItem.m_arrExtraAttr != null)
               {
                  if(m_dictAttr == null)
                  {
                     m_dictAttr = new Dictionary();
                  }
                  if(!(SuitShowType == 0 && (id == 349175808 || id == 336592896 || id == 343932928)))
                  {
                     if(!(SuitShowType == 1 && id != 349175808))
                     {
                        if(!(SuitShowType >= 2 && (id != 336592896 && id != 343932928)))
                        {
                           if(SuitShowType >= 2)
                           {
                              if(id == 343932928)
                              {
                                 m_iItemID = this.getRankSuitIDbyGemo(heroItem,SuitShowType);
                              }
                              else if(id == 336592896)
                              {
                                 m_iItemID = this.getSuitIDbyGemo(heroItem,SuitShowType);
                              }
                           }
                           if(m_iItemID > 0)
                           {
                              ID = "AvaterImage" + m_iItemID.toString(16);
                              if(id == 336592896 || id == 343932928)
                              {
                                 url = "images/1/4/0x" + m_iItemID.toString(16) + ".png";
                                 m_dictAttr[ID] = new AssetsItemData(url,AssetType.JPG,ID);
                              }
                              else
                              {
                                 m_dictAttr[ID] = new AssetsItemData(heroItem.URL,AssetType.JPG,ID);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         var len:int = 0;
         for(prop in m_dictAttr)
         {
            len++;
         }
         if(m_dictAttr != null && len > 0)
         {
            if(this.loader == null)
            {
               this.loader = new AssetsLoader();
            }
            this.loader.load(m_dictAttr,{
               "onComplete":this.initializeAvater,
               "onCompleteParms":[arrHeroItemID,SuitShowType]
            });
         }
         else
         {
            this.showAvatarBaseBody();
         }
      }
      
      private function initializeAvater(dict:Dictionary, arrHeroItemID:Array, SuitShowType:int) : void
      {
         var heroItem:a_4461 = null;
         var m_iItemID:int = 0;
         var id:int = 0;
         var ID:String = null;
         if(arrHeroItemID != null && arrHeroItemID.length > 0)
         {
            for each(heroItem in arrHeroItemID)
            {
               m_iItemID = heroItem.m_iItemID;
               id = m_iItemID & 0xFFF00000;
               if(this.dictNotVisible[id] == null || id == 336592896 && heroItem.m_arrExtraAttr != null)
               {
                  if(!(SuitShowType == 0 && (id == 349175808 || id == 336592896 || id == 343932928)))
                  {
                     if(!(SuitShowType == 1 && id != 349175808))
                     {
                        if(!(SuitShowType >= 2 && (id != 336592896 && id != 343932928)))
                        {
                           if(SuitShowType >= 2)
                           {
                              if(id == 343932928)
                              {
                                 m_iItemID = this.getRankSuitIDbyGemo(heroItem,SuitShowType);
                              }
                              else if(id == 336592896)
                              {
                                 m_iItemID = this.getSuitIDbyGemo(heroItem,SuitShowType);
                              }
                           }
                           if(m_iItemID > 0)
                           {
                              ID = "AvaterImage" + m_iItemID.toString(16);
                              if(dict[ID] != null)
                              {
                                 this.showAvatar(heroItem.CardEquipmentType,dict[ID].data as Bitmap,false,SuitShowType);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         this.showAvatarBaseBody();
      }
      
      private function getSuitIDbyGemo(cardAttr:a_4461, type:int) : int
      {
         var gemoLevel:int = 0;
         var gemoID:int = 0;
         var gem:int = 0;
         var m_iCoverallType:int = -1;
         if(cardAttr != null && cardAttr.m_arrExtraAttr != null)
         {
            gem = 0;
            while(gem < cardAttr.m_arrExtraAttr.length)
            {
               gemoLevel = int(cardAttr.m_arrExtraAttr[gem].m_iItemAdd);
               gemoID = int(cardAttr.m_arrExtraAttr[gem].m_iSkillID);
               if(type == 2)
               {
                  if(344006928 == gemoID)
                  {
                     m_iCoverallType = this.m_iUserSex == 1 ? 349197584 : 349197600;
                  }
               }
               else if(type == 3)
               {
                  if(343998480 == gemoID)
                  {
                     if(gemoLevel >= 10)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349186064 : 349186080;
                     }
                     else if(gemoLevel >= 6)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349185808 : 349185824;
                     }
                     else
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349185552 : 349185568;
                     }
                  }
                  else if(343998481 == gemoID)
                  {
                     if(gemoLevel >= 15)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349205776 : 349205792;
                     }
                     else if(gemoLevel >= 9 && gemoLevel <= 14)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349205520 : 349205536;
                     }
                     else
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349205264 : 349205280;
                     }
                  }
                  else if(344203793 == gemoID)
                  {
                     if(gemoLevel >= 15)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349257744 : 349257760;
                     }
                     else if(gemoLevel >= 9 && gemoLevel <= 14)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349255952 : 349255968;
                     }
                     else
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349255696 : 349255712;
                     }
                  }
                  else if(344208913 == gemoID)
                  {
                     if(gemoLevel >= 15)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349270800 : 349270816;
                     }
                     else if(gemoLevel >= 9 && gemoLevel <= 14)
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349270544 : 349270560;
                     }
                     else
                     {
                        m_iCoverallType = this.m_iUserSex == 1 ? 349270288 : 349270304;
                     }
                  }
               }
               gem++;
            }
         }
         return m_iCoverallType;
      }
      
      private function getRankSuitIDbyGemo(cardAttr:a_4461, type:int) : int
      {
         var gemoLevel:int = 0;
         var gemoID:int = 0;
         var m_iCoverallType:int = -1;
         gemoID = cardAttr.m_iItemID;
         gemoLevel = cardAttr.m_iTypeValue;
         if(type == 2)
         {
            if(344006928 == gemoID)
            {
               m_iCoverallType = this.m_iUserSex == 1 ? 349197584 : 349197600;
            }
         }
         else if(type == 3)
         {
            if(343998480 == gemoID)
            {
               if(gemoLevel >= 10)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349186064 : 349186080;
               }
               else if(gemoLevel >= 6)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349185808 : 349185824;
               }
               else
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349185552 : 349185568;
               }
            }
            else if(343998481 == gemoID)
            {
               if(gemoLevel >= 15)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349205776 : 349205792;
               }
               else if(gemoLevel >= 9 && gemoLevel <= 14)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349205520 : 349205536;
               }
               else
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349205264 : 349205280;
               }
            }
            else if(344203793 == gemoID)
            {
               if(gemoLevel >= 15)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349257744 : 349257760;
               }
               else if(gemoLevel >= 9 && gemoLevel <= 14)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349255952 : 349255968;
               }
               else
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349255696 : 349255712;
               }
            }
            else if(344208913 == gemoID)
            {
               if(gemoLevel >= 15)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349270800 : 349270816;
               }
               else if(gemoLevel >= 9 && gemoLevel <= 14)
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349270544 : 349270560;
               }
               else
               {
                  m_iCoverallType = this.m_iUserSex == 1 ? 349270288 : 349270304;
               }
            }
         }
         return m_iCoverallType;
      }
   }
}

