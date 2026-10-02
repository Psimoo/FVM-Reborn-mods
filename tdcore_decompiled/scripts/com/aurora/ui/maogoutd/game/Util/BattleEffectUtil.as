package com.aurora.ui.maogoutd.game.Util
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.resource.effect.BaseHitEffect;
   import com.aurora.ui.maogoutd.resource.effect.base.BaseOriginEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class BattleEffectUtil
   {
      
      public function BattleEffectUtil()
      {
         super();
      }
      
      public static function CreateGameEffect(effectClass:Class, gameMoveClipClass:Class, grid:a_3491) : BaseGameEffect
      {
         var effect:BaseGameEffect = null;
         effect = EffectManager.getInstance().CheckOutOne(effectClass,gameMoveClipClass);
         grid.m_stCurrentBattbleFieldView.AddToBattleView(effect,EffectManager.getInstance().GetMoveClip(gameMoveClipClass).moveClip.m_eLayer,grid);
         effect.x = a_3491.a_1080 * (grid.m_iXGridNo + 0.5);
         effect.y = a_3491.a_1081 * (grid.m_iYGridNo + 0.5);
         return effect;
      }
      
      public static function CreateGameEffect2(gameMoveClipClass:Class, grid:a_3491) : BaseGameEffect
      {
         return CreateGameEffect(BaseGameEffect,gameMoveClipClass,grid);
      }
      
      public static function CreateOriginEffect(effectClass:Class, gameMoveClipClass:Class, grid:a_3491) : BaseOriginEffect
      {
         var effect:BaseOriginEffect = null;
         if(effectClass == null)
         {
            effectClass = BaseOriginEffect;
         }
         effect = PoolManager.getInstance().CheckOutOne(effectClass,gameMoveClipClass) as BaseOriginEffect;
         effect.a_3014();
         grid.m_stCurrentBattbleFieldView.AddToBattleView(effect,effect.m_stMovieClip.m_eLayer,grid);
         effect.x = a_3491.a_1080 * (grid.m_iXGridNo + 0.5);
         effect.y = a_3491.a_1081 * (grid.m_iYGridNo + 0.5);
         return effect;
      }
      
      public static function CreateMouse(mouse:a_4206, stFieldGrid:a_3491, id:int) : void
      {
         mouse.a_1797((1 << 16) + stFieldGrid.m_iYGridNo + 100 + stFieldGrid.m_iXGridNo,-1);
         mouse.m_stMoveIntruderTypeID = id;
         stFieldGrid.m_stCurrentBattbleFieldView.a_3459(mouse,stFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         mouse.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         mouse.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
      }
      
      public static function AddHitEffect(baseMoveIntruder:a_4206, gameMoveClipClass:Class) : void
      {
         var effect:BaseGameEffect = null;
         effect = EffectManager.getInstance().CheckOutOne(BaseGameEffect,gameMoveClipClass);
         effect.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x;
         effect.y = baseMoveIntruder.y + 0.5 * baseMoveIntruder.height + baseMoveIntruder.stDisplayBitmap.y;
         baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,EffectManager.getInstance().GetMoveClip(gameMoveClipClass).moveClip.m_eLayer,baseMoveIntruder.m_stCurrentFieldGrid);
         effect.SetAnimation(0,true);
      }
      
      public static function AddHitEffectNew(baseMoveIntruder:a_4206, gameMoveClipClass:Class, stTagKey:String, maxSum:int = 1, hitEffectClass:Class = null, iLayer:int = -1) : void
      {
         var effect:BaseHitEffect = null;
         if(!baseMoveIntruder || baseMoveIntruder.iLifeValue <= 0 || !baseMoveIntruder.m_stCurrentFieldGrid)
         {
            return;
         }
         if(baseMoveIntruder.tagCom.GetSum(stTagKey) >= maxSum)
         {
            return;
         }
         if(hitEffectClass == null)
         {
            hitEffectClass = BaseHitEffect;
         }
         if(iLayer < 0)
         {
            iLayer = BattleLayerDefine.SHOT_TYPE;
         }
         effect = EffectManager.getInstance().CheckOutOne(hitEffectClass,gameMoveClipClass) as BaseHitEffect;
         effect.InitData(baseMoveIntruder,stTagKey);
         effect.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x;
         effect.y = baseMoveIntruder.y + 0.5 * baseMoveIntruder.height + baseMoveIntruder.stDisplayBitmap.y;
         baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,iLayer,baseMoveIntruder.m_stCurrentFieldGrid);
         effect.a_1797(baseMoveIntruder.IsReversed());
      }
      
      public static function AddHitEffectByShot(baseShot:a_4348, gameMoveClipClass:Class) : void
      {
         var effect:BaseGameEffect = null;
         effect = EffectManager.getInstance().CheckOutOne(BaseGameEffect,gameMoveClipClass);
         baseShot.GetCurrentBattleFieldView().AddToBattleView(effect,EffectManager.getInstance().GetMoveClip(gameMoveClipClass).moveClip.m_eLayer);
         effect.x = baseShot.x;
         effect.y = baseShot.y;
         effect.SetAnimation(0,true);
      }
   }
}

