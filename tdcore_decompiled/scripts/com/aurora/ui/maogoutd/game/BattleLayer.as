package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class BattleLayer extends Sprite
   {
      
      public var m_vLayer:Vector.<BattleLayer>;
      
      private var m_bIsLayers:Boolean = false;
      
      public function BattleLayer(bIsLayers:Boolean, iLayerNum:int)
      {
         var i:int = 0;
         super();
         this.m_bIsLayers = bIsLayers;
         if(this.m_bIsLayers)
         {
            this.m_vLayer = new Vector.<BattleLayer>(7);
            for(i = 0; i < this.m_vLayer.length; i++)
            {
               this.m_vLayer[i] = new BattleLayer(false,iLayerNum);
            }
         }
         else if(iLayerNum > 0)
         {
            this.m_vLayer = new Vector.<BattleLayer>(iLayerNum);
            for(i = 0; i < this.m_vLayer.length; i++)
            {
               this.m_vLayer[i] = new BattleLayer(false,0);
               this.addChild(this.m_vLayer[i]);
            }
         }
      }
      
      override public function addChild(stChild:DisplayObject) : DisplayObject
      {
         if(stChild as a_4348)
         {
            (stChild as a_4348).GetCurrentBattleFieldView().AddToBattleView(stChild,BattleLayerDefine.SHOT_TYPE);
         }
         else if(stChild as a_4448)
         {
            if(this.parent as BattleLayerManager)
            {
               (this.parent as BattleLayerManager).AddToBattleView(stChild,BattleLayerDefine.EFFECTS_BASE_TYPE);
            }
            else if(this.parent.parent as BattleLayerManager)
            {
               (this.parent.parent as BattleLayerManager).AddToBattleView(stChild,BattleLayerDefine.EFFECTS_BASE_TYPE);
            }
            else
            {
               super.addChild(stChild);
            }
         }
         else
         {
            super.addChild(stChild);
         }
         return stChild;
      }
      
      override public function addChildAt(stChild:DisplayObject, index:int) : DisplayObject
      {
         if(stChild as a_4348)
         {
            (stChild as a_4348).GetCurrentBattleFieldView().AddToBattleView(stChild,BattleLayerDefine.SHOT_TYPE);
         }
         else if(stChild as a_4448)
         {
            if(this.parent as BattleLayerManager)
            {
               (this.parent as BattleLayerManager).AddToBattleView(stChild,BattleLayerDefine.EFFECTS_BASE_TYPE);
            }
            else if(this.parent.parent as BattleLayerManager)
            {
               (this.parent.parent as BattleLayerManager).AddToBattleView(stChild,BattleLayerDefine.EFFECTS_BASE_TYPE);
            }
            else
            {
               super.addChildAt(stChild,index);
            }
         }
         else
         {
            super.addChildAt(stChild,index);
         }
         return stChild;
      }
      
      public function AddToLayer(stDisplayObject:DisplayObject, stBindFieldGrid:a_3491, iLevel:int = -1) : void
      {
         if(this.m_bIsLayers)
         {
            this.m_vLayer[stBindFieldGrid.m_iYGridNo].AddToLayer(stDisplayObject,stBindFieldGrid,iLevel);
         }
         else
         {
            this.m_vLayer[iLevel].addChild(stDisplayObject);
         }
      }
   }
}

