package com.aurora.ui.maogoutd.game
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4718.b_179;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4752.a_2036;
   import a_4752.a_2037;
   import com.aurora.ui.maogoutd.component.WorldBossBuffActiveCom;
   import com.aurora.ui.maogoutd.component.WorldBossBuffTitleCom;
   import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class GameBossBloodProgress2View extends Sprite
   {
      
      public var img_yellow_mask:MovieClip;
      
      public var img_red_mask:MovieClip;
      
      public var img_purple_mask:MovieClip;
      
      public var img_yellow_normal:MovieClip;
      
      public var img_red_normal:MovieClip;
      
      public var img_purple_normal:MovieClip;
      
      public var img_mask:MovieClip;
      
      public var img_mask2:MovieClip;
      
      public var img_cursor:MovieClip;
      
      public var txt_bossname:TextField;
      
      private var m_iStep:int = 1;
      
      private var avatarBitmap:Bitmap;
      
      public var avatarNode:MovieClip;
      
      private var buffBitmap:Bitmap;
      
      public var buffIcon:MovieClip;
      
      public var titleCom:WorldBossBuffTitleCom;
      
      public var activeCom:WorldBossBuffActiveCom;
      
      public var com_mask:MovieClip;
      
      public var m_iTotalBlood:int;
      
      public var m_iMapID:int;
      
      public var bInit:Boolean = false;
      
      private var bConst:Boolean = false;
      
      private var damageBuffNumTag:String = "炸丸子Buff次数叠加";
      
      private var damageBuffSumTag:String = "炸丸子Buff伤害叠加";
      
      private var m_lBuffArray:Array = [320012320,320012400,320012416];
      
      public function GameBossBloodProgress2View()
      {
         super();
      }
      
      public function a_4158() : void
      {
         visible = false;
         if(this.titleCom != null)
         {
            this.titleCom.a_4158();
         }
         if(this.activeCom != null)
         {
            this.activeCom.a_4158();
         }
         if(root)
         {
            root.removeEventListener("AurBossBloodProgress",this.OnBossBloodProgressEvent);
         }
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
      }
      
      private function VisibleTrueActiveCom() : void
      {
         if(this.buffIcon.visible == true && this.activeCom != null && this.activeCom.visible == false)
         {
            this.activeCom.visible = true;
            this.activeCom.a_4332();
         }
      }
      
      private function VisibleFalseActiveCom() : void
      {
         if(this.buffIcon.visible == true && this.activeCom != null && this.activeCom.visible == true)
         {
            this.activeCom.visible = false;
            this.activeCom.a_4158();
         }
      }
      
      private function OnBuffGetEnd(stDataEvent:a_1778) : void
      {
         if(a_4206.m_iViewBuffId == 0)
         {
            return;
         }
         this.buffIcon.visible = true;
      }
      
      private function OnBossBloodProgressEvent(stAurDataEvent:a_1778) : void
      {
         var obj:Object = stAurDataEvent.dataObject;
         var numBossBloodProgress:Number = obj.now as Number;
         var allBossBloodProgress:Number = obj.all as Number;
         var leaveCount:int = obj.leaveCount as int;
         var activeProgress:Number = obj.activeProgress as Number;
         var hasShield:Boolean = obj.hasShield as Boolean;
         if(a_4206.m_iViewBuffId != 320012432)
         {
            if(this.bConst)
            {
               this.buffIcon.txt_count.visible = false;
               this.buffIcon.com_mask.visible = false;
               this.VisibleFalseActiveCom();
            }
            else if(hasShield)
            {
               if(leaveCount > 0)
               {
                  this.buffIcon.txt_count.visible = true;
                  this.buffIcon.txt_count.text = leaveCount + "";
               }
               else
               {
                  this.buffIcon.txt_count.visible = false;
               }
               this.buffIcon.com_mask.visible = false;
               this.VisibleTrueActiveCom();
            }
            else
            {
               this.buffIcon.txt_count.visible = false;
               this.buffIcon.com_mask.visible = true;
               this.buffIcon.com_mask.height = (1 - Math.min(activeProgress,1)) * 41;
               this.VisibleFalseActiveCom();
            }
         }
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         if(a_4206.m_iViewBuffId != 320012432)
         {
            return;
         }
         if(visible == false)
         {
            return;
         }
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(stDataEvent.dataObject[3] != null)
         {
            if(stDataEvent.dataObject[3].m_bPlaceByUpGradeCard == true || stDataEvent.dataObject[3].m_IsCaclueCoolDown == 2)
            {
               return;
            }
         }
         if(BattleFieldView.m_lTraceCard.indexOf(iDefenseTypeID) == -1)
         {
            return;
         }
         if(iDefenseTypeID == b_179.a_403 || iDefenseTypeID == b_179.enm_HelmetCopperScoop || iDefenseTypeID == b_179.enm_HelmetSilverScoop || iDefenseTypeID == b_179.enm_HelmetGoldenScoop)
         {
            return;
         }
         a_2036.getInstance().tagCom.AddSum(this.damageBuffNumTag);
         var count:int = a_2036.getInstance().tagCom.GetSum(this.damageBuffNumTag);
         if(count >= 6 && a_2036.getInstance().tagCom.GetSum(this.damageBuffSumTag) < 10)
         {
            a_2036.getInstance().tagCom.AddSum(this.damageBuffSumTag);
            a_2036.getInstance().tagCom.DeleteSum(this.damageBuffNumTag);
         }
         this.UpdateZhaWanZiBuff();
      }
      
      private function UpdateZhaWanZiBuff() : void
      {
         if(a_4206.m_iViewBuffId != 320012432)
         {
            return;
         }
         var damageSum:int = a_2036.getInstance().tagCom.GetSum(this.damageBuffSumTag);
         if(damageSum <= 0)
         {
            this.buffIcon.txt_count.visible = false;
         }
         else
         {
            this.buffIcon.txt_count.visible = true;
            this.buffIcon.txt_count.text = "+" + damageSum;
         }
         this.buffIcon.com_mask.visible = true;
         var rate:Number = a_2036.getInstance().tagCom.GetSum(this.damageBuffNumTag) / 6;
         this.buffIcon.com_mask.height = (1 - Math.min(rate,1)) * 41;
      }
      
      public function a_1797(iMapID:int, iBossNum:int, pendingAddMoveIntruderVector:Vector.<a_4269> = null) : Boolean
      {
         var iViewBuffId:int = 0;
         var i:int = 0;
         var objMapInfo:Object = null;
         var nameArr:Array = null;
         var idArr:Array = null;
         if(!this.bInit)
         {
            a_1789.getInstance().addEventListener("OnBuffGetEnd",this.OnBuffGetEnd);
            this.bInit = true;
         }
         if(root)
         {
            root.addEventListener("AurBossBloodProgress",this.OnBossBloodProgressEvent);
         }
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         iViewBuffId = a_4206.m_iViewBuffId;
         this.bConst = this.m_lBuffArray.indexOf(iViewBuffId) != -1;
         this.m_iMapID = iMapID;
         if(!this.avatarBitmap)
         {
            this.avatarBitmap = new Bitmap();
            this.avatarNode.addChild(this.avatarBitmap);
            this.avatarBitmap.x = 0;
            this.avatarBitmap.y = -13;
         }
         if(!this.buffBitmap)
         {
            this.buffBitmap = new Bitmap();
            this.buffIcon.addChild(this.buffBitmap);
            this.buffBitmap.x = 4;
            this.buffBitmap.y = 4;
         }
         this.buffIcon.addChild(this.buffBitmap);
         if(iViewBuffId == 320012432)
         {
            this.buffIcon.addChild(this.buffIcon.com_mask);
            this.buffIcon.addChild(this.buffIcon.txt_count);
         }
         else
         {
            this.buffIcon.addChild(this.buffIcon.txt_count);
            this.buffIcon.addChild(this.buffIcon.com_mask);
         }
         if(!this.titleCom)
         {
            this.titleCom = new WorldBossBuffTitleCom();
            this.addChild(this.titleCom);
            this.titleCom.visible = false;
         }
         if(!this.activeCom)
         {
            this.activeCom = new WorldBossBuffActiveCom();
            this.addChild(this.activeCom);
            this.activeCom.x = -26;
            this.activeCom.y = 21;
         }
         this.activeCom.visible = false;
         this.buffIcon.txt_count.visible = false;
         this.buffIcon.com_mask.visible = !this.bConst;
         this.buffIcon.com_mask.height = 41;
         this.buffIcon.visible = iBossNum != 0;
         if(iViewBuffId != 0)
         {
            this.a_4629(this.buffBitmap,"1/3/0x" + iViewBuffId.toString(16).toLowerCase());
         }
         if(iBossNum == 0)
         {
            if(iViewBuffId != 0)
            {
               this.titleCom.ShowBuffICon(iViewBuffId);
            }
            this.SetBossStep(1);
         }
         else if(iBossNum == 1)
         {
            this.SetBossStep(2);
         }
         else if(iBossNum == 2)
         {
            this.SetBossStep(3);
         }
         else
         {
            this.SetBossStep(1);
         }
         var strBossName:String = "世界BOSS";
         var bossID:int = 29;
         if((iMapID & 0xF0000000) == 1610612736)
         {
            if(pendingAddMoveIntruderVector != null && Boolean(pendingAddMoveIntruderVector.length))
            {
               for(i = 0; i < pendingAddMoveIntruderVector.length; i++)
               {
                  if(pendingAddMoveIntruderVector[i].m_iIntruderYGridNo < 0)
                  {
                     bossID = pendingAddMoveIntruderVector[i].m_iIntruderType - 8388608;
                     this.m_iTotalBlood = DIYConfigData.Get().m_vBossLevelData[int(pendingAddMoveIntruderVector[i].m_iLife / 1000)].iMinBlood + int(int(pendingAddMoveIntruderVector[i].m_iLife % 1000) * (DIYConfigData.Get().m_vBossLevelData[int(pendingAddMoveIntruderVector[i].m_iLife / 1000)].iMaxBlood - DIYConfigData.Get().m_vBossLevelData[int(pendingAddMoveIntruderVector[i].m_iLife / 1000)].iMinBlood) / 100);
                     strBossName = DIYConfigData.Get().GetBossData(bossID).sBossName;
                     break;
                  }
               }
            }
         }
         else if(a_2037.getInstance().m_dictMapMouse[iMapID] != null)
         {
            objMapInfo = a_2037.getInstance().m_dictMapMouse[iMapID];
            nameArr = objMapInfo.szBossName.split(",");
            idArr = objMapInfo.szBossID.split(",");
            if(iBossNum >= 0)
            {
               if(iBossNum <= nameArr.length - 1)
               {
                  strBossName = nameArr[iBossNum];
               }
               if(iBossNum <= idArr.length - 1)
               {
                  bossID = int(idArr[iBossNum]);
               }
            }
         }
         this.a_4629(this.avatarBitmap,"head/hpBar/" + bossID);
         this.txt_bossname.text = strBossName;
         this.a_3510(1,1);
         this.UpdateZhaWanZiBuff();
         return true;
      }
      
      private function a_4629(imageBitmapData:Bitmap, resPath:String) : void
      {
         var dic:Dictionary = new Dictionary();
         var url:String = "./images/" + resPath + ".png";
         dic[resPath] = new AssetsItemData(url,AssetType.PNG,resPath);
         var loader:AssetsLoader = new AssetsLoader();
         loader.load(dic,{
            "onComplete":this.onImageLoadComplete,
            "onCompleteParms":[resPath,imageBitmapData]
         },1);
      }
      
      private function onImageLoadComplete(dic:Dictionary, key:String, imageBitmapData:Bitmap) : void
      {
         if(dic[key])
         {
            imageBitmapData.bitmapData = dic[key].data.bitmapData;
         }
      }
      
      public function SetBossStep(step:int) : void
      {
         this.m_iStep = step;
         if(step == 1 || step == 2)
         {
            this.img_yellow_normal.visible = false;
            this.img_red_normal.visible = false;
            this.img_purple_normal.visible = false;
            this.img_yellow_mask.visible = false;
            this.img_purple_mask.visible = false;
            this.img_red_mask.visible = true;
         }
         else
         {
            this.img_yellow_normal.visible = true;
            this.img_red_normal.visible = true;
            this.img_purple_normal.visible = true;
            this.img_yellow_mask.visible = true;
            this.img_purple_mask.visible = true;
            this.img_red_mask.visible = true;
         }
      }
      
      public function a_3510(numProgress:Number, allProgress:Number) : Boolean
      {
         var size:Number = NaN;
         var xPos:Number = NaN;
         var size2:Number = NaN;
         var xPos2:Number = NaN;
         if(numProgress <= 0)
         {
            numProgress = 0;
         }
         if(numProgress >= 1)
         {
            numProgress = 0.9999;
         }
         if(allProgress <= 0)
         {
            allProgress = 0;
         }
         if(allProgress > 1)
         {
            numProgress *= 1 / allProgress;
         }
         if(allProgress >= 1)
         {
            allProgress = 0.9999;
         }
         if(this.m_iStep == 1 || this.m_iStep == 2)
         {
            this.img_mask.width = numProgress * 436;
            size = allProgress * 436;
            this.img_mask2.width = size;
            xPos = 67 + size;
            this.img_cursor.visible = xPos > 77 && xPos < 495;
            this.img_cursor.x = xPos;
            this.ShowInArmor();
         }
         else
         {
            this.img_mask2.width = 436;
            if(numProgress > 0.9)
            {
               this.Show1Yellow2Purple();
            }
            else if(numProgress > 0.8)
            {
               this.Show1purple2Red();
            }
            else if(numProgress > 0.7)
            {
               this.Show1Red2Yellow();
            }
            else if(numProgress > 0.6)
            {
               this.Show1Yellow2Purple();
            }
            else if(numProgress > 0.5)
            {
               this.Show1purple2Red();
            }
            else if(numProgress > 0.4)
            {
               this.Show1Red2Yellow();
            }
            else if(numProgress > 0.3)
            {
               this.Show1Yellow2Purple();
            }
            else if(numProgress > 0.2)
            {
               this.Show1purple2Red();
            }
            else if(numProgress > 0.1)
            {
               this.Show1Red2Yellow();
            }
            else
            {
               this.img_yellow_normal.visible = false;
               this.img_red_normal.visible = false;
               this.img_purple_normal.visible = false;
               this.img_yellow_mask.visible = true;
               this.img_purple_mask.visible = false;
               this.img_red_mask.visible = false;
            }
            size2 = numProgress * 10 % 1 * 436;
            this.img_mask.width = size2;
            xPos2 = 67 + size2;
            this.img_cursor.visible = xPos2 > 77 && xPos2 < 495;
            this.img_cursor.x = xPos2;
         }
         return true;
      }
      
      private function ShowInArmor() : void
      {
         this.img_yellow_normal.visible = true;
         this.img_red_normal.visible = false;
         this.img_purple_normal.visible = false;
         this.img_yellow_mask.visible = false;
         this.img_purple_mask.visible = false;
         this.img_red_mask.visible = true;
      }
      
      private function Show1Yellow2Purple() : void
      {
         this.img_yellow_normal.visible = false;
         this.img_red_normal.visible = false;
         this.img_purple_normal.visible = true;
         this.img_yellow_mask.visible = true;
         this.img_purple_mask.visible = false;
         this.img_red_mask.visible = false;
      }
      
      private function Show1purple2Red() : void
      {
         this.img_yellow_normal.visible = false;
         this.img_red_normal.visible = true;
         this.img_purple_normal.visible = false;
         this.img_yellow_mask.visible = false;
         this.img_purple_mask.visible = true;
         this.img_red_mask.visible = false;
      }
      
      private function Show1Red2Yellow() : void
      {
         this.img_yellow_normal.visible = true;
         this.img_red_normal.visible = false;
         this.img_purple_normal.visible = false;
         this.img_yellow_mask.visible = false;
         this.img_purple_mask.visible = false;
         this.img_red_mask.visible = true;
      }
   }
}

