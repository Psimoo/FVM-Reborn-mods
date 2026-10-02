package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.Bitmap;
   import flash.utils.setTimeout;
   
   public class CatHeadShot extends a_4348
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      public function CatHeadShot()
      {
         super();
         a_1279 = -width * 0.6;
         a_1576 = false;
         a_1577 = false;
         a_1588 = true;
         a_1304 = b_183.enm_CatHeadShot;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CatHeadShot,CatHeadShotMovie) as CatHeadShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CatHeadShot,CatHeadShot1Movie) as CatHeadShot;
      }
      
      private static function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap) : void
      {
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         if(stMouseScareBitmap.parent)
         {
            stMouseScareBitmap.parent.removeChild(stMouseScareBitmap);
         }
         stMouseScareBitmap.visible = false;
         if(-1 == ms_arrMouseScareBitmapArray.indexOf(stMouseScareBitmap))
         {
            ms_arrMouseScareBitmapArray.push(stMouseScareBitmap);
         }
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         return true;
      }
      
      override public function a_4352(stMoveIntruder:a_4206) : Boolean
      {
         var stScareBitmap:Bitmap = null;
         if(!stMoveIntruder.isFearCatHead)
         {
            return false;
         }
         var stFieldGrid:a_3491 = stMoveIntruder.m_stCurrentFieldGrid;
         var i:int = 0 == stMoveIntruder.globalMoveFighterID % 2 ? 1 : -1;
         if(0 == stFieldGrid.m_iYGridNo)
         {
            i = 1;
         }
         else if(BattleFieldView.a_1012 - 1 == stFieldGrid.m_iYGridNo)
         {
            i = -1;
         }
         var stTargetFieldGrid:a_3491 = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo + i);
         if(stFieldGrid.m_isNeedTray != stTargetFieldGrid.m_isNeedTray)
         {
            i *= -1;
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo + i);
         if(!stTargetFieldGrid || stFieldGrid.m_isNeedTray != stTargetFieldGrid.m_isNeedTray)
         {
            i = 0;
         }
         stFieldGrid.a_3457(stMoveIntruder);
         stFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
         var arrBaseMoveIntruderVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
         {
            arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
         }
         var stTempFieldGrid:a_3491 = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo + i);
         stScareBitmap = ms_arrMouseScareBitmapArray.pop();
         if(null == stScareBitmap)
         {
            stScareBitmap = new Bitmap();
            stScareBitmap.bitmapData = BitMapManager.getInstance().GetMouseScareBitmapData();
         }
         stScareBitmap.visible = true;
         if(stMoveIntruder.IsReversed())
         {
            stScareBitmap.scaleX = -1;
            stScareBitmap.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x + 7;
            stScareBitmap.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
         }
         else
         {
            stScareBitmap.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x - 7;
            stScareBitmap.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
         }
         stMoveIntruder.parent.addChildAt(stScareBitmap,stMoveIntruder.parent.getChildIndex(stMoveIntruder) + 1);
         BattleFieldView.a_1021.play();
         setTimeout(CatHeadShot.OnMouseScareTimeout,800,stFieldGrid.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTempFieldGrid,stScareBitmap);
         return true;
      }
   }
}

