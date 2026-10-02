package com.aurora.ui.maogoutd.resource.gamemap.newMap
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   
   public class BaseGameMoveMap extends BaseGameMap
   {
      
      protected var m_vMoveBlockMap:Vector.<MoveBlockMap>;
      
      protected var m_stBattleFieldView:BattleFieldView;
      
      public function BaseGameMoveMap()
      {
         super();
      }
      
      public function SetBattleFieldView(stBattleFieldView:BattleFieldView) : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         this.m_stBattleFieldView = stBattleFieldView;
         if(!this.m_vMoveBlockMap)
         {
            this.m_vMoveBlockMap = new Vector.<MoveBlockMap>();
            this.InitGameMoveMapData();
         }
         for each(stMoveBlockMap in this.m_vMoveBlockMap)
         {
            stMoveBlockMap.SetBattleFieldView(stBattleFieldView);
            stMoveBlockMap.MoveStart();
         }
      }
      
      protected function InitGameMoveMapData() : void
      {
         throw new Error("未初始化移动地图数据，该方法必须覆盖");
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         var hasMove:Boolean = false;
         for each(stMoveBlockMap in this.m_vMoveBlockMap)
         {
            if(stMoveBlockMap)
            {
               stMoveBlockMap.OnTimeInterval(iTimeNum);
               hasMove = true;
            }
         }
         if(hasMove && Boolean(this.m_stBattleFieldView))
         {
            this.m_stBattleFieldView.SortDisplayObject();
         }
      }
      
      public function AddMoveDisplayObject(stDisplayObject:DisplayObject, iXGridNo:int, iYGridNo:int) : void
      {
         var stShadowRefence:Bitmap = null;
         var bIsMoveBlock:Boolean = false;
         var stBlock:MoveBlockMap = null;
         if(stDisplayObject as a_3976)
         {
            if(!((stDisplayObject as a_3976).iToolType == 2 || (stDisplayObject as a_3976).m_iMoveByMap))
            {
               return;
            }
         }
         if(Boolean(stDisplayObject as a_3962) && Boolean((stDisplayObject as a_3962).m_stShadowRefence))
         {
            stShadowRefence = (stDisplayObject as a_3962).m_stShadowRefence;
            this.RemoveMoveDisplayObject(stShadowRefence);
         }
         this.RemoveMoveDisplayObject(stDisplayObject);
         for each(stBlock in this.m_vMoveBlockMap)
         {
            if(stBlock.a_3441(stDisplayObject,iXGridNo,iYGridNo))
            {
               if(bIsMoveBlock)
               {
                  throw new Error("添加到两个地图中去了，位置有重叠,坐标 >" + iXGridNo + ":" + iYGridNo);
               }
               bIsMoveBlock = true;
            }
         }
         if(bIsMoveBlock)
         {
            if(stShadowRefence)
            {
               this.AddMoveDisplayObject(stShadowRefence,iXGridNo,iYGridNo);
            }
         }
      }
      
      public function RemoveMoveDisplayObject(stDisplayObject:DisplayObject) : void
      {
         var stBlock:MoveBlockMap = null;
         for each(stBlock in this.m_vMoveBlockMap)
         {
            stBlock.a_3455(stDisplayObject);
         }
      }
      
      protected function ReleaseMoveMap() : void
      {
         var stMoveBlockMap:MoveBlockMap = null;
         for each(stMoveBlockMap in this.m_vMoveBlockMap)
         {
            stMoveBlockMap.ReleaseMoveMap();
         }
      }
      
      public function GetMoveBlockMap() : *
      {
         return this.m_vMoveBlockMap;
      }
   }
}

