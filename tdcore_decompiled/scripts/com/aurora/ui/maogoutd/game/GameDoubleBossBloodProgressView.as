package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import com.aurora.ui.maogoutd.resource.bitmap.BloodProgressMaskBitmapData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class GameDoubleBossBloodProgressView extends Sprite
   {
      
      public var m_stBloodProgressMaskBitmap1:Bitmap = new Bitmap();
      
      public var m_stBloodProgressMaskBitmap2:Bitmap = new Bitmap();
      
      private var a_1085:Rectangle = new Rectangle();
      
      private var a_1086:BitmapData = new BloodProgressMaskBitmapData(516,12,true,0);
      
      private var m_stBloodProgressMaskBitmapData1:BitmapData;
      
      private var m_stBloodProgressMaskBitmapData2:BitmapData;
      
      private var m_numBoss1BloodProgress:Number = 1;
      
      private var m_numBoss2BloodProgress:Number = 1;
      
      public var m_iMapID:int;
      
      public function GameDoubleBossBloodProgressView()
      {
         super();
         this.m_stBloodProgressMaskBitmapData1 = new BitmapData(516,12,true,0);
         this.m_stBloodProgressMaskBitmap1.bitmapData = this.m_stBloodProgressMaskBitmapData1;
         this.m_stBloodProgressMaskBitmap1.x = 57;
         this.m_stBloodProgressMaskBitmap1.y = 4;
         addChild(this.m_stBloodProgressMaskBitmap1);
         this.m_stBloodProgressMaskBitmapData2 = new BitmapData(516,12,true,0);
         this.m_stBloodProgressMaskBitmap2.bitmapData = this.m_stBloodProgressMaskBitmapData2;
         this.m_stBloodProgressMaskBitmap2.x = 57;
         this.m_stBloodProgressMaskBitmap2.y = 26;
         addChild(this.m_stBloodProgressMaskBitmap2);
         this.a_1797(0,0);
      }
      
      public function a_1797(iMapID:int, iBossNum:int, pendingAddMoveIntruderVector:Vector.<a_4269> = null) : Boolean
      {
         this.m_iMapID = iMapID;
         this.m_stBloodProgressMaskBitmap1.visible = true;
         this.m_stBloodProgressMaskBitmapData1.fillRect(this.m_stBloodProgressMaskBitmapData1.rect,0);
         this.m_stBloodProgressMaskBitmap2.visible = true;
         this.m_stBloodProgressMaskBitmapData2.fillRect(this.m_stBloodProgressMaskBitmapData2.rect,0);
         this.m_numBoss1BloodProgress = 1;
         this.m_numBoss2BloodProgress = 1;
         return true;
      }
      
      public function a_3510(numProgress:Number) : Boolean
      {
         if(numProgress > 1 && (this.m_iMapID & 0xF0000000) != 1610612736)
         {
            return false;
         }
         if(numProgress <= 0)
         {
            numProgress = 0;
         }
         if(numProgress < this.m_numBoss1BloodProgress && Math.abs(this.m_numBoss1BloodProgress - numProgress) <= Math.abs(this.m_numBoss2BloodProgress - numProgress))
         {
            this.m_numBoss1BloodProgress = numProgress;
         }
         else
         {
            this.m_numBoss2BloodProgress = numProgress;
         }
         this.m_stBloodProgressMaskBitmapData1.copyPixels(this.a_1086,this.a_1086.rect,new Point(0,0));
         this.a_1085.width = this.a_1086.width * this.m_numBoss1BloodProgress;
         this.a_1085.height = this.a_1086.height;
         this.m_stBloodProgressMaskBitmapData1.fillRect(this.a_1085,0);
         this.m_stBloodProgressMaskBitmapData2.copyPixels(this.a_1086,this.a_1086.rect,new Point(0,0));
         this.a_1085.width = this.a_1086.width * this.m_numBoss2BloodProgress;
         this.a_1085.height = this.a_1086.height;
         this.m_stBloodProgressMaskBitmapData2.fillRect(this.a_1085,0);
         return true;
      }
   }
}

